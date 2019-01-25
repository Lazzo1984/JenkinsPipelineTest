/*
$('#example tbody').on( 'click', 'tr', function () {
			$(this).toggleClass('selEcted');
			alert("invoked");
			});	
			*/

			$('#mailBombing').click(function(){
			var Elettra;var Polarion;var Referente;
			elettra = [];polarion = []; referenti = [];
			$("#example tbody").find("tr").each(function() {

				var isSelected = $(this).hasClass('selEcted'); 
				if(isSelected)
				{
				var $tds = $(this).find('td');
				Elettra = $tds.eq(3).text();
				Polarion = $tds.eq(2).text();
				Referente = $tds.eq(4).text();
				insertData(Elettra,Polarion,Referente);
				}
				else
				{}
				}); // for each
				console.log(elettra,polarion,referenti);
				if(checkRef())
				{EmailWrite();}
				else
				{
				alert("Error : la selezione multipla deve avere lo stesso referente");
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