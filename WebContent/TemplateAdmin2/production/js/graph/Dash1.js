$(document).ready(function(){
	/*$.ajax({
    type: "GET",
    //headers: {"Origin": "http://www.evil.com"},
    url: "http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWeb"
		}).done(function (data) {
		console.log(data);
		});
		*/
		//questa funzione per fare i test
		var s = [];
		var h = [];
		var url = "http://127.0.0.1:2222/project2/CertProd"; 				//verso la mia servlet sulla macchina NATTATA locale
		var url_produzione = "http://10.221.208.138:8095/project2/CertProd";
		var locale = "js/graph/CP.json";
		$.getJSON(url, function(json) {
		//console.log(Object.keys(json));
		
		var counter = 0;
		var Ltablesecurity = json.tableSecurity.length;
		//alert(Ltablesecurity);
		
		
		for(i=0;i< Ltablesecurity;i++)
		{
		if(json.tableSecurity[i][5] ==  "Attivita' non ancora eseguita")
		{ 
		  var tmp = (Date.parse(json.tableSecurity[i][1]));
		  s.push([tmp,1,json.tableSecurity[i][1],json.tableSecurity[i][10],json.tableSecurity[i][5]]);
		 
		}
		
		}
		//alert(s);
		s.sort(sortNumber);
		
		//grafico attività non eseguiita
		var Lbacklog = (json.backlog.length);
		for(i=0;i<Lbacklog;i++)
		{
			var tmp = (Tstamp(json.backlog[i][0]));
			h.push([tmp,+(json.backlog[i][1])]);
			
		}
		console.log(h);
		h.sort(sortNumber);
		function Tstamp(_date)
		{
		
		var d =	(Date.parse(_date));
		alert(d);
		return +d;               //1340220044000;
		}
		
		AttNese(s);
		
		
		function DateToTstamp(_date)
		{
		var colon = ":";
		if(_date.includes(colon))
		{
		return new Date().getTime();
		}
		else{
		var myDate = _date + " " + "19:27:39";// 25/12/2012 05:52:38.98888
		myDate=myDate.split("-");
		var newDate=myDate[1]+"/"+myDate[0]+"/"+myDate[2];
		
		//var newDate= myDate[2]+"/"+myDate[1]+"/"+myDate[0];
		
		var d = new Date(newDate).getTime();
		return d;
		}
		}
		
		
		
		
		
		
		function sortNumber(a,b) {
		if (a[0] === b[0]) {
        return 0;
		}
			else {
			return (a[0] < b[0]) ? -1 : 1;
		}	
		}
		
		function AttNese(s)
		{
		//console.log(s);
		 var table = '<table class="table table-bordered"><tr><th>#</th><th>TimeStamp</th><th>Quantita</th><th>Data</th><th>Polarion</th><th>Stato</th></tr>';
		
		var l = (s.length);
		var tag = "";
		var conta = 0;
		for(i=0; i<l; i++)
		{			
		
		tag = "<tr>";
		tag += "<td>" + conta++ + "</td>";
		tag += "<td>" + s[i][0] + "</td>";
		tag += "<td>" + s[i][1] + "</td>";
		tag += "<td>" + s[i][2] + "</td>";
		tag += "<td>" + s[i][3] + "</td>";
		tag += "<td>" + s[i][4] + "</td>";
		
		tag += "</tr>";  
      
		table += tag;
		
		}


			var end = "</table>";
		table += end;
		//$('#tabella').append(table); qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
		
		}
		// high
		Highcharts.chart('Graph1', {
        chart: {
            zoomType: 'x'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                    'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
        },
        xAxis: {
            type: 'datetime'
        },
        yAxis: {
            title: {
                text: 'Exchange rate'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: {
                    radius: 2
                },
                lineWidth: 1,
                states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },

        series: [{
            type: 'area',
            name: 'quantity',
            data: h
        }]
    });
		
		//high
		});
		

		
	});//document