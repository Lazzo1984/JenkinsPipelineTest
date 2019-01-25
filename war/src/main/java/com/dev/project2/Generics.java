package com.dev.project2;


public class Generics implements IOrdinable{
	// qualsiasi tipo purche implementi Comparable es String Integer oppure tipi definiti dall'utente
	
	public <T extends Comparable<T>> T[] selectionSort(T[] array) {
        T temp;
        for (int i = 0; i < array.length - 1; i++) 
        {
            for (int j = i + 1; j < array.length; j++) 
            {
                if (array[j].compareTo(array[i]) <= 0) 
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
