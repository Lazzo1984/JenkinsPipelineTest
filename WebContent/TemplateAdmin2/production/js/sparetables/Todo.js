$(document).ready(function(){  //NOSONAR
	
		var s = [];
		var h = [];
		var referenti = [];
		var polarion = [];
		var elettra =[];
		
		
		//$.getJSON(url, function(json) {
		//console.log(Object.keys(json));
		//console.log(json.tableQuality[1][1] + " - " + json.tableQuality[1][2]);
		
		var counter = 0;
		var Ltablesecurity = json.tableSecurity.length;
		var empty_shell = "";
	
		for(var i=0;i< Ltablesecurity;i++)
		{
		if(json.tableSecurity[i][5] ==  "Attivita' non ancora eseguita") //
		{ 
		  		  	
			var tsmp = (DateToTstamp(json.tableSecurity[i][1]));
			var Note = "";		  		  
			s.push([
					empty_shell,
				//	tsmp,                                  //   TIMESTAMP           
					json.tableGeneral[i][0],              //   DATA 
					json.tableGeneral[i][3],             //   POLARION
					json.tableGeneral[i][1],            //   ELETTRA
					json.tableGeneral[i][15],          //   AUTORE
					
				//	json.tableSecurity[i][5],   	  //   STATO (KALI LINUX)
				//	json.tableGeneral[i][4]  		 //   DEFECT
			//      json.tableSecurity[i][10]       //   NOTE
					Note
					]); 	 
				
		    } // end if
		
		}
		//alert(s);
		
		var ordArr = s.sort(function(a,b){return b[0] - a[0]});
		//console.log(ordArr);
		
		//AttNese(s);
		
		function DateToTstamp(_date)
		{
		var colon = ":";
		if(_date.includes(colon))
		{
		var currentdate = new Date(); 
		var datetime = currentdate.getFullYear() + "/" +
              (currentdate.getMonth()+1)  + "/" +
               currentdate.getDate() + " " + _date;

		var k = Math.round(new Date(datetime).getTime()/1000);
		
		return k;
		}
		else
		{
		var myDate = _date;
		myDate = myDate.split("-");
				
		var newDate = myDate[2] + "/" + myDate[1] + "/" + myDate[0] + " 12:00:00";
		var zk = Math.round(new Date(newDate).getTime()/1000);
		
		return zk;
		}
		}
		// # END OF DateToTstamp
		//****************************************
		function sortNumber(a,b) {
		if (a[1] === b[1]) {
        return 0;
		}
			else {
			return (a[1] < b[1]) ? -1 : 1;
		}	
		}
		//****************************************
		function Uri4Defect(url,defect)
		{
		if(defect != null){
		var newurl ="";		
		var x = (url.includes("siss"))?"SISS":"SIRE";
		switch(x) {
		case "SISS":
        newurl = "http://sgr-siss.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" + defect ; //NOSONAR
        break;
		case "SIRE":
        newurl = "http://sgr-sire.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" + defect; //NOSONAR
        break;
		default:
		newurl = "vai ngulo vai";
		//console.log(newurl);
		      
		}
		return newurl; 
		}
		else
		{
		return "";
		}
		 return "something goes wrong";
		}
		
		/*
		$('#ToDo').DataTable( {
        data: ordArr,
		"order": [[ 0, "desc" ]],
        columns: [
			
		   { title: "#" },
            { title: "Data" },
            { title: "Polarion" },
            { title: "Elettra" },
            { title: "Author" }           
        ]
    } );
		*/
		$('#ToDo').DataTable( {
			data: ordArr,
			columns: [
				{ title: "#" },
	            { title: "Data" },
	            { title: "Polarion" },
	            { title: "Elettra" },
	            { title: "Author" },
	            { title: "Note" }
	            
	        ],
	        columnDefs: [ {
	            orderable: false,
	            className: 'select-checkbox',
	            targets:   0
	        } ],
	        select: {
	            style:    'os',    //NOSONAR
				'style': 'multi', //NOSONAR
	            selector: 'td:first-child'
	        },
	        order: [[ 1, 'asc' ]]
	    } );
	/*	
	$('#ToDo tbody').on( 'click', 'tr', function () {
		$(this).toggleClass('selEcted');
		});	
	*/
	$('#ToDo tbody').on( 'click', '.select-checkbox', function () {
		$(this).closest('tr').toggleClass('selectedX'); // closest vs parent
		});
		
		$('#mailBombing').click(function(){
		var Elettra;var Polarion;var Referente;
		elettra = [];polarion = []; referenti = [];
		$("#ToDo tbody").find("tr").each(function() { //get all rows in table

			var isSelected = $(this).hasClass('selectedX'); //anche qui 
			if(isSelected)
			{
			var $tds = $(this).find('td');
			Elettra = $tds.eq(3).text();  //2
			Polarion = $tds.eq(2).text();  // 1
			Referente = $tds.eq(4).text();  // 3
			insertData(Elettra,Polarion,Referente);
			}
			else
			{}
			}); // for each
			//console.log(elettra,polarion,referenti);
			if(checkRef())
			{EmailWrite();}
			else
			{
			alert("Error : la selezione multipla deve avere lo stesso referente"); //NOSONAR
			}
		});//mailSEnd button
		function insertData(a,b,c)
		{
			elettra.push(a);
			polarion.push(b);
			referenti.push(c);
		}
		function EmailWrite()
		{
		var frase = "%0D%0APer i progetti/o Polarion in oggetto si richiedono le seguenti informazioni per poter eseguire i relativi test di sicurezza : Ambiente( es. PRE-IT o IT) ,Url( per accedere all'applicativo web),Credenziali (eventuali, es. carta operatore con che ruolo o credenziali iniettate, o user e password) "
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
		 var head = "CodElettra        PolarionID        Referente%0A";
		 var body = "";
		 var foot = "";
		 for(i = 0; i < referenti.length; i++)
		 {
		   body += elettra[i] + "   " + polarion[i] + "   " +  referenti[i] + "%0A";
		 }
		 return head + body + foot;
		}
		
		
	});//document