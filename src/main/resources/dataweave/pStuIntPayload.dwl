%dw 2.0
output application/java
---
payload map(value, index) ->{
		//"AQB__Contact__c": "HYPERLINK( {AQB__ContactId__c: " ++ ("000195970" default '') ++ ",type: 'Education'}  , {AQB__ContactId__c.FirstName: " ++ ("000195970" default '') ++ ",type: 'Contact'}  , {AQB__ContactId__c.LastName: " ++ ("000195970" default '') ++ " ,type: 'Contact'} , _self)",
		/*"AQB__EducationLink__r": {
			"AQB__Contact__r": {
			AQB__ContactExternalID__c: "0000013", //value.EMPLID ,
			"type": 'Contact'
			},
			"type": "AQB__Education__c"
		},*/
		AQB__EducationLink__c: "",
		"AQB__InterestType__r": {
			Name: "Mortar Board National Honor Society",//value.DESCR_GROUP_TYPE,
			"type": 'AQB__LLStudentInterestType__c'
			}, //
		"AQB__Position__c": value.DESCR_POSITION,
		"AQB__StartDay__c": value.START_DT_DAY as String,
		"AQB__StartMonth__c": value.START_DT_MONTH as String,
		"AQB__StartYear__c": value.START_DT_YEAR as String,
		"AQB__StopDay__c": value.END_DT_DAY as String,
		"AQB__StopMonth__c": value.END_DT_MONTH as String,
		"AQB__StopYear__c": value.END_DT_YEAR as String
}