%dw 2.0
import * from dw::core::Strings
output application/json
//vars.Id[$$] //"RecordType" : "Email"
var viewname = attributes.queryParams.ViewName
var obj = [vars.varCreateRecords]
var address = obj map (
	{
    "RecordTypeId" : vars.RecordType,		
	"AQB__AccountExternalIDLinkField__c": $."EMPLID",	
	"AQB__Street__c": $."ADDRESSLONG" default "",
    "AQB__Type__c": capitalize($."ADDRESS_TYPE") default "",
    "AQB__StreetLineOne__c": $."ADDRESS1" default "",
    "AQB__StreetLineTwo__c": $."ADDRESS2" default "",
    "AQB__StreetLineThree__c": $."ADDRESSLONG3" default "",
    "AQB__City__c": $."CITY" default "",
    "AQB__County__c": $."COUNTY" default "",
    "AQB__StateProvince__c": $."STATE_DESCR" default "",
    "AQB__CountryId__c": $."COUNTRY_CD" default "",
    "AQB__Country__c": $."COUNTRY_NM" default "",
    "AQB__StateId__c": $."STATE" default "",
    "AQB__PostalCode__c": $."POSTAL" default "",
    //"AQB__Account__c": vars.Id 
    
    "AQB__Account__r": {
			AQB__AccountExternalID__c: $."EMPLID",
			"type": 'Account'
		    } 
	}
)
var email= obj map{
	
	"RecordTypeId" : vars.RecordType,
    "AQB__AccountExternalIDLinkField__c": $."EMPLID",	
     "AQB__Account__r": {
			AQB__AccountExternalID__c: $."EMPLID",
			"type": 'Account'
		    } ,
    "AQB__Type__c": capitalize($.ADDRESS_TYPE) default "",
    "AQB__Email__c": $.EMAIL_ADDR default ""
} 

var phone= obj map{
  
  "AQB__Account__r": {
			AQB__AccountExternalID__c: $."EMPLID",
			"type": 'Account'
		    },
    "AQB__AccountExternalIDLinkField__c": $."EMPLID",
    "AQB__Phone__c": $."PHONE_TYPE"



}
---
 if(viewname ~= "email")
 email
 else if(viewname ~= "address")
 address
 else
 phone