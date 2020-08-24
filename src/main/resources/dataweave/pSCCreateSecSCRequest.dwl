%dw 2.0 
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
	
	"AQB__ContactExternalID__c": indexOfConData.SpouseEmplID,
	"Salutation" : salutationCalc(indexOfConData.SpouseSalutation),	
	"FirstName": indexOfConData.SpouseFirstName as String,
	"LastName" : indexOfConData.SpouseLastName as String,
	"Suffix": indexOfConData.SpouseSuffix,
	"MiddleName": indexOfConData.SpouseMiddleName as String,
	"AQB__MaidenName__c" : indexOfConData.SpouseMaidenName,
	"AQB__Nickname__c": indexOfConData.SpouseNickname,
	"AQB__CAECategory__c" : indexOfConData.SpouseCAE,
	"AQB__Type__c":indexOfConData.SpousePrimaryContactType,
	"AQB__SecondaryType__c":"",	
	"AQB__AddressInUseType__c" : addressPrefCalc(indexOfConData.AddressPref),
	"AQB__PersonalEmail__c" : indexOfConData.SpouseEmail,
    "AQB__BusinessEmail__c" : indexOfConData.SpouseBusinessEmail,
    "AQB__SchoolEmail__c" : indexOfConData.SpouseSchoolEmail,
    "AQB__OtherEmail__c": indexOfConData.SpouseOtherEmail,
	"AQB__EmailPreference__c": emailPerfCalc(indexOfConData.SpouseEmailPreference),
	"MobilePhone": indexOfConData.SpouseMobile,
	"OtherPhone": indexOfConData.SpouseOtherphone,
	"AQB__PhonePreference__c":"",
	"AQB__Gender__c": indexOfConData.SpouseGender,
	"AQB__MaritalStatus__c" : indexOfConData.SpouseMaritalStatus,
	"AQB__PlaceofBirth__c": indexOfConData.SpouseBirthplace,
	"Birthdate" : indexOfConData.SpouseBirthdate as LocalDateTime as String {format: 'yyyy-MM-dd'}  default "",
	"AQB__Ethnicity__c":indexOfConData.SpouseEthnicity,
	"AQB__PrimaryGiftRecognitionCredit_Percent__c": "",
	"AQB__SecondaryGiftRecognitionCreditPercent__c":"100%",
}