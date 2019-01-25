package com.dev.project2;
/*  interfaccia con
 *  metodo generico
 *  qualsiasi T basta che sia un array e che implementi Comparable -- constraint lower bound
 *  l'implementazione da fornire è un'ordinamento usando un campo qualsiasi della propria classe
 *  nell'implementazione concreta il bubble sort è sufficiente
 */ 
public interface IOrdinable {
	
	<T extends Comparable<T>> T[] selectionSort(T[] __array);
}
