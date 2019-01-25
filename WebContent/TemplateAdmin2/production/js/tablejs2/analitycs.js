(document).ready(function(){
	analitycs();
function analitycs()
	{
		
        var l = Object.keys(proto).length;
		var l2 = Object.keys(anal).length;
		
		for(x=0;x<l2;x++)
		{
			for(k=0;k<l;k++)
			{	//splitted[o].toLowerCase() === anal[j].Name.toLowerCase()
				var Lcase = proto[k].note.toLowerCase();
				if(Lcase.includes(anal[x].Name.toLowerCase())){anal[x].Count +=1;anal[x].Elenco += " - " + proto[k].Polarion}else{}
				//if(anal[x].Name.toLowerCase() === proto[k].note.toLowerCase()){anal[x].Count +=1;anal[x].Elenco += " - " + proto[k].Polarion}else{}
			}

		}		
			var alta=0;var media=0;var bassa=0;var info=0;
			for(o=0;o<l;o++)
			{
				if(proto[o].Risultati == "Alta"){alta+= 1;}
				else if(proto[o].Risultati == "Media"){media+=1}
				else if(proto[o].Risultati == "Bassa"){bassa+=1;}
				else if(proto[o].Risultati == "Info"){info+=1;}
				
			}
			sum = alta + media +bassa + info;
			//alert(alta + "\n" + media + "\n" + bassa + "\n" + info);
			contatori[0].data[0].y =((100*alta)/l);contatori[0].data[0].name += " : " + alta;
			contatori[0].data[1].y =((100*media)/l);contatori[0].data[1].name += " : " + media;
			contatori[0].data[2].y =((100*bassa)/l);contatori[0].data[2].name += " : " + bassa;
			contatori[0].data[3].y =((100*info)/l);contatori[0].data[3].name += " : " + info;
			
			
			//PIE TABLE SECTION xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
			var pie_table = '<table class="table table-bordered"><thead><tr><th style="background-color:red;">High</th></tr></thead><tbody>';
			
			for(w=0;w<l;w++)
			{
				pie_table += '<tr>';
				
				if(proto[w].Risultati == 'Alta'){pie_table += '<td>' + proto[w].Polarion + '</td>';pie_table += '</tr>';}
				
			}
			
			pie_table += '</tbody><tfoot><tr>....</tr></tfoot></table>';
			
			$(pie_table).appendTo('#pie_table_ALTA');
			
			var pie_table_M = '<table class="table table-bordered"><thead><tr><th style="background-color:orange;">Medium</th></tr></thead><tbody>';
			
			for(w=0;w<l;w++)
			{
				pie_table_M += '<tr>';
				
				if(proto[w].Risultati == 'Media'){pie_table_M += '<td>' + proto[w].Polarion + '</td>';pie_table_M += '</tr>';}
				
			}
			
			pie_table_M += '</tbody><tfoot><tr>....</tr></tfoot></table>';
			
			$(pie_table_M).appendTo('#pie_table_MEDIA');
			
			var pie_table_B = '<table class="table table-bordered"><thead><tr><th style="background-color:yellow;">Low</th></tr></thead><tbody>';
			
			for(w=0;w<l;w++)
			{
				pie_table_B += '<tr>';
				
				if(proto[w].Risultati == 'Bassa'){pie_table_B += '<td>' + proto[w].Polarion + '</td>';pie_table_B += '</tr>';}
				
			}
			
			pie_table_B += '</tbody><tfoot><tr>....</tr></tfoot></table>';
			
			$(pie_table_B).appendTo('#pie_table_BASSA');
			
			var pie_table_I = '<table class="table table-bordered"><thead><tr><th style="background-color:cyan;">Info</th></tr></thead><tbody>';
			
			for(w=0;w<l;w++)
			{
				pie_table_I += '<tr>';
				
				if(proto[w].Risultati == 'Info'){pie_table_I += '<td>' + proto[w].Polarion + '</td>';pie_table_I += '</tr>';}
				
			}
			
			pie_table_I += '</tbody><tfoot><tr>....</tr></tfoot></table>';
			
			$(pie_table_I).appendTo('#pie_table_INFO');
			
			
			//fine de toda la PIE TABLE secion xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
			//ii incio tabella the count(vulnerabiliteie) 
			
			var html = '<table class="table table-bordered"><thead><tr><th>Issues (Owasp Burp)</th><th>Quantity</th><th>Severity</th><th>Products affected by issues</th></tr></thead><tbody>';
			
			for(y=0;y<l2;y++)
			{	
				if(anal[y].Count !== 0)
				{html += "<tr><td>" + anal[y].Name + "</td>" + "<td>" + anal[y].Count + "</td>";
				if(anal[y].Cod == "3"){html += '<td style="background-color:red;">' + "High" + '</td>';}
				else if(anal[y].Cod == "2"){html += '<td style="background-color:orange;">' + "Medium" + '</td>';}
				else if(anal[y].Cod == "1"){html += '<td style="background-color:yellow;">' + "Low" + '</td>';}
				else if(anal[y].Cod == "0"){html += '<td style="background-color:cyan;">' + "Info" + '</td>';}
				html += "<td>" + anal[y].Elenco + "</td>";
				}
				
				}
				html += '</tbody><tfoot><tr>....</tr></tfoot></table>';

				$(html).appendTo('#analitica');
			
			//alert(str);
			}
			//end of anlitica
			$(function () {Highcharts.chart('PieChart', {
							chart: {
							type: 'pie',
							options3d: {
							enabled: false,
							alpha: 45,
							beta: 0
            }
        },
        title: {
            text: 'VAPT 2016 GENERAL OVERVIEW : ' + '<b>' +sum + '</b>' + ' Products tested'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: contatori
		/*[{
            type: 'pie',
            name: 'Vapt Severity',
            data: [
               {name: 'Info',y: 25,color: 'cyan',selected: true},
               {name: 'Low',y: 25,color: 'yellow',selected: true},
               {name: 'Medium',y: 15,color: 'orange',selected: true},
               {name: 'High',y: 35,sliced: true,color: 'red',selected: true}
            ]
        }]
		*/
    });
});
			
			
			
			
			
			// end of story
			});