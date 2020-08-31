%dw 2.0
output application/json skipNullOn='everywhere'
fun x(index) = vars.sfdcPrimaryContactsResponse.data[index].id
fun y(index)=vars.sfdcSecondaryContactsResponse.data[index].id
---
 vars.sfdcAccountsResponse.id default [] map (item, index) ->
 {
  AQB__AccountExternalID__c: item,
  AQB__PrimaryContact__c: x(index),
  AQB__SecondaryContact__c:y(index),
  Name: vars.originalPayload[0].AccountName
 }