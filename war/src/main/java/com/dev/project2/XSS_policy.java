package com.dev.project2;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;
// the method compliant String is no longer in use due to Java.Filter implementation mo è di nuovo in uso invece
//import java.util.regex.*;

public class XSS_policy {
	public String compliantString(String untrustedHTML)  // Metodo #1 the best
	{
	
		 PolicyFactory policy = new HtmlPolicyBuilder()
		            .allowAttributes("src").onElements("img")
		            .allowAttributes("href").onElements("a")
		            .allowStandardUrlProtocols()
		            .allowElements("a", "img").toFactory();
			    

		String safeHTML = policy.sanitize(untrustedHTML);
		return safeHTML;
	}
	public String RegexSanitizer(String input)       // Metodo #2 Regex XSS viene rilevato ma è di tipo firm
	{
		String cleaned = input.replaceAll("<[^>]*>", "");
		return cleaned;
	}
	public String stringToHTMLEntities(String string) {  // Metodo # 3 efficace contro Xss
		  if (string == null) {
		    return "";
		  }
		 
		  StringBuffer sb = new StringBuffer(string.length());
		 
		  boolean lastWasBlankChar = false;
		  int len = string.length();
		  char c;
		 
		  for (int i = 0; i < len; i++) {
		    c = string.charAt(i);
		 
		    if (c == ' ') {
		      if (lastWasBlankChar) {
		        lastWasBlankChar = false;
		        sb.append("&nbsp;");
		      } else {
		        lastWasBlankChar = true;
		        sb.append(' ');
		      }
		    } else {
		      lastWasBlankChar = false;
		 
		      if (c == '"') {
		        sb.append("&quot;");
		      } else if (c == '&') {
		        sb.append("&amp;");
		      } else if (c == '<') {
		        sb.append("&lt;");
		      } else if (c == '>') {
		        sb.append("&gt;");
		      } else if (c == 'n') {
		        sb.append("n");
		      } else if (c == 39) { //check for apostrophe character
		        sb.append("&#39;");
		      } else {
		        int ci = 0xffff & c;
		 
		        if (ci < 160) {
		          sb.append(c);
		        } else {
		          sb.append("&#");
		          sb.append(new Integer(ci).toString());
		          sb.append(';');
		        }
		      }
		    }
		  }
		 
		  return sb.toString();
		}
}
