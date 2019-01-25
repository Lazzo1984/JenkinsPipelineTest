package com.dev.project2;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String percorso = this.getServletContext().getRealPath("TemplateAdmin2/SmallData/Reservation.txt");

		String username = req.getParameter("txtbox");
		String pzwd = req.getParameter("txtbox1");

		try (FileWriter fw = new FileWriter(percorso, true);

				BufferedWriter bw = new BufferedWriter(fw);

				PrintWriter out = new PrintWriter(bw)) {
			out.println(username + "0xFFFF" + pzwd + "0xFFFF" + "0x0000");

		} catch (IOException e) {
				/* ... */

		}
		System.out.println("A new user request : " + username);
		try
		{
		resp.sendRedirect("JSP/RegisterSuccessfull.jsp");
		}
		catch(Exception ex)
		{
			/* ... */
		}
	}

}
