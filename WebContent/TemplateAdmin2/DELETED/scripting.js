$(document).ready(function () {
				
 //    alert(Object.keys(proto).length);       
    
      var c = Object.keys(proto).length;
      
      var html = '<table class="table table-bordered"><thead><tr><th>ID</th><th>Elettra</th><th>prodotto</th><th>resonsabile</th><th>Polarion</th><th>artefatto</th><th>Referente</th><th>Alice</th><th>Kali</th><th>Risultati</th><th>data_esecuzione</th></tr></thead><tbody>';
      var span = ' <span><img src="../TemplateAdmin2/Images/ExpandArrow-50_up.png" alt="none" width="18" height="18" ></span>';
	  
        for (var i = 0; i < c; ++i) 
		{
            html += '<tr id=' + i + '>';
           
                html += '<td>' + span + '&nbsp;' + proto[i].id + '</td>';
            	html += '<td>' + proto[i].Elettra + '</td>';
                html += '<td>' + proto[i].Prodotto + '</td>';
				html += '<td>' + proto[i].Responsabile + '</td>';
                html += '<td>' + proto[i].Polarion + '</td>';
				html += '<td>' + proto[i].artefatto + '</td>';
				html += '<td>' + proto[i].Referente + '</td>';
				html += '<td>' + proto[i].Alice + '</td>';
				html += '<td>' + proto[i].Kali + '</td>';
				
				if(proto[i].Risultati == "Bassa"){html += '<td style="background-color:yellow;">' + proto[i].Risultati + '</td>';}
				else if(proto[i].Risultati == "Media"){html += '<td style="background-color:orange;">' + proto[i].Risultati + '</td>';}
				else if(proto[i].Risultati == "Alta"){html += '<td style="background-color:red;">' + proto[i].Risultati + '</td>';}
				else if(proto[i].Risultati == "Info"){html += '<td style="background-color:cyan;">' + proto[i].Risultati + '</td>';}
				else if(proto[i].Risultati == ""){html += '<td style="background-color:white;">' + proto[i].Risultati + '</td>';}
				
				html += '<td>' + proto[i].data_esecuzione + '</td>';
				html += "</tr>"; 
		}
       
       
        html += '</tbody><tfoot><tr>....</tr></tfoot></table>';

        $(html).appendTo('#tabella');
		var _handler = false;
        var current = "";
		
    $("span").click(function () {
		var fixedpath = "../TemplateAdmin2/Images/";
        current = $(this).closest('tr').attr('id');
		
        var o = $(this).find('img').attr('src');
        var path = "../TemplateAdmin2/Images/ExpandArrow-50_up.png";
      //  alert(current +  " " + o + " " +path);
        if (o == path) {
			var s = "../TemplateAdmin2/Images/ExpandArrow-50.png";//down
            var x = $(this).closest('tr').attr('id');
            $('#' + x).after("<tr class='created_" + x + "'><td colspan = '11'><div id='container" + x + "'></div></td></tr>");
            var g = $(this).find('img').attr('src', s); _handler = true; current = x;
            Expandable(x);
		   
        }
            else {

            h = "../TemplateAdmin2/Images/ExpandArrow-50_up.png";
            $(this).find('img').attr('src', h);
            $('.created_' + current).remove();
            _handler = false;
            current = "";
        }
	});
	
	function Expandable(x)
	{
		//alert("triggered : " + x );
		
		var tag = "<a href=" + (proto[current].indirizzi).trim() + " target=_blank >" + "<b style=color:black;>URL : </b>" + proto[current].indirizzi +"</a>";
		
		var p = "<p>" + "<b>Vulnerabilità : </b>" + proto[current].note + "</p>";
		var tag1 = "<a href=" + "../TemplateAdmin2/VAPT/" + proto[current].Elettra + ".html" + " target=_blank >See reports</a>";
		if(proto[current].attach >1)
		{
			tag1 += "</br><a href=" + "../TemplateAdmin2/VAPT/" + proto[current].Elettra + "_2" +".html" + " target=_blank >See reports 2</a>";
		}
		var tag2 = "<p>" + "<b>Credenziali/Configurazioni : </b>" + proto[current].Utenze + "</p></br>";
		$('#' + "container" + x).append(tag);
		$('#' + "container" + x).append(p);
		$('#' + "container" + x).append(tag2);
		$('#' + "container" + x).append(tag1);
		
		
	}
	/*
	function analitycs()
	{
		
        var l = Object.keys(proto).length;
		var l2 = Object.keys(anal).length;
		
		for(x=0;x<l2;x++)
		{
			for(k=0;k<l;k++)
			{
				if(proto[k].note.includes(anal[x].Name)){anal[x].Count +=1;anal[x].Elenco += "- " + proto[k].Polarion}else{}
  
			}

		}		
			
			var html = '<table class="table table-bordered"><thead><tr><th>Issue</th><th>Quantity</th><th>Severity</th><th>Products affected by issues</th></tr></thead><tbody>';
			
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
			*/
});