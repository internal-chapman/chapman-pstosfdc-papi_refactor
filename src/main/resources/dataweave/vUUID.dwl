%dw 2.0
output application/json
---
using(id = uuid())(id[0 to 7] ++  id[9])