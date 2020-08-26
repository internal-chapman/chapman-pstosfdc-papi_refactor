%dw 2.0
output application/json skipNullOn='everywhere'
fun x(index) = vars.sfdcContactsResponse.data[index].id
---
vars.sfdcAccountsResponse.id default [] map (item, index) -> {
	Name: vars.originalPayload[0].FIRST_NAME ++ " " default "" ++ vars.originalPayload[0].LAST_NAME default "",
	AQB__AccountExternalID__c: item,
	AQB__PrimaryContact__c: x(index)
}