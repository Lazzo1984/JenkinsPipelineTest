package com.dev.project2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewOldReport")
public class ViewOldReport extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static String pathreport = "/home/cmgroup/REPO/upload/Old_Report/";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = pathreport;

		String report = req.getParameter("Report");
		String elettra = report.replaceAll("\\s\\([0-9]\\)", "");

		String referentecognome = "";
		// file path traversal

		if (req.getParameter("Report").contains("/")) {
			try {
			resp.sendRedirect("/project2/TemplateAdmin2/production/page_404_FTP.html");
			return;
			}
			catch(Exception ex)
			{
				/* ... */
			}
		}

		// esiste il file ?
		// String filename = "/home/cmgroup/REPO/upload/" + req.getParameter("Report") +
		

		String filename = path + report + ".html";

		File x = new File(filename);

		if (!x.exists()) {
			try {
			resp.sendRedirect("/project2/TemplateAdmin2/production/page_404.html");
			return;
			}
			catch(Exception ex)
			{
				/* ... */
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
			if (!h.requestValidation(elettra, referentecognome)) {
				try {
				resp.sendRedirect("/project2/TemplateAdmin2/production/page_404_Access_Denied.html");
				return;
				}
				catch(Exception ex)
				{
					/* ... */
				}
			}
		} else {
			/* ... */
		}

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(filename);
			int b = 0;
			while ((b = fis.read()) != -1) {
				resp.getOutputStream().write(b);
				resp.setContentType("text/html;charset=utf-8");

			}
			fis.close();
		} catch (Exception e) {
			/* ... */
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception ex) {
					/* ... */
				}
			}
		}
	}
}
