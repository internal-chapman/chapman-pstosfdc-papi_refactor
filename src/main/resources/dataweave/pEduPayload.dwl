%dw 2.0
output application/java
---
payload ++ {"id": vars.data[0].Id}

