var _TOTAL = proto.length;
var Siss_obj = [];
var Sire_obj = [];
var SISS_2015 = 0;var SISS_2016 = 0;var SISS_2017 = 0;var SISS_2018 = 0;
var SIRE_2015 = 0;var SIRE_2016 = 0;var SIRE_2017 = 0;var SIRE_2018 = 0;
for(i=0; i < _TOTAL;i++)
{
	if(proto[i].Area == "SISS")
	{		
		if(proto[i].data_esecuzione.includes("2015"))
		{
			SISS_2015++;
		}
	    else if(proto[i].data_esecuzione.includes("2016"))
		{
			SISS_2016++;
		}
		else if(proto[i].data_esecuzione.includes("2017"))
		{
			SISS_2017++;
		}
		else if(proto[i].data_esecuzione.includes("2018"))
		{
			SISS_2018++;
		}
		
	}
	else
	{
		if(proto[i].data_esecuzione.includes("2015"))
		{
			SIRE_2015++;
		}
		else if(proto[i].data_esecuzione.includes("2016"))
		{
			SIRE_2016++;
		}
		else if(proto[i].data_esecuzione.includes("2017"))
		{
			SIRE_2017++;
		}
		else if(proto[i].data_esecuzione.includes("2018"))
		{
			SIRE_2018++;
		}
	}
}
var siss_tot = (SISS_2015 + SISS_2016 + SISS_2017 + SISS_2018);
var sire_tot = (SIRE_2015 + SIRE_2016 + SIRE_2017 + SIRE_2018);
var siss_sire = siss_tot + sire_tot;
var html_a = '<table class="table jumbo_table"><tr><th></th><th>2015</th><th>2016</th><th>2017</th><th>2018</th><th>' + siss_sire + '</th></tr>';
var html_b = '<tr><td><b>SISS</b></td><td>' + SISS_2015 + '</td><td>'+SISS_2016 + '</td><td>'+SISS_2017 +'</td><td>'+SISS_2018+'</td><td><b>'+siss_tot+'</b></td></tr>';
var html_c = '<tr><td><b>SIRE</b></td><td>' + SIRE_2015 + '</td><td>'+SIRE_2016 + '</td><td>'+SIRE_2017 +'</td><td>'+SIRE_2018+'</td><td><b>'+sire_tot+'</b></td></tr>';

var final_tab = html_a +html_b +html_c;
$(final_tab).appendTo('#year_count2');
 

