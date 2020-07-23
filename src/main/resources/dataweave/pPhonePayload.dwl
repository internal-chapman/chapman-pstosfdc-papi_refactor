%dw 2.0
output application/json
var obj=[payload]
---
obj map{
  
  
   "EMPLID":  $."EMPLID",
  "COUNTRY_CODE": $."COUNTRY_CODE",
  "PHONE_TYPE": $."PHONE_TYPE",
  "EXTENSION": $."EXTENSION",
  "PHONE": $."PHONE",
  "PREF_PHONE_FLAG": $."PREF_PHONE_FLAG"


}