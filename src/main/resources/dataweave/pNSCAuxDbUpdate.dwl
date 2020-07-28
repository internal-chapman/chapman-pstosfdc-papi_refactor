%dw 2.0
output application/json
fun size(message) = if(sizeOf(message)> 245) 245 else (sizeOf(message)-1)
---
vars.uuid map 
{	
	"id": vars.sfdcPrimaryContactsResponse.data[$$].id ,
	"tuuid": $,
	"destType": p('auxDBColumns.XC_AQ_DEST_TYPE.contacts'),
	"sourceType": p('auxDBColumns.XC_AQ_SOURCE_TYPE.contacts'),
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if((vars.sfdcContactsResponse.data[$$].success == true)) "Completed" else 'Error',
	"metadata": if((vars.sfdcContactsResponse.data[$$].success  == true)) "Record Insert or Updated in SFDC" else "Error while Insert or Update in SFDC",
	"description": if((vars.sfdcContactsResponse.data[$$].success == true)) "Spouses Contacts Record Insert or Updated in SFDC" else 
	(((vars.sfdcContactsResponse.data[$$].errors.message))  reduce($$++ ' , ' ++$))[0 to size(((vars.sfdcContactsResponse.data[$$].errors.message)) reduce($$++ ' , ' ++$))]
}