%dw 2.0
output application/java
fun Status(status) 
= status match {
	case 'active' -> 'Active'
	case 'retired' -> 'Retired'
	case 'historic' -> 'Historic'
	else -> 'Unknown'
}
---
payload map(value, index) ->{
		"AQB__ContactId__r": {
			AQB__ContactExternalID__c: value.EMPLID ,
			"type": 'Contact'
			},
		"AQB__Contact__r": {
			AQB__ContactExternalID__c: value.EMPLID ,
			"type": 'Contact'
		},
		"AQB__LinkedEmployer__r":{
			"AQB__AccountExternalID__c": value.EMPLID,
			"type": 'Account'
		},
		"AQB__EmployerName__c": value.EMPLOYER,
		"AQB__EndDate__c": if(sizeOf(value.END_DT default '') > 0) value.END_DT as Date {format: "yyyy-MM-dd'T'HH:mm:ss"} else '',
		"AQB__Ended__c": value.XC_AQ_ENDED,
		"AQB__StartDate__c": if(sizeOf(value.START_DT default '') > 0 ) value.START_DT as Date {format: "yyyy-MM-dd'T'HH:mm:ss"} else '',
		"AQB__Started__c": value.XC_AQ_STARTED,
		"AQB__Status__c": Status(lower(value.SCC_STATUS_DESCR)),
		"AQB__Title__c": value.BUSINESS_TITLE,
		"AQB__EmploymentExternalID__c" : value.EMPLID
}