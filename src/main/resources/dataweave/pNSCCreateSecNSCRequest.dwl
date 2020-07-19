%dw 2.0
output application/json skipNullOn='everywhere'
fun x(index) = vars.sfdcContactsResponse.data[index].id
---
 vars.sfdcAccountsResponse.id default [] map (item, index) ->
 {
  AQB__AccountExternalID__c: item,
  AQB__PrimaryContact__c: x(index)
 }