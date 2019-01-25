<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>XSS test page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  pre
  {
  margin:0 0 0 0;
  }
  </style>
</head>
<body>

<div class="container">
  <h2>Pagina di test per Cross Site Scripting: usare solo in FireFox </h2>
  <h3>HTML Sanitizer</h3>
  <form class="form-horizontal" action="${pageContext.request.contextPath}/Test2" method="post" class="">
    <div class="form-group">
      <label class="col-sm-2 control-label">#1 Inserisci il XSS script</label>
      <div class="col-sm-10">
        <input class="form-control" id="focusedInput" type="text" name="stringa" >
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">#2 Abilita il filtro XSS true/false</label>
      <div class="col-sm-10">
     <!--    <input class="form-control" id="focusedInput" type="text" name="xss_enabled" placeholder="true" required> -->
        <select class="form-control" id="sel1" name="xss_enabled" placeholder="true">
        <option>true</option>
        <option>false</option>
        
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">#3 Invia la richiesta</label>
      <div class="col-sm-10">
        <button class="btn btn-lg btn-danger btn-block" type="submit" value="button" name="bottone">POST</button>
      </div>
    </div>
    
     <div class="form-group">
      <label class="col-sm-2 control-label">#4 Cio che vedi nel browser</label>
      <div class="col-sm-10">
      <div style="border-top:2px;">
       <table>
   			  <tr>	
   			  		<td><%=request.getAttribute("Name_one") %></td>
       			    
  			  </tr>
  			  
		</table>
		</div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">#5 Ciò che viene inserito nel DOM</label>
      <div class="col-sm-10">
       <table>
   			  
  			  <tr>
  			  		<td><%=request.getAttribute("Name")%></td>
  			  </tr>
		</table>
      </div>
    </div>
  </form>
  <h3>JDK &gt;= 1.7 di compilazione e di runtime</h3>
  <pre>
  <code>
&lt;dependency&gt;
&lt;groupId&gt;com.googlecode.owasp-java-html-sanitizer&lt;/groupId&gt;
&lt;artifactId&gt;owasp-java-html-sanitizer&lt;/artifactId&gt;
&lt;version&gt;20171016.1&lt;/version&gt;
&lt;/dependency&gt;

&lt;dependency&gt;
&lt;groupId&gt;com.google.guava&lt;/groupId&gt;
&lt;artifactId&gt;guava&lt;/artifactId&gt;
&lt;version&gt;11.0.2&lt;/version&gt;
&lt;/dependency&gt;
  </code>
  </pre>
  <pre>
  <code>
package project;
<b>import org.owasp.html.HtmlPolicyBuilder;</b>
<b>import org.owasp.html.PolicyFactory;</b>

public class <b>XSS_policy</b> {
	public String <b>compliantString</b>(String untrustedHTML)
	{
	
		 PolicyFactory policy = new HtmlPolicyBuilder()
		            .allowAttributes("src").onElements("img")
		            .allowAttributes("href").onElements("a")
		            .allowStandardUrlProtocols()
		            .allowElements("a", "img").toFactory();
			    

		String safeHTML = policy.sanitize(untrustedHTML);
		return safeHTML;
	}
}
  </code>
  </pre>
  <pre>
  <code>
package project;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.lang.StringEscapeUtils;

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
		//super.doPost(req, resp);
		<b>XSS_policy xsspol = new XSS_policy();</b>
		String <b>param</b> = req.getParameter("stringa");
		String param2 = req.getParameter("xss_enabled");
		
		if(param2.equals("true"))
		{	
		String <b>clean</b> = <b>xsspol</b>.compliantString(param);</b>
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/JSP/Test.jsp");
		req.setAttribute("Name_one", <b>clean</b> );
		req.setAttribute("Name", <b>clean</b>);
		dispatcher.forward( req, resp );
		}
		// Qui invece se il parametro della POST xss_enabled è settato a false non viene invocato HTML Sanitizer
		// ed avrai il XSS
		else if(param2.equals("false"))
		{
			RequestDispatcher dispatcher = req.getRequestDispatcher("/JSP/Test.jsp");
			req.setAttribute("Name_one", param);
			req.setAttribute("Name", param);
			dispatcher.forward( req, resp );
		}
		else
		{
			resp.sendRedirect("JSP/Test.jsp");
		}
	}
	}
  </code>
  </pre>
</div>

</body>
</html>