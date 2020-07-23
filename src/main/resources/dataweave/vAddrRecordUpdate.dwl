%dw 2.0
import * from dw::core::Strings
output application/json
var viewname = attributes.queryParams.ViewName
var obj = [vars.varUpdateRecords]
var address=obj map (
	{
	"Id": $."Id" default "",
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
    "AQB__PostalCode__c": $."POSTAL" default ""
    
	}
)
var email= obj map{
     
    "Id": $."Id" default "",
    "AQB__Type__c": capitalize($.ADDRESS_TYPE),
    "AQB__Email__c": $.EMAIL_ADDR
} 

var phone= obj map{
  
  
    "AQB__Phone__c": $."PHONE_TYPE"



}
---
 if(viewname ~= "email")
 email
 else if(viewname ~= "address")
 address
 else
 phone