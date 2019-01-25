package com.dev.project2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import com.dev.project2.Analytics.*;
import com.fasterxml.jackson.core.JsonProcessingException;

public class ControllerAnalitycs {
	public ControllerAnalitycs()
	{
		/* ... */
	}
	public String jsonResponder()
	{
		
		return procedure();
	}
	public String procedure() {
		Analytics.mapper.clear(); //  mapper è static va pulito ad ogni giro
		Analytics.fileReader("ANAG");// dumpa da qui fixed #
		Collections.sort(Analytics.mapper); //ordina A-Z
		
		Analytics.Proto pr = new Analytics.Proto();
		List<Proto> zOrdered = pr.Ordinatore(Analytics.mapper); 
		// start mod debug #23 uncomment this foreach to see what's going on
		/*
		for(Proto x : zOrdered)
		{   
		//	System.out.println(x.codelettra + ";" + x.datapubblicazione + ";" + x.pentester + ";" + x.datareport + ";" + x.alta + ";" + x.media + ";" + x.bassa + ";" + x.info + ";" + x.none);//+ "\n" + x.vulnerabilities);
			
		}
		*/
		// end mod
		List<Proto> finallist = new ArrayList<>();
				
		Integer internalcounter = 0;
		
		HashMap<String,Integer> hm = occurenciesCounter(zOrdered);
		
		Proto fake = new Proto();
		fake.codelettra = "FAKE";
		fake.datapubblicazione = "01/01/1970";
		fake.datareport="01/01/1970";
		fake.pentester="ADLISPA\\PBAUDO";
		fake.vulnerabilities="ocazz";
		fake.alta="";
		fake.bassa="";
		fake.media="";
		fake.none="";
		fake.bassa="";
		
		for(Analytics.Proto x : zOrdered)
		{
			for(Entry<String,Integer> j : hm.entrySet()){
				if(j.getKey().equals(x.codelettra) && j.getValue() > 1) //solo quelli che hanno almeno 2 occorrenze
			{
				Proto proto = new Proto();
				proto.codelettra = x.codelettra;
				proto.datapubblicazione = x.datapubblicazione;
				proto.pentester = x.pentester;
				proto.datareport = x.datareport;
				proto.alta = x.alta;
				proto.media = x.media;
				proto.bassa = x.bassa;
				proto.info = x.info;
				proto.none = x.none;
				proto.vulnerabilities = x.vulnerabilities;
				finallist.add(proto);
				
//System.out.println(x.codelettra + ";" + x.datapubblicazione + ";" + x.pentester + ";" + x.datareport + ";" + x.alta + ";" + x.media + ";" + x.bassa + ";" + x.info + ";" + x.none);//+ "\n" + x.vulnerabilities);
		
				internalcounter ++;
			}		
			}				
		}
			
		String previous = "ALLERTA";
		List<Proto> tempproto = new ArrayList<>();
		List<External> tempexternal = new ArrayList<>();
		
		finallist.add(fake);
		
		for(Proto p : finallist)
		{
			
			if(previous.equals(p.codelettra))
			{
				tempproto.add(p);
			}
			else
			{
				Proto[] miniproto = tempproto.toArray(new Proto[0]);
				External miniext = new External();
				miniext.Elettra = previous;
				miniext.data = miniproto;
				
				tempexternal.add(miniext);
				tempproto.clear();
				previous = p.codelettra;
				tempproto.add(p);
			}
			
		}
			
		// -----------------------------------------------------------------------------------------------------------------------------------------
		
		
		System.out.println("Totale : " + Analytics.counter + "\nDistinct : " + internalcounter);	
		
		try {
			
			return  Analytics.serializerJson2(tempexternal);
			
			
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		return null;
		
		}
	
	public static <T extends Comparable<T>> HashMap<String,Integer> occurenciesCounter(List<T> lista)
	{
		HashMap<String,Integer> hashtable = new HashMap<>();
		
		// da qui in poi è specializzato per lavorare esclusivamente con Proto.class
		
		Proto[] arr = lista.toArray(new Proto[0]);
		
		Integer len = lista.size();
		
		for(int i = 0; i < len; i++)
		{
			Integer c = 1;
			for(int j = 1 ; j < len; j ++)
			{
			if(arr[i].codelettra.equals((arr[j].codelettra)))	
			{
				
				hashtable.put(arr[i].codelettra, c++);
				
			}
				
			}	
		}		
		return hashtable;
	}

}
