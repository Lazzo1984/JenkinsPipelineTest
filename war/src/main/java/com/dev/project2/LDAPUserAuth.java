package com.dev.project2;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.*;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;


public class LDAPUserAuth {
	/*
	public static boolean authenticateJndi(String username, String password) throws Exception{
	    Properties props = new Properties();
	    props.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	    props.put(Context.PROVIDER_URL, "ldap://10.221.1.11:389");
	    props.put(Context.SECURITY_PRINCIPAL, "uid=adminuser,ou=special users,o=xx.com");//adminuser - User with special priviledge, dn user
	    props.put(Context.SECURITY_CREDENTIALS, "adminpassword");//dn user password


	    InitialDirContext context = new InitialDirContext(props);

	    SearchControls ctrls = new SearchControls();
	    ctrls.setReturningAttributes(new String[] { "givenName", "sn","memberOf" });
	    ctrls.setSearchScope(SearchControls.SUBTREE_SCOPE);

	    NamingEnumeration<javax.naming.directory.SearchResult> answers = context.search("o=xx.com", "(uid=" + username + ")", ctrls);
	    SearchResult result = answers.nextElement();

	    String user = result.getNameInNamespace();

	    try {
	        props = new Properties();
	        props.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	        props.put(Context.PROVIDER_URL, "ldap://10.221.1.11:389");
	        props.put(Context.SECURITY_PRINCIPAL, user);
	        props.put(Context.SECURITY_CREDENTIALS, password);

	   context = new InitialDirContext(props);
	    } catch (Exception e) {
	        return false;
	    }
	    return true;
	}
	*/
	public String ldapconn(String username,String password) throws Exception
	{		
		try{
		Properties env = new Properties();
		env.put(Context.INITIAL_CONTEXT_FACTORY,"com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, "ldap://10.221.1.11:389");
		env.put(Context.SECURITY_PRINCIPAL, "adlispa\\" + username);
		env.put(Context.SECURITY_CREDENTIALS, password);
		//env.put(Context.REFERRAL, "follow");
		InitialDirContext context = new InitialDirContext(env);

	    SearchControls ctrls = new SearchControls();
	    ctrls.setReturningAttributes(new String[] {"givenName", "sn","memberOf" });
	    ctrls.setSearchScope(SearchControls.SUBTREE_SCOPE);

	    NamingEnumeration<SearchResult> answers = context.search("DC=adlispa,DC=local","sAMAccountName=" + username, ctrls);
	    SearchResult result = answers.nextElement();
	   
	    Attributes h = result.getAttributes();
	    
	    String user = result.getNameInNamespace();
	    String surname = h.get("sn").toString();
	    String name = h.get("givenName").toString();
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
	    System.out.println(dateFormat.format(date));
	    String complete = (user + "," + surname + "," + name);
		System.out.println(complete);
		return complete;
		
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());	
			return "null";
		}			
	}	
	public String ldapconn(String username,String password,Integer i) // only x test
	{
	//	String r = "CN=Serenthà Riccardo,CN=Users,DC=adlispa.local,sn: Serenthà,givenName: Riccardo";
		String r = "CN=D'Ambrosio Marco,CN=Users,DC=adlispa.local,sn: D'Ambrosio,givenName: Marco";
	//	String r = "CN=De Matthaeis Ornella,CN=Consulenti,DC=adlispa.local,sn: De Matthaeis,givenName: Ornella";
	//	String r = "CN=Hinojosa Valencia Alvaro,CN=Users,DC=adlispa.local,sn: Hinojosa,givenName: Valencia Alvaro";
		return r;
	}
}
