package com.dev.project2;

import java.util.HashMap;
import java.util.Map;

public class BlackListedUsers {
	
	protected Map<String, String> Dizionario;
	
	
	public BlackListedUsers()
	{
		Dizionario = new HashMap<>();
		Dizionario.put("pippo", "");
		
	}
	
	public Boolean CheckUser(String u)
	{
		
		if(Dizionario.containsKey(u))
		{return true;}
		
		return false;
	}
}
