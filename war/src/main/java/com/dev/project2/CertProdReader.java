package com.dev.project2;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.*;
import java.io.*;

@WebServlet("/CertProd")
public class CertProdReader extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	//	String pathcontesto = this.getServletContext().getRealPath("TemplateAdmin2/SmallData/Ddata.txt");
		// /root/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project2

	// dw = new DataWriter();
		StringBuilder alfa = new StringBuilder();
		
		URL url = new URL("http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWebVapt");// http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWeb

		if (pingURL("http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWebVapt", 10000)) {
			System.out.println("Retriving data from cm-maven.adlispa.local/cmqualityweb/CheckQualityWeb...");
			
			BufferedReader in = null;
			try
			{
			in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {

				alfa.append(inputLine);
			}
			in.close();
			}
			catch(Exception e)
			{
				/* ... */
			}
			finally
			{
				if(in != null)
				{
					try {
				in.close();
					}
					catch(Exception e)
					{
						/* ... */
					}
				}
			}
			//
			/*
			Integer contaAttivita = 0;
			contaAttivita = ocCount(alfa.toString());

			dw.scrivi(pathcontesto, contaAttivita.toString()); // pathcontesto = Ddata.txt
			*/

			// CORS Cross domain ajax callbacks secca da qualsiasi dominio

			resp.addHeader("Access-Control-Allow-Origin", "*");
			resp.addHeader("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS, DELETE"); //
			resp.addHeader("Access-Control-Allow-Headers", "Content-Type"); //
			resp.addHeader("Access-Control-Max-Age", "86400");
			resp.setContentType("application/json");

			try
			{
			PrintWriter out = resp.getWriter();
			out.println(alfa);
			}
			catch(Exception e)
			{
				/*... */
			}
		} 
		else // Se non raggiungo il Portale certificazione prodotti 
		{
			String everything = ""; 
			
			resp.addHeader("Access-Control-Allow-Origin", "*");
			resp.setContentType("application/json");
			try
			{
			everything = localConnection();
			PrintWriter out = resp.getWriter();
			out.println(everything);
			
			}
			catch(Exception e)
			{
				/* ... */
			}
		}
	}

	public Integer ocCount(String input) // conta attivita non eseguite
	{
		int index = input.indexOf("Attivita' non ancora eseguita");
		int count = 0;
		while (index != -1) {
			count++;
			input = input.substring(index + 1);
			index = input.indexOf("Attivita' non ancora eseguita");
		}

		return count;
	}

	public static boolean pingURL(String url, int timeout) {
		url = url.replaceFirst("^https", "http"); // Otherwise an exception may be thrown on invalid SSL certificates.

		try {
			HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
			connection.setConnectTimeout(timeout);
			connection.setReadTimeout(timeout);
			connection.setRequestMethod("HEAD");
			int responseCode = connection.getResponseCode();

			System.out.println(responseCode);

			return (200 <= responseCode && responseCode <= 399);

		} catch (IOException exception) {
			return false;
		}

	}
	public String localConnection() throws IOException
	{
		System.out.println("Retriving data from LOCAL ... SmallData/CheckQualityWeb.json");
		
		String percorso = this.getServletContext().getRealPath("TemplateAdmin2/SmallData/CheckQualityWeb.json");
		String everything = "";
		BufferedReader br = null;
		StringBuilder sb = null;
		try {
			br = new BufferedReader(new FileReader(percorso));
			sb = new StringBuilder();
			String line = br.readLine();

			while (line != null) {
				sb.append(line);
				sb.append(System.lineSeparator());
				line = br.readLine();
			}
			everything = sb.toString();
			return everything;
		} finally {
			if(br != null)
			{
			try {
			br.close();
			}
			catch(Exception e)
			{
				/* ... */
			}
			}				
		}
	}
	// end
}
