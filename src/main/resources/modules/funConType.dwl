%dw 2.0
fun ConType (ConTypeValue: String) =
    if (ConTypeValue == "Alumnus") 
    		"Alumnus"
	else if (ConTypeValue == "Corporate Contact")
			"Corporate Contact"
    else if (ConTypeValue == "Employee")
			"Employee"
	else if (ConTypeValue == "Friend")
   			"Friend"
	else if (ConTypeValue == "Parent")
			"Parent"

	else
			"Patient"