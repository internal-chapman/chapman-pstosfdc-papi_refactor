%dw 2.0
fun ConType (ConTypeValue: String) =
    if ((ConTypeValue == "Alumni Bachelors") or (ConTypeValue == "Alumni Certificate") or (ConTypeValue == "Alumni Credential") or (ConTypeValue == "Alumni Doctorate") or 
    	(ConTypeValue == "Alumni Honorary") or (ConTypeValue == "Alumni Law") or (ConTypeValue == "Alumni Law JD") or (ConTypeValue == "Alumni Law Masters") or (ConTypeValue == "Alumni Law Non-Degree") or 
    	(ConTypeValue == "Alumni Masters") or (ConTypeValue == "Alumni Non-Degree") or (ConTypeValue == "Alumni Specialist (EDS)") or (ConTypeValue == " Associates Alumni") or (ConTypeValue == "Univ College Employee - Faculty")) 
    		"Alumni"
	else if ((ConTypeValue == "Board of Governors") or (ConTypeValue == "Board of Governors Emerti") or (ConTypeValue == "Board of Governors Ex Officio") or (ConTypeValue == "Board of Governors Membert") or 
		(ConTypeValue == "Board of Trustees") or (ConTypeValue == "Board of Trustees Emerti") or (ConTypeValue == "Board of Trustees Ex Officio")  or (ConTypeValue == "Board of Trustees Member") 
        or (ConTypeValue == "Emerti"))
			"Corporate Contact"
    else if ((ConTypeValue == "Administrator") or (ConTypeValue == "Faculty;") or (ConTypeValue == "Full-Time") or (ConTypeValue == "Lecturer;") or (ConTypeValue == "President's Cabinet") 
    	or (ConTypeValue == "Staff"))
			"Employee" 
	else if ((ConTypeValue == "Alumni - University College") or  (ConTypeValue == "Alumni Unknown") or (ConTypeValue == "Constituent;Friend") or  (ConTypeValue == "Historical Employee") 
		or  (ConTypeValue == "Historical Faculty") or  (ConTypeValue == "Spouse of Alumni") or  (ConTypeValue == "Univ  College Alumni Credential") or  (ConTypeValue == "Univ College Alumni Associates")
		 or  (ConTypeValue == "Univ College Alumni Bachelor’s") or  (ConTypeValue == "Univ College Alumni Certificate")  or  (ConTypeValue == "Univ College Alumni Doctorate") 
		 or  (ConTypeValue == "Univ College Alumni Master’s") or  (ConTypeValue == "Univ College Alumni Non-Degree") 
		 or  (ConTypeValue == "Univ College Alumni Unknown"))
		 "Friend"
	else if ((ConTypeValue == "Deposited Parent") or (ConTypeValue == "Parent"))
			"Parent"
	else if (ConTypeValue == "Grandparent")
			"Grandparent"
	else
			"Graduate; Graduate Applicant; Graduate Health Sciences; Graduate Health Sciences Applicant;
			Law; Law Applicant; Student Worker; Undergraduate Applicant; Undergraduate Student"