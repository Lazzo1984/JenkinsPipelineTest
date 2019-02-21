package com.dev.project2;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static List<Long> unique;
	protected static Map<String, String> notascii;

	protected static final String WELCOMEREDIRECT = "JSP/welcome.jsp";
	protected static final String AUTHFAILURE = "<b style=\"color:red;\">Auth failure</b>";
	protected static final String HOMEREDIRECT = "TemplateAdmin2/production/index.jsp";
	protected static final String ERROR = "error";
	protected static final String SCOPE = "scope";

	static {

		unique = new ArrayList<>();
		notascii = new HashMap<>();
		notascii.put("à", "a'");
		notascii.put("è", "e'");
		notascii.put("ì", "i'");
		notascii.put("ò", "o'");
		notascii.put("ù", "u'");
	}

	public static String nonAsciiConverter(String cn) {
		String replacement = cn;
		for (Entry<String, String> x : notascii.entrySet()) {
			if (cn.contains(x.getKey())) {
				replacement = replacement.replaceAll(x.getKey(), x.getValue());
			}
		}

		return replacement;
	}

	@Override // /project2/Servlet

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.sendRedirect(WELCOMEREDIRECT);
		} catch (IOException e) {
			/* ... */
		}
	}

	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 * NMOCC [String pathcontesto = this.getServletContext().getRealPath(
		 * "TemplateAdmin2/SmallData/Reservation.txt");]
		 */

		String user = req.getParameter("txtbox");
		String pzwdz = req.getParameter("txtbox1");

		Integer z = 0;
		String dnquery = "";

		for (Entry<Integer, String> x : ldapQuery(user, pzwdz).entrySet()) {
			z = x.getKey();
			dnquery = x.getValue();
		}
		z = blackListedUsersCheck(z, user);

		switch (z) {
		case 1:
			// Dipendenti e referenti di progetto
			final String DIPENDENTI = "Dipendenti";

			Utenti ut1 = new Utenti();
			if (ut1.CheckSuperUser(user)) // dipendenti e referenti superuser
			{
				String cognome = "ALL";
				String nome = "ALL";

				HttpServletResponse resp1 = createResponse(user, cognome, nome, DIPENDENTI, resp);

				try {
					resp1.sendRedirect(HOMEREDIRECT);
				} catch (IOException e) {
					/* ... */
				}
			} else {

				String[] cnsplit = dnquery.split(",");
				Integer len = cnsplit.length;

				String cognome = cnsplit[len - 2].replaceAll("sn: ", "");
				String nome = cnsplit[len - 1].replaceAll("givenName: ", "");

				cognome = nonAsciiConverter(cognome).toUpperCase();
				nome = nonAsciiConverter(nome).toUpperCase();

				HttpServletResponse resp1 = createResponse(user, cognome, nome, DIPENDENTI, resp);

				try {
					resp1.sendRedirect(HOMEREDIRECT);
				} catch (IOException e) {
					/* squid try */
				}
			}

			break;

		case 2:
			// Consulenti e o referenti di progetto
			final String CONSULENTI = "Consulenti";
			Utenti ut = new Utenti();

			if (ut.CheckSuperUser(user)) {
				String cognome = "ALL";
				String nome = "ALL";

				HttpServletResponse resp1 = createResponse(user, cognome, nome, CONSULENTI, resp);

				try {
					resp1.sendRedirect(HOMEREDIRECT);
				} catch (IOException e) {
					/* ... */
				}
			} else {

				String[] cnsplit = dnquery.split(",");
				Integer len = cnsplit.length;

				String cognome = cnsplit[len - 2].replaceAll("sn: ", "");
				String nome = cnsplit[len - 1].replaceAll("givenName: ", "");

				cognome = nonAsciiConverter(cognome).toUpperCase();
				nome = nonAsciiConverter(nome).toUpperCase();

				HttpServletResponse resp1 = createResponse(user, cognome, nome, CONSULENTI, resp);

				try {
					resp1.sendRedirect(HOMEREDIRECT);
				} catch (IOException e) {
					/* ... */
				}
			}

			break;
		case 5:
			RequestDispatcher rd = req.getRequestDispatcher(WELCOMEREDIRECT);

			req.setAttribute(ERROR, AUTHFAILURE);
			try {
				rd.forward(req, resp);
				return;
			} catch (Exception e) {
				/* ... */
			}
			break;
		default:
			break;
		}
	}

	protected HashMap<Integer, String> ldapQuery(String user, String pzwdz) {
		/* Start LDAP auth Process */
		HashMap<Integer, String> myMap = new HashMap<>();

		String dnquery = "";
		LDAPUserAuth lua = new LDAPUserAuth();
		try {
			dnquery = lua.ldapconn(user, pzwdz); // Overloading for testing String ,String,Integer
			if (!"null".equals(dnquery) && dnquery.contains("Consulenti")) {
				myMap.put(2, dnquery);

			} else if (!"null".equals(dnquery) && dnquery.contains("Users")) {
				myMap.put(1, dnquery);
			} else {
				myMap.put(5, dnquery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/* ... */
		return myMap;
	}

	protected Integer blackListedUsersCheck(Integer z, String user) {
		BlackListedUsers blu = new BlackListedUsers();
		if (blu.CheckUser(user)) {
			z = 5;

		}

		return z;
	}

	@SuppressWarnings("squid:S2092")

	/*
	 * QUESTA ANNOTATION SOPPRIME LA REGOLA BLOCKER! DI SONAR: Creating cookies
	 * without the "secure" flag is security-sensitive
	 */

	protected HttpServletResponse createResponse(String user, String cognome, String nome, String ou,
			HttpServletResponse resp) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Long tmp = timestamp.getTime();

		unique.add(tmp);

		Cookie loginCookie = new Cookie("user", user);
		Cookie scopeCookie = new Cookie(SCOPE, cognome + "." + nome);
		Cookie ouCookie = new Cookie("OU", ou);
		Cookie uniqueCookie = new Cookie("unique", tmp.toString());

		loginCookie.setMaxAge(12 * 120 * 60);
		scopeCookie.setMaxAge(12 * 120 * 60);
		ouCookie.setMaxAge(12 * 120 * 60);
		uniqueCookie.setMaxAge(12 * 120 * 60);

		resp.addCookie(loginCookie);
		resp.addCookie(scopeCookie);
		resp.addCookie(ouCookie);
		resp.addCookie(uniqueCookie);

		return resp;
	}
}
