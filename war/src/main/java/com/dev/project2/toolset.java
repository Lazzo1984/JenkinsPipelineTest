package com.dev.project2;
import java.util.*;

// per testare interfaccia comparable e IComparable
public class toolset {
	static class Emp implements Comparable<Emp>
	{
		String fn;
		Integer age;
		private static int instanceCounter = 0;
		public int getinstanceCounter()
		{
			return instanceCounter;
		}
		public String getFn() {
			return fn;
		}
		public void setFn(String fn) {
			this.fn = fn;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
		public Emp(){}
		public Emp(String nome,Integer age)
		{
			setFn(nome);
			setAge(age);
			instanceCounter ++;
		}		
		@Override
		public int compareTo(Emp x) {
			if(x == null) throw new NullPointerException();
		      if(!(x instanceof Emp)) throw new ClassCastException();
		        Emp e = (Emp) x;
		        
		        	if(this.age < e.age)
		        		return -1;
		        		if(this.age == e.age)
		        			return 0;
		    //  return age.compareTo(e.age);  compareTo di Integer essendo age integer
		        				return 0;
		}		 
	}
	/*public static void main(String args[])
	{	
		List<Emp> emp = new ArrayList<Emp>();
		emp.add(new Emp("Zenone",43));
		emp.add(new Emp("Fabio",23));
		emp.add(new Emp("Antonio",46));		
	    Collections.sort(emp);
	    
		for(Emp x : emp)
		{
			System.out.println(x.getFn() + " - " + x.getAge());			
		}
		System.out.println("-----------------------------------------");
		Emp[] emp2 = new Emp[]{new Emp("pippo",2),new Emp("elmo",34),new Emp("antoine",14)};		
	    Generics g = new Generics();
		g.selectionSort(emp2);
		//Arrays.sort(emp2);
		for(Emp x : emp2)
		{
			System.out.println(x.getFn() + " - " + x.getAge());			
		}
		Emp e = new Emp();
		System.out.println(e.getinstanceCounter());	
		System.out.println(isPalindrome("ACCA"));
		
		
	}*/
	public static boolean isPalindrome(String word) {
       // throw new UnsupportedOperationException("Waiting to be implemented.");
        String a = word.toLowerCase();
		int len = a.length();
		char[] b = a.toCharArray();
		char[] c = new char[len];
		int right = len-1;
		int left = 0;
		while(right >= 0)
		{
			c[left] = b[right];
			left ++;
			right--;
		}
		/*for(int u = len-1;u >= 0;u--)
		{			
			c[left] = b[u];
			left ++;			
		}*/
		if(Arrays.equals(b, c))
		 return true;
        return false;
    }
}
