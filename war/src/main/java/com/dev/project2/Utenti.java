package com.dev.project2;

import java.util.HashMap;
import java.util.Map;

public class Utenti {
	
	protected Map<String, String> Dizionario;
	
	public Boolean autenticazione(String u,String p){
		
	Dizionario = new HashMap<>();
	
	Dizionario.put("ppirani", "Abcd1234$" );
	Dizionario.put("slazzati", "Abcd1234$");
	Dizionario.put("mperchinunno", "Abcd1234$");
	Dizionario.put("dcioffi", "Abcd1234$");
	Dizionario.put("fairaghi", "Abcd1234$");
	Dizionario.put("tspera", "Abcd1234$");
	Dizionario.put("fdaminelli", "Abcd1234");
	Dizionario.put("pmasone", "Abcd1234");
	Dizionario.put("gpassaro", "Abcd1234$");
	
	if(Dizionario.containsKey(u) & Dizionario.containsValue(p))
	{
		
		return true;
		
	}
	else 
	{return false;}
	
	}
	public Boolean CheckSuperUser(String u)
	{
		Dizionario = new HashMap<>();
		
		Dizionario.put("ppirani", "Abcd1234$" );
		Dizionario.put("ncontardi", "Abcd1234$");
		Dizionario.put("slazzati", "Abcd1234$");
		Dizionario.put("mperchinunno", "Abcd1234$");
		Dizionario.put("dcioffi", "Abcd1234$");
		Dizionario.put("fairaghi", "Abcd1234$");
		Dizionario.put("tspera", "Abcd1234$");
		Dizionario.put("ddifranco", "Abcd1234$");
		
		Dizionario.put("fdaminelli", "Abcd1234");
		Dizionario.put("pmasone", "Abcd1234");
		Dizionario.put("gpassaro", "Abcd1234$");
		if(Dizionario.containsKey(u))
		{return true;}
		else
		{return false;}
	}
}
