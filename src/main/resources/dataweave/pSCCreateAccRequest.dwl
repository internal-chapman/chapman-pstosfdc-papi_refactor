%dw 2.0
import * from dw::core::Strings
output application/json skipNullOn='everywhere'

---
vars.originalPayload default [] map ((indexOfDBConData, emplDetails ) ->
    {		
		"RecordTypeId": "0122E000000h0RDQAY" as String,
		"AQB__AccountExternalID__c": "00" ++ indexOfDBConData.EmplID,		
		"AQB__AccountDefaultStreet__c": indexOfDBConData."PermStreet",
		"AQB__CAECategory__c": indexOfDBConData.Emp_CAE,
		"AQB__AccountDefaultStatus__c": "Good" as String,
		"AQB__AccountDefaultStateProvince__c":indexOfDBConData."PermStateDescr",
		"AQB__AccountDefaultStateId__c": indexOfDBConData.PermState,
		"AQB__AccountDefaultZipCode__c": indexOfDBConData.PermPostal_Zip,
		"AQB__AccountType__c": "Household" as String,
		"AQB__AccountDefaultCounty__c": indexOfDBConData.PermCounty,
		"AQB__AccountDefaultCountry__c": indexOfDBConData.PermCountry,
		"AQB__AccountDefaultCountryId__c":indexOfDBConData."PermCountryId",
		"AQB__AccountDefaultCity__c": indexOfDBConData.PermCity,
		"AQB__AccountDefaultPhone__c": if (capitalize(indexOfDBConData.Emp_CAE) == "Employee" or capitalize(indexOfDBConData.SpouseCAE) == "Employee" ) "HOME" else "MAIN",
		"Name": indexOfDBConData.AccountName
 	}
 )