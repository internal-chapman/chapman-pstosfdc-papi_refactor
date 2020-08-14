%dw 2.0
output application/json
fun gui() = using(id = uuid())(id[0 to 7] ++  id[9])
---
payload map (value, index) -> {
	GUID: gui() default '',
	XC_AQ_SOURCE: "PS-CS",
	XC_AQ_SOURCE_ID: value.EMPLID default '',
	XC_AQ_SOURCE_TYPE: p('auxDBColumns.XC_AQ_SOURCE_TYPE.employment') default '',
	XC_AQ_DESTINATION: '-',
	XC_AQ_DEST_ID: '-',
	XC_AQ_DEST_TYPE: p('auxDBColumns.XC_AQ_DEST_TYPE.employment') default '',
	XC_AQ_STATUS: 'IN PROGRESS',
	DTTM_CREATED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	DTTM_MODIFIED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
	XC_AQ_METADATA: "CS to SFDC",
	DESCR250: "Employee data transfer from Campus Solution to SFDC"
}