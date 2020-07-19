%dw 2.0
output application/json
fun size(message) = if(sizeOf(message)> 245) 245 else (sizeOf(message)-1)
---
vars.uuid map 
{	
	"id": vars.sfdcPrimaryContactsResponse.data[$$].id ,
	"tuuid": $,
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if((vars.sfdcPrimaryContactsResponse.data[$$].success == true) and (vars.sfdcSecondaryContactsResponse.data[$$].success == true)) "Completed" else 'Error',
	"description": if((vars.sfdcPrimaryContactsResponse.data[$$].success == true) and (vars.sfdcSecondaryContactsResponse.data[$$].success == true)) "Spouses Contacts Record Insert or Updated in SFDC" else 
	(((vars.sfdcPrimaryContactsResponse.data[$$].errors.message) or (vars.sfdcSecondaryContactsResponse.data[$$].errors.message)) reduce($$++ ' , ' ++$))[0 to size(((vars.sfdcPrimaryContactsResponse.data[$$].errors.message) or (vars.sfdcSecondaryContactsResponse.data[$$].errors.message)) reduce($$++ ' , ' ++$))]
}