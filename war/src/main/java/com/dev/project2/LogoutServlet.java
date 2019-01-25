package com.dev.project2;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	
    //	Cookie loginCookie = null;
    //	Cookie scopeCookie = null;
    	Cookie[] cookies = request.getCookies();
    	
    	if(cookies != null){
    	for(Cookie cookie : cookies){
    		if((cookie.getName().equals("scope"))){
    			cookie.setMaxAge(0);
    			response.addCookie(cookie);
    		
    		}
    		if((cookie.getName().equals("user"))){
    			cookie.setMaxAge(0);
    			response.addCookie(cookie);
    			
    		}
    		if((cookie.getName().equals("unique"))){
    			cookie.setMaxAge(0);
    			response.addCookie(cookie);
    			
    		}
    		if((cookie.getName().equals("OU"))){
    			cookie.setMaxAge(0);
    			response.addCookie(cookie);
    			
    		}
    		if((cookie.getName().equals("notified"))){
    			cookie.setMaxAge(0);
    			response.addCookie(cookie);
    			
    		}
    	}
    	}
    	//if(loginCookie != null){
    	//	loginCookie.setMaxAge(0);
    	//	scopeCookie.setMaxAge(0);
        //	response.addCookie(loginCookie);
        //	response.addCookie(scopeCookie);
    //	}
    	response.sendRedirect("Servlet");
    }

}
