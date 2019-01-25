package com.dev.project2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class RegisterUser {
	public Boolean autenticazione(String u, String p, String path) throws IOException
	{
		BufferedReader bf = null;
		String line = "";
		
		try
		{
			File file = new File(path);
		    bf = new BufferedReader(new FileReader(file));
		   
		    while ((line = bf.readLine()) != null) {
		    		String[] splitted = line.split("0xFFFF");
		    		// in pratica per abilitare un utente devi rimuover il codice 0x0000 dal file Reservation
		       		    if(splitted[0].equals(u) && splitted[1].equals(p) && !"0x0000".equals(splitted[2]))
		       		    {
		       		    bf.close();
		       		    return true;
		       		    } 	
		    }
			
			bf.close();
			return false;
		}
		catch(Exception e)
		{
			
			return false;
		}
		finally
		{
			if(bf != null) {
			bf.close();
			}
		}
	}

}
