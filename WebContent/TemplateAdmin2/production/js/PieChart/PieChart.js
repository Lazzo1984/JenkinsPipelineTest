$(document).ready(function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	today = dd+'/'+mm+'/'+yyyy;
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
			
			
			
			//fine de toda la PIE TABLE secion xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
			//ii incio tabella the count(vulnerabiliteie) 
			
			//VAPT GENERAL OVERVIEW : ' + '<b>' +sum + '</b>' + 
			
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
            text: 'Products tested : ' + '<b>' + sum // + '</b>' +', Period 07/07/2016 - ' + today
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
/*
$(document).ready(function () {

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
			sum = alta + media + bassa + info;
			//alert(alta + "\n" + media + "\n" + bassa + "\n" + info);
			contatori[0].data[0].y =((100*alta)/l);contatori[0].data[0].name += " : " + alta;
			contatori[0].data[1].y =((100*media)/l);contatori[0].data[1].name += " : " + media;
			contatori[0].data[2].y =((100*bassa)/l);contatori[0].data[2].name += " : " + bassa;
			contatori[0].data[3].y =((100*info)/l);contatori[0].data[3].name += " : " + info;
			
    Highcharts.chart('PieChart', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Browser market shares January, 2015 to May, 2015'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: contatori[0].data
		}]
			/*[{
                name: 'Microsoft Internet Explorer',
                y: 56.33
            }, {
                name: 'Chrome',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: 'Firefox',
                y: 10.38
            }, {
                name: 'Safari',
                y: 4.77
            }, {
                name: 'Opera',
                y: 0.91
            }, {
                name: 'Proprietary or Undetectable',
                y: 0.2
            }]
        }]
		
       });
});
*/