%dw 2.0
output application/json
fun size(message) = if(sizeOf(message)> 245) 245 else (sizeOf(message)-1)
---
vars.uuid map 
{	
	"id": vars.sfdcPrimaryContactsResponse.data[$$].id default "-" ,
	"tuuid": $,
	"destType": p('auxDBColumns.XC_AQ_DEST_TYPE.contacts'),
	"sourceType": p('auxDBColumns.XC_AQ_SOURCE_TYPE.Spouses'),
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if((vars.sfdcPrimaryContactsResponse.data[$$].success == true) and (vars.sfdcSecondaryContactsResponse.data[$$].success == true)) "COMPLETED" else 'ERROR',
	"metadata": if((vars.sfdcPrimaryContactsResponse.data[$$].success  == true) and (vars.sfdcSecondaryContactsResponse.data[$$].success == true)) "Record Insert or Updated in SFDC" else "Error while Insert or Update in SFDC",
	"description": if((vars.sfdcPrimaryContactsResponse.data[$$].success == true) and (vars.sfdcSecondaryContactsResponse.data[$$].success == true)) "Spouses Contacts Record Insert or Updated in SFDC" else 
	"Error while upserting the data in salesforce"
}