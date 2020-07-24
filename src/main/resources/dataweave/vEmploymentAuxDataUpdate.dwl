%dw 2.0
output application/json
fun size(message) = if(sizeOf(message)> 245) 245 else (sizeOf(message)-1)
---
(vars.originalPayload default[]) map(value, index) ->{
	"id": payload[index].id default 'NA',
	"destType": p('auxDBColumns.XC_AQ_DEST_TYPE.employment'),
	"sourceType": p('auxDBColumns.XC_AQ_SOURCE_TYPE.employment'),
	"now": now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	"status": if(payload[index].success == true) "COMPLETED" else 'ERROR',// ERROR or COMPLETED
	"metadata": if(payload[index].success == true) "Record Insert or Updated in SFDC" else "Error while Insert or Update in SFDC",
	"description": if(payload[index].success == true) "Record Insert or Updated in SFDC" else (payload[index].errors.message reduce($$++ ' , ' ++$))[0 to size(payload[index].errors.message reduce($$++ ' , ' ++$))],
	"tuuid": vars.aux_insert_response[index].uuid
}