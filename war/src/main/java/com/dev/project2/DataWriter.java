package com.dev.project2;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DataWriter {   // percorso lo passo dalla servlet ogni volta 
	public void scrivi(String percorso, String conta)
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String record = ('"' + dateFormat.format(date)+ '"' + "," + '"' + conta + '"'); //"2016-11-16","51"
		
		ReaderC r = new ReaderC();
		
		boolean test = r.meReader(percorso, record);
		
		if(test)
		{
			//c'è già
			
		}
		else
		
		{
		
	try
	(    FileWriter fw = new FileWriter(percorso, true);
			
		    BufferedWriter bw = new BufferedWriter(fw);
			
		    PrintWriter out = new PrintWriter(bw)
	)
		{
		    out.println('"' + dateFormat.format(date) + '"' + "," + '"' + conta + '"');
		    
		    
		    
		} catch (IOException e) {
		    /* ... */
		}
		System.out.println("write successfull on Ddata.txt");
	}
	}
}
