package com.dev.project2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Note {
	static File Json;
	static {	 Json = new File("/home/cmgroup/REPO/upload/note.json");    }
	
	public static class ModelClass
	{
		
		public ModelClass(String Elettra,String Note, String UpdatedBy) 
		{
			this.elettra = Elettra;
			this.note = Note;
			this.updatedby = UpdatedBy;
		}
		public String getUpdatedby() {
			return updatedby;
		}
		public void setUpdatedby(String updatedby) {
			this.updatedby = updatedby;
		}
		public ModelClass() {}
		public String getElettra() {
			return elettra;
		}
		public void setElettra(String elettra) {
			this.elettra = elettra;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public String elettra;
		public String note;
		public String updatedby;
	}
	public ModelClass[] deserialize() throws JsonParseException, JsonMappingException, IOException{
		
			
		// solito mapping [{},{}] => MyClass istanziata ad array oppure a List<MyClass>	
		
		ObjectMapper mapper = new ObjectMapper();
		ModelClass myObjects[] = mapper.readValue(Json, ModelClass[].class);
		
		return myObjects;		
	}
	public String leggiNote(String path)
	{		
		BufferedReader reader = null;
		
		String line;
		String oggettojson = "";

		try {
			File file = new File(path);
			reader = new BufferedReader(new FileReader(file));

			while ((line = reader.readLine()) != null) {

				oggettojson += line;

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return oggettojson;
	}
	public void scrivi(String json,String fileName) throws IOException
	{
		try(BufferedWriter writer = new BufferedWriter(new FileWriter(fileName)))
		{
			writer.write(json);
			writer.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	    
	     
	    
	}

}
