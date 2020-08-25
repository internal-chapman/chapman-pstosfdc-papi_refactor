%dw 2.0
import modules::funConType
fun addressPrefCalc(ADDRESSPREF) =
  if (ADDRESSPREF == "Account Mailing")
    "Account Mailing"
  else if (ADDRESSPREF == "Alternate")
    "Alternate"
  else if (ADDRESSPREF == "")
    "Business"
  else
    null
fun emailPerfCalc(EMAILPREF) =
  if (EMAILPREF == "Personal Email")
    "Personal Email"
  else if (EMAILPREF == "Business Email")
    "Business Email"
  else if (EMAILPREF == "School Email")
    "School Email"
  else if ((EMAILPREF == "") or (EMAILPREF == null))
    "Other Email"
  else
    null
fun salutationCalc(SALUTATION) =
  if ((SALUTATION == "mr") or (SALUTATION == "mr.") or (SALUTATION == "Mr") or (SALUTATION == "Mr."))
    "Mr."
  else if ((SALUTATION == "ms") or (SALUTATION == "miss") or (SALUTATION == "ms.") or (SALUTATION == "Ms") or (SALUTATION == "Ms."))
    "Ms."
  else if ((SALUTATION == "mrs") or (SALUTATION == "mrs.") or (SALUTATION == "Mrs") or (SALUTATION == "Mrs."))
    "Mrs."
  else if ((SALUTATION == "dr") or (SALUTATION == "Dr") or (SALUTATION == "dr.") or (SALUTATION == "Dr.") or (SALUTATION == "Doctor") or (SALUTATION == "doc") or (SALUTATION == "Doc") or (SALUTATION == "doc.") or (SALUTATION == "Doc."))
    "Dr."
  else if ((SALUTATION == "Professor") or (SALUTATION == "Prof") or (SALUTATION == "professor") or (SALUTATION == "prof") or (SALUTATION == "prof.") or (SALUTATION == "Prof."))
    "Prof."
  else
    null
output application/json  skipNullOn='everywhere'
---
vars.originalPayload default [] map (indexOfConData, details) -> {
	"AQB__ContactExternalID__c": indexOfConData.EMPLID,
	"Salutation": salutationCalc(indexOfConData.SALUTATION),
	"FirstName": indexOfConData.FIRST_NAME as String,
	"LastName": indexOfConData.LAST_NAME as String,
	"Suffix": indexOfConData.SUFFIX,
	"MiddleName": indexOfConData.MIDDLE_NAME as String,
	"AQB__MaidenName__c": indexOfConData.MAIDEN_NAME,
	"AQB__Nickname__c": indexOfConData.MCF_NICKNAME,
	"AQB__CAECategory__c": indexOfConData.CAE,
	"AQB__Type__c": indexOfConData.PRIMARYCONTACTTYPE,
	"AQB__SecondaryType__c": indexOfConData.POSSIBLESECONDARYTYPES,
	"AQB__AddressInUseType__c": addressPrefCalc(indexOfConData.ADDRESSPREF),
	"AQB__PersonalEmail__c": indexOfConData.EMAIL,
	"AQB__BusinessEmail__c": indexOfConData.BUSINESSEMAIL,
	"AQB__SchoolEmail__c": indexOfConData.SCHOOLEMAIL,
	"AQB__OtherEmail__c": indexOfConData.OTHEREMAIL,
	"AQB__EmailPreference__c": emailPerfCalc(indexOfConData.EMAILPREF),
	"MobilePhone": indexOfConData.Mobile,
	"OtherPhone": indexOfConData.Otherphone,
	"AQB__Gender__c": indexOfConData.GENDER,
	"AQB__MaritalStatus__c": indexOfConData.MARITALSTATUS,
	"AQB__PlaceofBirth__c": indexOfConData.BIRTHPLACE,
	"Birthdate": indexOfConData.BIRTHDATE as LocalDateTime {format: "yyyy-MM-dd'T'HH:mm:ss"} as String {format: 'YYYY-MM-DD'} default '',
	"AQB__Ethnicity__c": indexOfConData.ETHNICITY,
	"AQB__PrimaryGiftRecognitionCredit_Percent__c": "100",
	"AQB__SecondaryGiftRecognitionCreditPercent__c": "100"
}