%dw 2.0
output application/java
fun RelType (RelTypeValue: String) =
    if (RelTypeValue == "Contact")
    		"Business"
	else if (RelTypeValue == "Friend")
   			"Friend"
   	else
   		"Family"
---
payload default[] map (indexOfDBConData,dbConData)->{
		"RecordTypeId": "0122E000000h0SVQAY",
		"AQB__ContactId__r": {
			"AQB__ContactExternalID__c": indexOfDBConData.EMPLID,
			"type": 'Contact'
			},
		"AQB__Contact__r":  {
			"AQB__ContactExternalID__c": indexOfDBConData.EMPLID,
			"type": 'Contact'
			},
		"AQB__EndDate__c": indexOfDBConData.RELENDDATE,
		"AQB__Ended__c": indexOfDBConData.RELENDED,
		"AQB__RelatedTo__c": indexOfDBConData.RELATEDEMPLID,
		//"AQB__RelatedName__c": indexOfDBConData.RELNAME,
		"AQB__Relationship__c": "Parent",//indexOfDBConData.RELATIONSHIP-- This is hardcoded for now, To be changed to picklist,
		"AQB__ReverseRelationship__c": "Child",//indexOfDBConData.REVRELATIONSHIP--This is hardcoded for now, To be changed to picklist,
		"AQB__StartDate__c": indexOfDBConData.STARTDATE as Date {format: "yyyy-MM-dd'T'HH:mm:ss"} ,
		"AQB__Started__c": indexOfDBConData.STARTED,
		"AQB__Relationship_Type__c": RelType(indexOfDBConData.RELATIONSHIP as String),
		"AQB__Source__c": "Campus Solution"	
}