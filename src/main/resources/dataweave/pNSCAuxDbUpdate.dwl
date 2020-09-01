%dw 2.0
fun size(message) =
  if (sizeOf(message) > 245)
    245
  else
    (sizeOf(message) - 1)
output application/json
---
vars.uuid map(value, index) -> {
	"id": vars.sfdcContactsResponse.data[index].id default "N/A",
	"tuuid": value,
	"destType": p('auxDBColumns.XC_AQ_DEST_TYPE.contacts'),
	"sourceType": p('auxDBColumns.XC_AQ_SOURCE_TYPE.nonSpouses'),
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if(vars.sfdcContactsResponse != null) (if ((vars.sfdcContactsResponse.data[index].success == true))
      "Completed"
    else
      'Error') else 'Error',
	"metadata": if(vars.sfdcContactsResponse != null) (if ((vars.sfdcContactsResponse.data[index].success == true))
      "Record Insert or Updated in SFDC"
    else
      "Error while Insert or Update in SFDC") else "Error while Insert or Update in SFDC",
	"description": if(vars.sfdcContactsResponse != null) (if ((vars.sfdcContactsResponse.data[index].success == true))
      "Non Spouses Contacts Record Insert or Updated in SFDC"
    else if ((vars.sfdcContactsResponse.data[index].success == false))
      ((vars.sfdcContactsResponse.data[index].errors.message) reduce ($$ ++ ' , ' ++ $))[0 to size((vars.sfdcContactsResponse.data[index].errors.message) reduce ($$ ++ ' , ' ++ $))]
    else
      "Error Occurred") else "Error while Insert or Update in SFDC"
}