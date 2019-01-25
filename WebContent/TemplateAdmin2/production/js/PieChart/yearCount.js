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

//var html_a = '<table class="table jumbo_table"><tr><td colspan="3" style="text-align:center;">Total: ' + '<b>' + _TOTAL + '</b>' + '</td></tr><tr><th></th><th>SISS</th><th>SIRE</th></tr>';
var html_a = '<table class="table jumbo_table"><tr><th></th><th>SISS</th><th>SIRE</th><th>TOT</th></tr>';
var html_b = '<tr><td>2015</td><td>' + SISS_2015 + '</td><td>' + SIRE_2015 + '</td><td>' + (SISS_2015 + SIRE_2015) + '</td></tr>';
var html_c = '<tr><td>2016</td><td>' + SISS_2016 + '</td><td>' + SIRE_2016 + '</td><td>' + (SISS_2016 + SIRE_2016) + '</td></tr>';
var html_d = '<tr><td>2017</td><td>' + SISS_2017 + '</td><td>' + SIRE_2017 + '</td><td>' + (SISS_2017 + SIRE_2017) + '</td></tr>';
var html_e = '<tr><td>2018</td><td>' + SISS_2018 + '</td><td>' + SIRE_2018 + '</td><td>' + (SISS_2018 + SIRE_2018) + '</td></tr>';
var html_f = '<tr><td></td><td><b>' + siss_tot + '</b></td><td><b>' + sire_tot +'</b></td>' + '<td><b>' + (siss_tot + sire_tot) +'</td></b>' +'</tr></table>';
var final_tab = html_a +html_b +html_c +html_d +html_e+html_f;
$(final_tab).appendTo('#year_count');
 

