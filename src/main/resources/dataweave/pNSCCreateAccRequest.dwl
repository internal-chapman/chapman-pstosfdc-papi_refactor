%dw 2.0
import * from dw::core::Strings
output application/json skipNullOn='everywhere'
---
vars.originalPayload default [] map ((indexOfDBConData, emplDetails) -> {
	"RecordTypeId": "0122E000000h0RDQAY" as String,
	"Name": indexOfDBConData.FIRST_NAME ++ " " default "" ++ indexOfDBConData.LAST_NAME default "",
	"AQB__AccountExternalID__c": leftPad(indexOfDBConData.EMPLID as String,9,"0"),
	"AQB__AccountDefaultStreet__c": indexOfDBConData.STREET,
	"AQB__CAECategory__c": indexOfDBConData.CAE,
	"AQB__AccountDefaultStatus__c": if(indexOfDBConData.CITY != null)  "Good" else '--NONE--',
	"AQB__AccountDefaultStateProvince__c": indexOfDBConData.STATEDESC,
	"AQB__AccountDefaultStateId__c": indexOfDBConData.STATE,
	"AQB__AccountDefaultZipCode__c": indexOfDBConData.POSTAL,
	"AQB__AccountType__c": "Household" as String,
	"AQB__AccountDefaultCounty__c": indexOfDBConData.COUNTY,
	"AQB__AccountDefaultCountry__c": indexOfDBConData.COUNTRYDESC,
	"AQB__AccountDefaultCountryId__c": indexOfDBConData.COUNTRY,
	"AQB__AccountDefaultCity__c": indexOfDBConData.CITY,
	"AQB__AccountDefaultPhone__c": if(indexOfDBConData.PRIMARYCONTACTTYPE == "Employee") "HOME" else "MAIN"
})