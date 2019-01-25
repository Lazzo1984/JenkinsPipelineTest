package com.dev.project2;


import java.io.IOException;
import java.io.PrintWriter;

//import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.lang.StringEscapeUtils;

// this class serves to test against timeouts connections 
// before send back a response it hangs 10 sec
// from the other side we expect a resonse within less than 10 sec

@WebServlet("/Test")
public class Test extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		resp.sendRedirect("JSP/Test.jsp");
				
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
	
		XSS_policy xsspol = new XSS_policy();
		String param = "";String param2 = "";String param3 = "";
		 param = req.getParameter("stringa");
		 param2 = req.getParameter("xss_enabled");
		 param3 = req.getParameter("AuthToken");
		// String[] sdfsdf = req.getParameterValues("stringa");
		// verificare gli headers
			if(param == null || param2 == null)
			{
				return ;
			}
		if(param2.equals("true"))
		{	
			
		 String clean = xsspol.compliantString(param);          // the best so far  => questo è totalmete pulito
		// String clean = xsspol.RegexSanitizer(param);          // regular expr <[^>]*>  XSS high ma di tipo Firm
		//   String clean = xsspol.stringToHTMLEntities(param);   // html encodings  => input trnasformation
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/JSP/Test.jsp");
			req.setAttribute("Name_one", "<figure><pre><code contenteditable spellcheck=\"false\">" + clean + "</code></pre></figure>");
			req.setAttribute("Name", "<figure><pre><code contenteditable spellcheck=\"false\">" + clean + "</code></pre></figure>");
			resp.addHeader("Test-Xss", "PeppeOlimone");
			dispatcher.forward( req, resp );
		}
		else if(param2.equals("false"))
		{
			RequestDispatcher dispatcher = req.getRequestDispatcher("/JSP/Test.jsp");
			req.setAttribute("Name_one", "<figure><pre><code contenteditable spellcheck=\"false\">" + param + "</code></pre></figure>");
			req.setAttribute("Name", "<figure><pre><code contenteditable spellcheck=\"false\">" +  xsspol.stringToHTMLEntities(param) + "</code></pre></figure>");
			dispatcher.forward( req, resp );
		
		}
		else if(param3.equals("A1EN7CNJ"))
		{
			PrintWriter out= resp.getWriter();
			out.print("true");
		}
		else
		{
			resp.sendRedirect("JSP/Test.jsp");
		}
	}
	}

