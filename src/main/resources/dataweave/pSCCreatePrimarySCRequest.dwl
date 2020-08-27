%dw 2.0 
import * from dw::core::Strings
output application/json skipNullOn='everywhere'
import modules::funConType

fun addressPrefCalc(ADDRESSPREF)=
    if (ADDRESSPREF == "Account Mailing") 
    		"Account Mailing"
    else if (ADDRESSPREF == "Alternate") 
    		"Alternate"
    else if (ADDRESSPREF == "")
    		"Business"
    else null

fun emailPerfCalc(EMAILPREF)=
    if (EMAILPREF == "Personal Email") 
    		"Personal Email"
    else if (EMAILPREF == "Business Email") 
    		"Business Email"
    else if (EMAILPREF == "School Email") 
    		"School Email"
    else if ((EMAILPREF == "") or (EMAILPREF == null))
    		"Other Email"
    else null     

fun salutationCalc(SALUTATION)=
    if ((SALUTATION == "mr") or (SALUTATION == "mr.") or (SALUTATION == "Mr") or (SALUTATION == "Mr."))
    		"Mr."
    else if ((SALUTATION == "ms") or (SALUTATION == "miss") or (SALUTATION == "ms.") or (SALUTATION == "Ms")or (SALUTATION == "Ms."))
    		"Ms."
    else if ((SALUTATION == "mrs") or (SALUTATION == "mrs.") or (SALUTATION == "Mrs") or (SALUTATION == "Mrs."))
    		"Mrs."
    else if ((SALUTATION == "dr") or (SALUTATION == "Dr") or (SALUTATION == "dr.") or (SALUTATION == "Dr.")or (SALUTATION == "Doctor")or (SALUTATION == "doc")or (SALUTATION == "Doc")or (SALUTATION == "doc.")or (SALUTATION == "Doc."))
    		"Dr."
    else if ((SALUTATION == "Professor") or (SALUTATION == "Prof") or (SALUTATION == "professor") or (SALUTATION == "prof")or (SALUTATION == "prof.")or (SALUTATION == "Prof."))
    			"Prof."
    else null                            
---
vars.originalPayload default [] map (indexOfConData, details)->{
	
	"AQB__ContactExternalID__c": leftPad(indexOfConData.EmplID, 9, "0"),
	"Salutation" : salutationCalc(indexOfConData.Salutation),	
	"FirstName": indexOfConData.FirstName as String,
	"LastName" : indexOfConData.LastName as String,
	"Suffix": indexOfConData."Suffix",
	"MiddleName": indexOfConData.MiddleName as String,
	"AQB__MaidenName__c" : indexOfConData.MaidenName,
	"AQB__Nickname__c": indexOfConData.Nickname,
	"AQB__CAECategory__c" : indexOfConData.Emp_CAE,
	"AQB__Type__c":indexOfConData."PrimaryContactType",
	"AQB__SecondaryType__c":"",	
	"AQB__AddressInUseType__c" : addressPrefCalc(indexOfConData.AddressPref),
	"AQB__PersonalEmail__c" : indexOfConData.Email,
    "AQB__BusinessEmail__c" : indexOfConData.BusinessEmail,
    "AQB__SchoolEmail__c" : indexOfConData.SchoolEmail,
    "AQB__OtherEmail__c": indexOfConData."OtherEmail",
	"AQB__EmailPreference__c": emailPerfCalc(indexOfConData.EmailPreference),
	"MobilePhone": indexOfConData."Mobile",
	"OtherPhone": indexOfConData."Otherphone",
	"AQB__PhonePreference__c":"",
	"AQB__Gender__c": indexOfConData.Gender,
	"AQB__MaritalStatus__c" : indexOfConData.MaritalStatus,
	"AQB__PlaceofBirth__c": indexOfConData.Birthplace,
	"Birthdate" : indexOfConData.Birthdate as Date as String {format: 'YYYY-MM-DD'}  default "",
	"AQB__Ethnicity__c":indexOfConData."Ethnicity",
	"AQB__PrimaryGiftRecognitionCredit_Percent__c": "100",
	"AQB__SecondaryGiftRecognitionCreditPercent__c":"100"
}