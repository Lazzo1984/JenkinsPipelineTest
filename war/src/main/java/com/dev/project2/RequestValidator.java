package com.dev.project2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


public class RequestValidator {
	Cookie[] cookies ;
	public RequestValidator(HttpServletRequest request)
	{
		cookies = request.getCookies();
		
	}
	public String Validate()
	{
		String _referente_cognome = "";
		if(cookies != null){
		for(Cookie cookie : cookies)
		{
			if (cookie.getName().equals("scope")) {
			     String referente = cookie.getValue();
			     String[] r = referente.split("\\.");
			     _referente_cognome = r[0];
			     break;
			    }
			
		}
		return _referente_cognome;
		}
		return "";
	}

}
