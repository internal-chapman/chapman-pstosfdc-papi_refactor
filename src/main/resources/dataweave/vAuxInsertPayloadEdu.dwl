%dw 2.0
output application/json
var gui = (vars.aux_data_insert default []) map (using(id = uuid())(id[0 to 7] ++  id[9]))
---
(vars.aux_data_insert default []) map {
GUID: gui[$$] default '',
XC_AQ_SOURCE: $.source default '', 
XC_AQ_SOURCE_ID: $.source_id default '',  
XC_AQ_SOURCE_TYPE: p('auxDBColumns.XC_AQ_SOURCE_TYPE.education') default '',
XC_AQ_DESTINATION: 'SFDC',
XC_AQ_DEST_ID: '-',
XC_AQ_STATUS: 'In Progress',
DTTM_CREATED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
DTTM_MODIFIED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
XC_AQ_METADATA: $.metadata default '',
DESCR250: $.description default '',
XC_AQ_DEST_TYPE: p('auxDBColumns.XC_AQ_DEST_TYPE.education')
}