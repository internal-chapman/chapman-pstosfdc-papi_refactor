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
	"AQB__AccountExternalID__c": indexOfDBConData.EMPLID,
	"Name": indexOfDBConData."FIRST_NAME" ++ " " ++ indexOfDBConData."LAST_NAME" default '',
	"AQB__AccountStatus__c": accStatus(indexOfDBConData.DECEASED as String),
	"AQB__AccountDefaultStreet__c": indexOfDBConData.STREET,
	"AQB__AccountDefaultStatus__c": "Good" as String default '',
	"AQB__AccountDefaultCity__c": indexOfDBConData.CITY,
	"AQB__AccountDefaultStateId__c": indexOfDBConData.STATE,
	"AQB__AccountDefaultZipCode__c": indexOfDBConData.POSTAL,
	"AQB__AccountDefaultCountry__c": indexOfDBConData.COUNTRY,
	"AQB__AccountDefaultCounty__c": indexOfDBConData.COUNTY,
	"AQB__CAECategory__c": indexOfDBConData.CAE,
	"BillingStreet": indexOfDBConData.STREET,
	"BillingCity": indexOfDBConData.CITY,
	"BillingState": indexOfDBConData.STATE,
	"BillingPostalCode": indexOfDBConData.POSTAL,
	"BillingCountry": indexOfDBConData.COUNTRY,
	"AQB__Email__c": indexOfDBConData.EMAIL
 	}
 )