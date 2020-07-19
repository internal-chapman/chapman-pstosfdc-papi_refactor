%dw 2.0
output application/json
---

 
payload map ((indexOfEmpl, emplDetails ) ->
	{
		emplID: indexOfEmpl.EmplID as String,
		LastUpdatedDate: indexOfEmpl.LastUpdatedDate as LocalDateTime as String {format: 'yyyy-MM-dd HH.mm.ss.SSSSSSSSS '}
	}
)