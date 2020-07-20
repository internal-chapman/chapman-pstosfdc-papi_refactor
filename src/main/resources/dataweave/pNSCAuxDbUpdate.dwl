%dw 2.0
output application/json
fun size(message) = if(sizeOf(message)> 245) 245 else (sizeOf(message)-1)
---
vars.uuid map 
{	
	"id": vars.sfdcContactsResponse.data[$$].id ,
	"tuuid": $,
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if(vars.sfdcContactsResponse.data[$$].success == true)  "Completed" else 'Error',
	"description": if(vars.sfdcContactsResponse.data[$$].success == true)  "non Spouses Contacts Record Insert or Updated in SFDC" else 
	((vars.sfdcContactsResponse.data[$$].errors.message) reduce($$++ ' , ' ++$))[0 to size( (vars.sfdcContactsResponse.data[$$].errors.message) reduce($$++ ' , ' ++$))]
}