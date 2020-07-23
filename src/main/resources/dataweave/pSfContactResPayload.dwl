%dw 2.0
output application/json
---
{
	id: vars.contactsExternalID,
	data: payload
}