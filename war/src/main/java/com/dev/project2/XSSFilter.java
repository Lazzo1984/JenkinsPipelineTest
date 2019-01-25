package com.dev.project2;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public final class XSSFilter implements Filter {

	public static class FilteredRequest extends HttpServletRequestWrapper {

		public FilteredRequest(ServletRequest request) {
			super((HttpServletRequest) request);
		}

		public static String sanitize(String input) {
			PolicyFactory policy = new HtmlPolicyBuilder().allowAttributes("src").onElements("img")
					.allowAttributes("href").onElements("a").allowStandardUrlProtocols().allowElements("a", "img")
					.toFactory();

			return policy.sanitize(input);

		}

		@Override
		public String getParameter(String paramName) {
			String value = super.getParameter(paramName);

			return sanitize(value);
		}

		@Override
		public String[] getParameterValues(String paramName) {
			String[] values = super.getParameterValues(paramName);

			for (int index = 0; index < values.length; index++) {
				values[index] = sanitize(values[index]);
			}

			return values;
		}

		@Override
		public String getQueryString() {
			String value = super.getQueryString();

			return sanitize(value);
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		chain.doFilter(new FilteredRequest(request), response);
	}

	public void destroy() {
		/* (squid:S1186) */
	}

	public void init(FilterConfig filterConfig) {
		/* (squid:S1186) */
	}
}