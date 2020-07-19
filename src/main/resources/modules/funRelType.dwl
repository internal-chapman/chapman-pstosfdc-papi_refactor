%dw 2.0
fun RelType (RelTypeValue: String) =
    if (RelTypeValue == "Contact")
    		"Business"
	else if (RelTypeValue == "Friend")
   			"Friend"
   	else
   		"Family"