$(document).ready(function(){
	$('#mailBombing').click(function(){
	var Elettra;var Polarion;var Referente;
	elettra = [];polarion = []; referenti = [];

	$("#ToDo tbody").find("tr").each(function() {

	var chkbox = $(this).find('input[type="checkbox"]').attr('id');
    
	var isChecked = $('#'+chkbox).is(':checked');
	//alert(isChecked);
	if(isChecked)
			{
			var $tds = $(this).find('td');
			Elettra = $tds.eq(2).text();        // 2
			Polarion = $tds.eq(4).text();      // 4
			Referente = $tds.eq(3).text();    // 3
			insertData(Elettra,Polarion,Referente);
			}
			else
			{}
	}); //for each
	if(checkRef())
			{EmailWrite();}
			else
			{
			alert("Error : la selezione multipla deve avere lo stesso referente"); //NOSONAR
			}
	
}); //mail bombing
	function insertData(a,b,c)
		{
			elettra.push(a);
			polarion.push(b);
			referenti.push(c);
		}
		
		function EmailWrite()
		{
		var frase = "%0D%0APer i progetti/o Polarion in oggetto si richiedono le seguenti informazioni per poter eseguire i relativi test di sicurezza :%0D%0A- Ambiente( es. PRE-IT o IT) :%0D%0A- Url( per accedere all'applicativo web):%0D%0A- Credenziali (eventuali, es. carta operatore con che ruolo o credenziali iniettate, o user e password) "
		var str3 = referenti[0].split(" ");
		
		var EmailTo = str3[1].toLowerCase() + "." + str3[0].toLowerCase() + "@lispa.it";
		var body_message = "Buongiorno " + str3[1] + ",%0D%0A" + frase +"%0D%0A" + "%0D%0A" + createTable() + "%0D%0ACordiali Saluti";
		
		
		var mailto_link = 'mailto:' + EmailTo + '?cc=domenico.cioffi@lispa.it' + '&subject=Test di VAPT di laboratorio CM : ' + polarion + '&body=' + body_message +"%0D%0A";
		window.location.href = (mailto_link);
		}
		function checkRef()
		{var _boolean = true;
		for(i = 0 ; i < referenti.length ;i++)
		{if(referenti[0] == referenti[i])
		{  _boolean = true;}
		else
		{ _boolean = false;}
		}
		return _boolean;
		}
		function createTable()
		{
		 var head = "Cod.Elettra        PolarionID        Referente%0A";
		 var body = "";
		 var foot = "";
		 for(i = 0; i < referenti.length; i++)
		 {
		   body += elettra[i] + "   " + polarion[i] + "   " +  referenti[i] + "%0A";
		 }
		 return head + body + foot;
		}

}); //document.ready