%dw 2.0
output application/json skipNullOn='everywhere'
fun accStatus (deathStatus) =
    if (deathStatus == "True") 
    		"INACTIVE"
    else 
    		"Active"

---
vars.originalPayload default [] map ((indexOfDBConData, emplDetails ) ->
    {		
		"RecordTypeId": "0122E000000h0RDQAY" as String,
	"AQB__AccountType__c": "Household" as String,
	"AQB__AccountExternalID__c": indexOfDBConData.EmplID,
	"Name": indexOfDBConData.AccountName as String default '',
	"AQB__AccountStatus__c": accStatus(indexOfDBConData.AccountStatus as String),
	"AQB__AccountDefaultStreet__c": indexOfDBConData.PermAddress,
	"AQB__AccountDefaultStatus__c": "Good" as String default '',
	"AQB__AccountDefaultCity__c": indexOfDBConData.PermCity,
	"AQB__AccountDefaultStateId__c": indexOfDBConData.PermState,
	"AQB__AccountDefaultZipCode__c": indexOfDBConData.PermPostal_Zip,
	"AQB__AccountDefaultCountry__c": indexOfDBConData.PermCountry,
	"AQB__AccountDefaultCounty__c": indexOfDBConData.PermCounty,
	"AQB__CAECategory__c": indexOfDBConData.Emp_CAE,
	"BillingStreet": indexOfDBConData.PermStreet,
	"BillingCity": indexOfDBConData.PermCity,
	"BillingState": indexOfDBConData.PermState,
	"BillingPostalCode": indexOfDBConData.PermPostal_Zip,
	"BillingCountry": indexOfDBConData.PermCountry,
	"AQB__Email__c": indexOfDBConData.Email
 	}
 )