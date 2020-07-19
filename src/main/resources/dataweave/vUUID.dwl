%dw 2.0
output application/json
---
uuid()[0 to 7] ++ uuid()[9]