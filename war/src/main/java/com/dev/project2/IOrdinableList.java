package com.dev.project2;

import java.util.List;

public interface IOrdinableList<T extends Comparable<T>> {
	// "Ordinatore" serve per restituire una Lista pulita rimuovendo i duplicati generati da errori di comunicazione con Polarion,cod elettra errati o altro
	// questo metodo deve essere invocato su una lista già ordinata A-Z per codice Elettra 
	// quindi il <T> deve implementare Comparable<T> e fornire una implementazione per il confronto compareTo su codice elettra
	// Collections.sort(List<Proto>)
	
       public List<T> Ordinatore (List<T> t);
      

}
