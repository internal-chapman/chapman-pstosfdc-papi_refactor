%dw 2.0
output application/json
var obj=[payload]
---
obj map{
  
  
    "EMPLID": $."EMPLID",
    "EMAIL_ADDR": $."EMAIL_ADDR",
    "PREF_EMAIL_FLAG": $."PREF_EMAIL_FLAG",
    "ADDRESS_TYPE": capitalize($."E_ADDR_TYPE")


}