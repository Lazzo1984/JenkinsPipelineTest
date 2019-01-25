package com.dev.project2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApiAjaxCors")
public class ApiAjaxCors extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -733459179277875843L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	//	String path = this.getServletContext().getRealPath("TemplateAdmin2/DB.json");
		String path = "/home/cmgroup/REPO/upload/DB.json"; // in produzione
		
		System.out.println("(AJAX[/ApiAjaxCors])Retriving REPO/upload/DB.json ");
		
		BufferedReader reader = null;
		
		String jsonObject = "";
	
		try {
		    File file = new File(path);
		    reader = new BufferedReader(new FileReader(file));

		    String line;
		    while ((line = reader.readLine()) != null) {
		        	
		    	jsonObject += line;
		    	
		    }

		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
			if(reader != null)
			{
		    try {
		    	
		        reader.close();
		    } 
			catch (IOException e) {
		        e.printStackTrace();
		    }
			}
		}		
		
		resp.setContentType("application/json");
		resp.addHeader("Access-Control-Allow-Origin", "*");
		resp.setCharacterEncoding("UTF-8");
		try {
		PrintWriter out = resp.getWriter();
	
		out.print(jsonObject);
		out.flush();
		}
		catch(Exception ex)
		{
			/* ... */
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String funzione = req.getParameter("funzione");
		ControllerAnalitycs cA = new ControllerAnalitycs();
		try
		{
		PrintWriter out = resp.getWriter();
		
		String jsonObject = "";
		if(funzione.equals("aggregate"))
		{
		jsonObject = cA.jsonResponder();
		resp.setContentType("application/json");
		resp.addHeader("Access-Control-Allow-Origin", "*");
		resp.setCharacterEncoding("UTF-8");
		
		out.print(jsonObject);
		}
						
	  /*	out.flush() */
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
