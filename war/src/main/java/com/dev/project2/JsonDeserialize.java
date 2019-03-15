package com.dev.project2;
import java.io.File;
import java.io.IOException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonDeserialize{
	static File Json;
	static {	 Json = new File("/home/cmgroup/REPO/upload/DB.json");    }
	
	public Boolean requestValidation(String report,String Referente) {
	
		try {
			for(Proto x : deserialize())
			{
				if(x.Elettra.equals(report))
				{
					if(x.Responsabile.contains(Referente))  // 
					{									   // 
						
						return true;
					}
				}
			}
		} catch (JsonParseException e) {
			
			e.printStackTrace();
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return false;
		
	}
	// versione generica	
	@SuppressWarnings("unchecked") // => return ([T] myObjects)
	public <T extends Comparable<T>> T[] deserializeGenerics() throws JsonParseException, JsonMappingException, IOException{
		 ObjectMapper mapper = new ObjectMapper();
		 Proto myObjects[] = mapper.readValue(Json, Proto[].class);
		 return (T[]) myObjects;
	 }
	 
	public Proto[] deserialize() throws JsonParseException, JsonMappingException, IOException{
		
		 // File json ==== new File("/home/cmgroup/REPO/upload/DB.json")		
		// solito mapping [{},{}] => MyClass istanziata ad array oppure a List<MyClass>		
		ObjectMapper mapper = new ObjectMapper();
		Proto myObjects[] = mapper.readValue(Json, Proto[].class);
		//Proto p = new Proto();
		//p.selectionSort(myObjects); //Ormai tutti gli elementi sono ordinati e lo saranno sempre
		return myObjects;		
	}
	public class Proto implements Comparable<Proto>, IOrdinable
	{	
	    public Integer id;
	    public String Elettra;
	    public String Modulo;
	    public String Prodotto;
	    public String Area;
	    public String Responsabile;
	    public String cert2015;
	    public String Polarion;
	    public String artefatto;
	    public String cert2014;
	    public String Referente;
	    public String Supporto;
	    public String Alice;
	    public String Kali;
	    public String Risultati;
	    public String indirizzi;
	    public String Utenze;
	    public String data_esecuzione;
	    public String note;
	    public Integer attach;
		@Override
		public String toString()
		{
			// usare solo per check
			return this.id + " - " + this.Elettra + " - " + this.Referente;
		}
		@Override
		public int compareTo(Proto x)
		{
			if(x == null) throw new NullPointerException();
			
		      if(!(x instanceof Proto)) throw new ClassCastException();
		      
		        Proto proto = (Proto) x;
		      return id.compareTo(proto.id);
		      
			// questo invece compareTO di Integer gira e rigira siamo finiti qua
		}
		@Override
		public <T extends Comparable<T>> T[] selectionSort(T[] array) {
	        T temp;
	        for (int i = 0; i < array.length - 1; i++) 
	        {
	            for (int j = i + 1; j < array.length; j++) 
	            {
	                if (array[j].compareTo(array[i]) <= 0) // override di Proto ovviamente che tanto alla fine richiama compareTo di Comparable<T>
	                {
	                    temp = array[i];				
	                    array[i] = array[j];
	                    array[j] = temp;
	                }
	            }
	        }
	        return array;
	    }
	}
}
