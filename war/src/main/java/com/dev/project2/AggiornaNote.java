package com.dev.project2;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.project2.Note.ModelClass;

@WebServlet("/AggiornaNote")
public class AggiornaNote extends HttpServlet{

	
	private static final long serialVersionUID = 6755563801648981671L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/home/cmgroup/REPO/upload/note.json";
		Note note = new Note();
		String jsonObject = note.leggiNote(path);
		
		resp.setContentType("application/json");
		resp.addHeader("Access-Control-Allow-Origin", "*");
		resp.setCharacterEncoding("UTF-8");
		try {
		PrintWriter out = resp.getWriter();
	
		out.print(jsonObject);
		out.flush();
		}
		catch(Exception ex)
		{
			/* ... */
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String path = "/home/cmgroup/REPO/upload/note.json";
		
		String elettra = req.getParameter("elettra");
		String note = req.getParameter("note");
		String updatedby = req.getParameter("updatedby");
		
		Note istanza = new Note();
		ModelClass[] jsonarray = istanza.deserialize();
		List<ModelClass> newjsonarray = new ArrayList<ModelClass>();
		ModelClass insert = new ModelClass();
		ModelClass update = new ModelClass();
		
		for(ModelClass x : jsonarray)
		{
			
			if(elettra.equals(x.elettra))
			{			
				update.elettra = elettra;
				update.note = note;
				update.updatedby = updatedby;
				
			}
			else
			{
				newjsonarray.add(x);
				
			}
		}
		if(update.elettra != null && update.note != null) {
		newjsonarray.add(update);
		}
		else 
		{
		for(ModelClass y : jsonarray)
		{
			
			if(elettra.equals(y.elettra))
			{			
				/* ... */
				
			}
			else
			{
				insert.elettra = elettra;
				insert.note = note;
				insert.updatedby = updatedby;
				
			}
		}
		
		newjsonarray.add(insert);
		}
				
		String jsonObject = Analytics.serializerJson2(newjsonarray);
		istanza.scrivi(jsonObject,path);		
		try
		{
		PrintWriter out = resp.getWriter();
		
		resp.setContentType("application/json");
		resp.addHeader("Access-Control-Allow-Origin", "*");
		resp.setCharacterEncoding("UTF-8");
		
		out.print(istanza.leggiNote(path));
		
						
	  /*	out.flush() */
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
