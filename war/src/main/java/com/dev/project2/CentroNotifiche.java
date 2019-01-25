package com.dev.project2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CentroNotifiche")
public class CentroNotifiche extends HttpServlet {

	/**
	 * 
	 */
	protected static final String NOTIFIED = "notified";
	private static final long serialVersionUID = -4298004874381063063L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String provenienza = req.getParameter("provenienza");
	Integer indice = provenienza.lastIndexOf('/');
	String pagina = provenienza.substring(indice + 1);
	
	String cookievalue = cookieValue(NOTIFIED, req);
	/*a quanto pare con Tomcat 9 i cookie che contengono spazi vuoti non sono più ammessi */
	switch(pagina)
	{
	case "index.jsp" :
		resp.addCookie(new Cookie(NOTIFIED,cookievalue + "|index.jsp"));
		
		break;
	case "tables_dynamic.jsp" :
		resp.addCookie(new Cookie(NOTIFIED,cookievalue + "|vaptall"));
		break;
	case "tables_dynamic2.jsp" :
		resp.addCookie(new Cookie(NOTIFIED,cookievalue +"|vapt"));
		break;
	default :
		
		break;
	}
	
			
	}
	public String cookieValue(String name, HttpServletRequest req){
	
		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals(name)) {
		     //do something
		     return cookie.getValue();
		    }
		  }
		}
		return "unset";
	}

}
