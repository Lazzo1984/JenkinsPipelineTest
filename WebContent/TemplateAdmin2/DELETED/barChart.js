$(document).ready(function(){
	/*
		var url = "http://127.0.0.1:2222/project2/CertProd"; //verso la mia servlet NATTATA su VirtualBOx 127.0.0.1:2222 => 139.168.1.10:8080
		
		var url_produzione = "http://10.221.208.138:8095/project2/CertProd"; // mio war in produzione sotto il tomcat di tony tomcat7-pmta
		
		var URLtoNYLOCALE = "http://10.221.6.126:8080/CheckQualityWeb/CheckQualityWeb"; // boh qualcosa in locale da tony
		*/
		//var localJSON = "CP.json"; //http://10.221.208.138:8095
		
		var RelURI = "/project2/CertProd";
		
		$.getJSON(RelURI, function(json) {
		//console.log(Object.keys(json));
		//console.log(json.tableQuality[1][1] + " - " + json.tableQuality[1][2]);
		
		var counter = 0;
		var Ltablesecurity = json.tableSecurity.length;
	    var A1 = 0;var A2 = 0;var A3 = 0;
		var A4 = 0;var A5 = 0;var A6 = 0;
		var A7 = 0;
		
		for(var i=0;i< Ltablesecurity;i++)
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
		else
		{}
		
		}
		//console.log(A1 + " - " + A2);
		var valori = [+A1,A2,A3,A4,A5,A6,A7];
		var categorie = ["Attivita'_Z_non ancora_Z_eseguita","Non applicabile","Non testabile","Riscontrate_Z_vulnerabilita'_Z_di tipo Alta","Riscontrate_Z_vulnerabilita'_Z_di tipo Media","Riscontrate_Z_vulnerabilita'_Z_di tipo Bassa","Riscontrate_Z_vulnerabilita'_Z_di tipo Info"];
		
		grafico(valori,categorie);
		
		function grafico(valori,categorie)
		{
		Highcharts.chart('grafico', {
        chart: {
        type: 'column',
		
    },
	colors: ['#000000', '#43b726', '#e5ede3','#f44242','#f47141','#f4d941','#41dcf4'],
    title: {
        text: 'Portale certificazione Prodotti 2017'
    },
    subtitle: {
        text: 'Source: <a href="http://cm-maven.adlispa.local/cmqualityweb">Portale Certificazione Prodotti 2017</a>'
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
		[categorie[6],A7]
        ],
        dataLabels: {
            enabled: true,
            rotation: -20,
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
		}//fine grafico
	
		});		
	});//document