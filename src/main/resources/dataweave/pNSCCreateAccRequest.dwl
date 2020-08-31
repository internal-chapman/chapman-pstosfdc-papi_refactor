%dw 2.0
import * from dw::core::Strings
output application/json skipNullOn='everywhere'
---
vars.originalPayload default [] map ((emplDetails, index) -> {
	"RecordTypeId": "0122E000000h0RDQAY" as String,
	"Name": emplDetails.FIRST_NAME ++ " " default "" ++ emplDetails.LAST_NAME default "",
	"AQB__AccountExternalID__c": leftPad(emplDetails.EMPLID as String,9,"0"),
	"AQB__AccountDefaultStreet__c": emplDetails.STREET,
	"AQB__CAECategory__c": emplDetails.CAE,
	"AQB__AccountDefaultStatus__c": if(emplDetails.CITY != null)  "Good" else '--NONE--',
	"AQB__AccountDefaultStateProvince__c": emplDetails.STATEDESC,
	"AQB__AccountDefaultStateId__c": emplDetails.STATE,
	"AQB__AccountDefaultZipCode__c": emplDetails.POSTAL,
	"AQB__AccountType__c": "Household" as String,
	"AQB__AccountDefaultCounty__c": emplDetails.COUNTY,
	"AQB__AccountDefaultCountry__c": emplDetails.COUNTRYDESC,
	"AQB__AccountDefaultCountryId__c": emplDetails.COUNTRY,
	"AQB__AccountDefaultCity__c": emplDetails.CITY,
	"AQB__AccountDefaultPhone__c": vars.phoneNumber[index].PHONE default ""
})