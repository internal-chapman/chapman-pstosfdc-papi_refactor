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
	
	"AQB__ContactExternalID__c": indexOfConData.SpouseEmplID,
	"FirstName": indexOfConData.SpouseFirstName as String,
	"LastName" : indexOfConData.SpouseLastName as String,
	"MiddleName": indexOfConData.SpouseMiddleName as String,
	"AQB__MaidenName__c" : indexOfConData.SpouseMaidenName,
	"AQB__AddressInUseType__c" : addressPrefCalc(indexOfConData.PermAddrPref),
    "AQB__CAECategory__c" : indexOfConData.Emp_CAE,
    //"MailingAddress" : indexOfConData.MAILPREF,
    "MailingStreet" : indexOfConData.PermStreet,
    "MailingCity" : indexOfConData.PermCity,
    'MailingState': indexOfConData.StateDescr,
    'MailingPostalCode': indexOfConData.PermPostal_Zip,
    'MailingCountry': indexOfConData.PermCountry,
    //"AQB__DateofDeath__c": indexOfConData.DECEASEDDATE,
    "AQB__Deceased__c": indexOfConData.AccountStatus as String as Boolean,
    "AQB__EmailPreference__c": emailPerfCalc(indexOfConData.SpouseEmailPreference),
    "AQB__Gender__c": indexOfConData.SpouseGender,
    "AQB__MaritalStatus__c" : indexOfConData.MaritalStatus,
    "AQB__PlaceofBirth__c": indexOfConData.SpouseBirthplace,
   // "Birthdate" : indexOfConData.SpouseBirthdate as LocalDateTime as String {format: 'MM/dd/yyyy'}  default null,
    "Email" : indexOfConData.SpouseEmail,
    "AQB__PersonalEmail__c" : indexOfConData.SpouseEmail,
    "AQB__BusinessEmail__c" : indexOfConData.SpouseEmail,
    "AQB__SchoolEmail__c" : indexOfConData.SpouseEmail,
   // "Salutation" : salutationCalc(indexOfConData.SALUTATION),
    //"AQB__SalutationLink__c": indexOfConData.SALUTATION,
    "AQB__CountryId__c" : indexOfConData.PermCountryId,
	"AQB__County__c" : indexOfConData.PermCounty,
	"AQB__Type__c": funConType::ConType(indexOfConData.AffDescShort as String),
	"AQB__SecondaryType__c": indexOfConData.AffDescShort

}