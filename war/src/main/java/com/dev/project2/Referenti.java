package com.dev.project2;

import java.util.HashMap;
import java.util.Map;

public class Referenti {
protected Map<String, String> Dizionario;
	
	public Boolean autenticazione(String u,String p){
		
	Dizionario = new HashMap<>();
	
	Dizionario.put("nicola.gavazzi@lispa.it","Bridgeport");
	Dizionario.put("nicoletta.montali@lispa.it","Fargo");
	Dizionario.put("manuel.malini@lispa.it","Sioux Falls");
	Dizionario.put("andrea.citti@lispa.it","Wilmington");
	Dizionario.put("sergio.artuso@lispa.it","Jacksonville");
	Dizionario.put("paolo.milani@lispa.it","Atlanta");
	Dizionario.put("aldo.feshti@lispa.it","Honolulu");
	Dizionario.put("gianfranco.tarricone@lispa.it","Boise");
	Dizionario.put("mirko.paulon@lispa.it","Chicago");
	Dizionario.put("massimiliano.mazzieri@lispa.it","Indianapolis");
	Dizionario.put("gionni.parma@lispa.it","Des Moines");
	Dizionario.put("vladimiro.cuman@lispa.it","Wichita");
	Dizionario.put("fabio.venditti@lispa.it","Louisville");
	Dizionario.put("eleonora.sgambati@lispa.it","New Orleans");
	Dizionario.put("alessandro.camino@lispa.it","Portland");
	Dizionario.put("stefano.gelmi@lispa.it","Baltimora");
	Dizionario.put("massimo.ferrario@lispa.it","Boston");
	Dizionario.put("aldo.fiore@lispa.it","Detroit");
	Dizionario.put("stephane.pastore@lispa.it","Minneapolis");
	Dizionario.put("giovanni.circella@lispa.it","Jackson");
	Dizionario.put("roberto.praolini@lispa.it","Kansas City");
	Dizionario.put("silvia.mangano@lispa.it","Billings");
	Dizionario.put("luigi.garofalo@lispa.it","Omaha");
	Dizionario.put("diego.perrone@lispa.it","Las Vegas");
	Dizionario.put("rita.ucciardo@lispa.it","Manchester");
	Dizionario.put("piazza.roberto@lispa.it","Newark");
	Dizionario.put("stefano.cerrito@lispa.it","Albuquerque");
	Dizionario.put("sabrina.santoro@lispa.it","New York");
	Dizionario.put("roberto.mambretti@lispa.it","Columbus");
	Dizionario.put("rosa.pozzessere@lispa.it","Oklahoma City");
	Dizionario.put("claudia.sportelli@lispa.it","Portland");
	Dizionario.put("luca.balsamo@lispa.it","Filadelfia");
	Dizionario.put("roberto.piazza@lispa.it","Providence");
	// Pio Masone x usare NodeJs x pre-it 
	// Non esistendo Pio ne come referente ne come autore di Rilasci
	// Non potrà visionare o scaricare i report VAPT
	// per motivi di sicurezza
	Dizionario.put("pio.masone@lispa.it", "Abcd1234$");
	
	if(Dizionario.containsKey(u) && Dizionario.containsValue(p))
	{
		
		return true;
		
	}
	return false;
	
	
	
	}

}
