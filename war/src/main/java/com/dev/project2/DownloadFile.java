package com.dev.project2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadFile")
public class DownloadFile extends HttpServlet {
	static final long serialVersionUID = 1L;
	static final String REPORT = "report";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter(REPORT) == null) {
			return;
		}

		String[] splitreport = request.getParameter(REPORT).split("\\.html");// METTI E TOGLI QUANDO BASTAva togliere un
																				// .html da javascript
		String report = splitreport[0];
		String referentecognome = "";
		// file path traversal path
		if (request.getParameter(REPORT).contains("/")) {
			try {
				response.sendRedirect("/project2/TemplateAdmin2/production/page_404_FTP.html");
				return;
			} catch (Exception ex) {
				/* ... */
			}
		}
		// primo layer who is who ?
		RequestValidator rv = new RequestValidator(request);
		referentecognome = rv.Validate();
		if ("".equals(referentecognome))

		{
			return;
		}

		JsonDeserialize h = new JsonDeserialize();

		if (!"ALL".equals(referentecognome)) {
			if (!h.requestValidation(report, referentecognome)) {
				try {
					response.sendRedirect("/project2/TemplateAdmin2/production/page_404_Access_Denied.html");
					return;
				} catch (Exception ex) {
					/* ... */
				}
			}
		}

		else {
			/* ... */
		}
		// vediamo se esiste su filesistem
		String filename = "/home/cmgroup/REPO/upload/" + report + ".html";
		File x = new File(filename);
		if (!x.exists()) {
			try {
				response.sendRedirect("/project2/TemplateAdmin2/production/page_404.html");
				return;
			} catch (Exception ex) {
				/* .... */
			}
		}

		// if you want to use a relative path to context root:

		File downloadFile = new File(filename);
		try (FileInputStream inStream = new FileInputStream(downloadFile)) {

			// obtains ServletContext
			ServletContext context = getServletContext();

			// gets MIME type of the file
			String mimeType = context.getMimeType(filename);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/octet-stream";
			}
			System.out.println("MIME type: " + mimeType + report);

			// modifies response
			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());

			// forces download
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			// obtains response's output stream
			OutputStream outStream = response.getOutputStream();

			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			inStream.close();
			outStream.close();
		} catch (IOException ex) {
			/* .. */
		}

	}
}
