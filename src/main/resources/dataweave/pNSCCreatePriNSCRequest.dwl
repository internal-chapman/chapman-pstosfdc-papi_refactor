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

//mrs, mrs., Mrs, Mrs. --> Mrs.
// dr, Dr, dr., Dr., Doctor, doc, Doc, doc., Doc. --> Dr.
// Professor, Prof, professor, prof, prof., Prof. --> Prof.

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
	
	"AQB__ContactExternalID__c": indexOfConData.EMPLID,
	"FirstName": indexOfConData.FIRST_NAME as String,
	"LastName" : indexOfConData.LAST_NAME as String,
	"MiddleName": indexOfConData.MIDDLE_NAME as String,
	"AQB__MaidenName__c" : indexOfConData.MAIDEN_NAME,
	"AQB__AddressInUseType__c" : addressPrefCalc(indexOfConData.ADDRESSPREF),
    "AQB__CAECategory__c" : indexOfConData.CAE,
    //"MailingAddress" : indexOfConData.MAILPREF,
    "MailingStreet" : indexOfConData.STREET,
    "MailingCity" : indexOfConData.CITY,
    'MailingState': indexOfConData.STATEDESC,
    'MailingPostalCode': indexOfConData.POSTAL,
    'MailingCountry': indexOfConData.COUNTRYDESC,
    "AQB__DateofDeath__c": indexOfConData.DECEASEDDATE,
    "AQB__Deceased__c": indexOfConData.DECEASED as String as Boolean,
    "AQB__EmailPreference__c": emailPerfCalc(indexOfConData.EMAILPREF),
    "AQB__Gender__c": indexOfConData.GENDER,
    "AQB__MaritalStatus__c" : indexOfConData.MARITALSTATUS,
    "AQB__PlaceofBirth__c": indexOfConData.BIRTHPLACE,
   // "Birthdate" : indexOfConData.BIRTHDATE as LocalDateTime as String {format: 'MM/dd/yyyy'}  default null,
    "Email" : indexOfConData.EMAIL,
    "AQB__PersonalEmail__c" : indexOfConData.EMAIL,
    "AQB__BusinessEmail__c" : indexOfConData.EMAIL,
    "AQB__SchoolEmail__c" : indexOfConData.EMAIL,
    "Salutation" : salutationCalc(indexOfConData.SALUTATION),
    //"AQB__SalutationLink__c": indexOfConData.SALUTATION,
    "AQB__CountryId__c" : indexOfConData.COUNTRY,
	"AQB__County__c" : indexOfConData.COUNTY,
	"AQB__Type__c": funConType::ConType(indexOfConData.AFFDESCSHORT as String),
	"AQB__SecondaryType__c": indexOfConData.AFFDESCSHORT

}