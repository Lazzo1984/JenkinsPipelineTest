$(document).ready(function()	{
		//console.log(Object.keys(json));
		var counter = 0;
		var Ltablesecurity = json.tableSecurity.length;
		
	    var A1 = 0;var A2 = 0;var A3 = 0;
		var A4 = 0;var A5 = 0;var A6 = 0;
		var A7 = 0;var A8 = 0;
		
		for(i=0;i< Ltablesecurity;i++)
		{
		if(json.tableSecurity[i][5] ==  "Attivita' non ancora eseguita")
		{
			A1++;
			
		}
		if(json.tableSecurity[i][5] ==  "Non applicabile")
		{
			A2++;
			
		}	
		if(json.tableSecurity[i][5] ==  "Non testabile")
		{
			A3++;
			
		} 
		 if(json.tableSecurity[i][5] ==  "Riscontrate vulnerabilita' di tipo Alta")
		{
			A4++;
		}
		if(json.tableSecurity[i][5] ==  "Riscontrate vulnerabilita' di tipo Media")
		{
			A5++;
		}
		if(json.tableSecurity[i][5] ==  "Riscontrate vulnerabilita' di tipo Bassa")
		{
			A6++;
		}
		if(json.tableSecurity[i][5] ==  "Riscontrate vulnerabilita' di tipo Info")
		{
			A7++;
		}
		if(json.tableSecurity[i][5] ==  "Nessuna vulnerabilita' riscontrata")
		{
			A8++;
		}
		else
		{}
		
		}
		
		var valori = [+A1,A2,A3,A4,A5,A6,A7,A8];
		var categorie = ["Attivita'_Z_non ancora_Z_eseguita","Non applicabile","Non testabile","Riscontrate_Z_vulnerabilita'_Z_di tipo Alta","Riscontrate_Z_vulnerabilita'_Z_di tipo Media","Riscontrate_Z_vulnerabilita'_Z_di tipo Bassa","Riscontrate_Z_vulnerabilita'_Z_di tipo Info","Nessuna_Z_vulnerabilita'_Z_riscontrata"];
		
		grafico(valori,categorie);
		
		function grafico(valori,categorie)
		{
		Highcharts.chart('Graph1', {
        chart: {
        type: 'column',
		
    },
	colors: ['#000000', '#0066FF', '#00CCFF','#f44542','#f47141','#f4d941','#41dcf4','#dddddd'],
    title: {
        text: 'Portale Certificazione Prodotti 2018'
    },
    subtitle: {
        text: 'Source: <a href="http://cm-maven.adlispa.local/cmqualityweb">Portale Certificazione Prodotti 2018</a>'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: 0,
			formatter: function () {
            var x = this.value.replace(/_Z_/g, "<br/>");
			return  x;
        },
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Certificazione Prodotti'
        }
    },
    legend: {
        enabled: true
    },
    tooltip: {
	    formatter:function(){var gr = this.point.name.replace(/_Z_/g, "<br/>");
			
			gr += '<br/>Quantity : <b>' + this.point.y + '</b>';
			return  gr;}
       // pointFormat:'Quantity : <b>{point.y}</b>'
		
    },
    series: [{
	colorByPoint: true,
        name: 'VAPT General Overview ',
        data: [
		[categorie[0],A1],
		[categorie[1],A2],
		[categorie[2],A3],
		[categorie[3],A4],
		[categorie[4],A5],
		[categorie[5],A6],
		[categorie[6],A7],
		[categorie[7],A8]
        ],
        dataLabels: {
            enabled: true,
            rotation: 0,
            color: '#FFFFFF',
		    align: 'right',
            format: '{point.y}', // one decimal non penso proprio
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
	});	
		}
		// popola la piccole tables sulla pagina index.jsp
	var totale = A1+A2+A3+A4+A5+A6+A7+A8;
	var subtotale = A4+A5+A6+A7+A8;
	
	var s = "<sup style='font-size:35%;vertical-align:super;color:red;'>" + subtotale + "</sup>";
	/*
	for (var i = 0; i < subtotale.length; i++) {
	   // console.log(tot.charAt(i));
	    s	+= "&sup" + subtotale.charAt(i) + ";";
	}
	*/
	
		$('#total').html(totale + s);
		$('#ALTA').text(A4);
		$('#MEDIA').text(A5);
		$('#BASSA').text(A6);
		$('#INFO').text(A7);
		$('#NONE').text(A8);
	//	}); 
		

		
	});//document