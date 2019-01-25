package com.dev.project2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewReport")
public class ViewReport extends HttpServlet {

	static final String PATHREPORT = "/home/cmgroup/REPO/upload/";

	private static final long serialVersionUID = 4090873371910554342L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = PATHREPORT;

		String report = req.getParameter("Report");

		String referentecognome = "";
		// file path traversal

		if (req.getParameter("Report").contains("/")) {
			try
			{
			resp.sendRedirect("/project2/TemplateAdmin2/production/page_404_FTP.html");
			return;
			}
			catch(Exception ex)
			{
				/* squid */ 
			}
		}

		String filename = path + report + ".html";

		File x = new File(filename);

		if (!x.exists()) {
			try
			{
			resp.sendRedirect("/project2/TemplateAdmin2/production/page_404.html");
			return;
			}
			catch(Exception e)
			{
				/* squid */
			}
		}
		// utente loggato è il referente del progetto quindi del report VAPT?
		RequestValidator rv = new RequestValidator(req);
		referentecognome = rv.Validate();
		if ("".equals(referentecognome)) {
			return;
		}

		JsonDeserialize h = new JsonDeserialize();
		if (!"ALL".equals(referentecognome)) {
			
			if (!h.requestValidation(report, referentecognome)) {
				try
				{
				resp.sendRedirect("/project2/TemplateAdmin2/production/page_404_Access_Denied.html");
				return;
				}
				catch(Exception e)
				{
				/* */
				}
			}
		} 
		
		FileInputStream fis = new FileInputStream(filename);
		try		
		{
		
		int b = 0;
		while ((b = fis.read()) != -1) {
			resp.getOutputStream().write(b);
			resp.setContentType("text/html;charset=utf-8");

		}
		fis.close();
		}
		catch(Exception ex)
		{
	    /* */
		}
		finally {
			
				try
				{
				fis.close();
				}
				catch(Exception e)
				{
				/* */
				}
			
		}
		
	}

}
