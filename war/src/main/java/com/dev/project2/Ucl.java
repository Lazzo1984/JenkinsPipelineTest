package com.dev.project2;

import java.io.File;
import java.lang.SuppressWarnings;
//import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
//import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ucl")
@SuppressWarnings("all")
public class Ucl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("all")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		try {
		out.print(metodo());
	
		
		} catch ( InvocationTargetException | IllegalArgumentException | SecurityException |NoSuchMethodException | ClassNotFoundException | InstantiationException | IllegalAccessException | IOException e) {
		
			e.printStackTrace();
		} 
	}	
	@SuppressWarnings("all")
	public String metodo() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, InstantiationException, ClassNotFoundException, IOException
	{
		URL oracledriver = new URL("file:///root/Desktop/BLL_HACK/ojdbc14-10.2.0.4.jar");
	    URL connector = new URL("file:///root/Desktop/BLL_HACK/JDK16/reflection/Sql_conn.jar");	
		
		/* works
		URL oracledriver = new URL("http://10.202.98.4/ojdbc14-10.2.0.4.jar");
	    URL connector = new URL("http://10.202.98.4/JDK16/reflection/Sql_conn.jar");	    
		*/
	    
	    java.net.URL[] urls = new URL[] {oracledriver, connector};
	    java.net.URLClassLoader ucl = new URLClassLoader(urls);
	    	
	    java.lang.Class<?> istanza = ucl.loadClass("Main");
	    	    
	   // java.lang.reflect.Method m = istanza.getMethod("M2", new java.lang.Class[0]);  // funziona anche così in realtà 
	    /* Method m = istanza.getMethod("M2")
	    variante #1
	    java.lang.reflect.Method m2 = istanza.getDeclaredMethod("M2");// Object m3 = istanza.getMethod("M2", null); no parameters
	    m2.setAccessible(true);	    
	    Object t = istanza.newInstance();	 	           
	    Object value = m2.invoke(t);
	    String k = (String)value;
	    */
	    	  
        // variante #2
	   // Object t = istanza.newInstance();
	    String kop =  (java.lang.String)istanza.getMethod("M2").invoke(istanza.newInstance());   
	          
	     ucl.close();
	     return kop;
	}
	
	
}
