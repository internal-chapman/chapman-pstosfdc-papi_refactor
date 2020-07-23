%dw 2.0
output application/json
---
vars.AuxDataInsert map {
GUID: vars.uuid[$$] default '',
XC_AQ_SOURCE: 'PS-CS', 
XC_AQ_SOURCE_ID: $.emplID default '',  
XC_AQ_SOURCE_TYPE: p('auxDBColumns.XC_AQ_SOURCE_TYPE.contacts') default '',
XC_AQ_DESTINATION: '-',
XC_AQ_DEST_ID: '-',
XC_AQ_DEST_TYPE: p('auxDBColumns.XC_AQ_DEST_TYPE.contacts') default '',
XC_AQ_STATUS: 'In progress',
DTTM_CREATED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
DTTM_MODIFIED: now() as String {format: 'yyyy-MM-dd hh:mm:ss.SSS'},
XC_AQ_METADATA: 'CS to SFDC',
DESCR250: 'Non Spouses Contacts Data transfer from Campus Solution to SFDC'
}