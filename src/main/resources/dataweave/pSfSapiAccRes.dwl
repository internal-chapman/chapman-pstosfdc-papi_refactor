%dw 2.0
output application/json
---
{
	id: vars.accountExternalID,
	data: payload
}