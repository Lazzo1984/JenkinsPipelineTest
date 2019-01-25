
var $j = jQuery.noConflict();
$j(document).ready(function(){
	setInterval(check,10000);
$j('body').on('click','span.expande', function () {
		//$j("span").click(function () {
console.log("invoked");
_cur = $j(this).closest('tr').attr('id');
current = ($j(this).closest('tr').attr('id')).replace(/\./g , "\\.");// JQuery attach
var _index ;
var o = $j(this).find('img').attr('src');
var path = "Images/ExpandArrow-50_up.png";
for(i = 0;i < proto.length; i ++)
{
	if(proto[i].Elettra == _cur){_index = i;}
}

if (o == path) {
	var s = "Images/ExpandArrow-50.png";//down
var x = $j(this).closest('tr').attr('id');
$j('#' + current).after("<tr class='created_" + x + "'><td style='background-color:#fbfbfb;' colspan = '9'><div id='container" + x + "'></div></td></tr>");
var g = $j(this).find('img').attr('src', s); _handler = true;// current = x;
    Expandable(current,_index);
   
}
    else {

    h = "Images/ExpandArrow-50_up.png";
$j(this).find('img').attr('src', h);
$j('.created_' + current).remove();
_handler = false;
current = "";
    }
});	
function Expandable(x,current)
{
	//alert("triggered : " + x );
console.log(x + " - "+ current);

var tag = "<b style='color:black;'>URL Ambiente di esecuzione test : </b>" + "<a href=" + (proto[current].indirizzi).trim() + " target=_blank >" +  proto[current].indirizzi + "</a><br><br>";

var p = "<div style='float:left;'><b>Vulnerabilità : &nbsp;</b></div>";
 //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
var tRED = "<a id='rcorners1' ><b>!</b></a>&nbsp;";var tYEL = "<a id='rcorners3' ><b>!</b></a>&nbsp;";
var tORA = "<a id='rcorners2' ><b>!</b></a>&nbsp;";var tCYA = "<a id='rcorners4' ><b>i</b></a>&nbsp;";

var splitted = [];
splitted = proto[current].note.split(',');

var VTag = "<div style='width:90%;float:left;'>";
for(var j=0;j<anal.length;j++)
{
for(var o=0;o< splitted.length;o++)
{
if(splitted[o].toLowerCase().trim() === anal[j].Name.toLowerCase())// 
{
if(anal[j].Cod == "3")
{VTag += (tRED + "<b>" + splitted[o] + "</b>&nbsp;");}
else if(anal[j].Cod == "2")
{VTag += (tORA + "<b>" + splitted[o] + "</b>&nbsp;");}
else if(anal[j].Cod == "1")
{VTag += (tYEL + "<b>" + splitted[o] + "</b>&nbsp;");}
else if(anal[j].Cod == "0")
{VTag += (tCYA + "<b>" + splitted[o] + "</b>&nbsp;");}
}else{}

}
}
p += VTag + "</div>" + "<br><br>"; 
 console.log(getCookie("scope"));
 var scope = getCookie("scope");//MASSIMO.FERRARIO
 

 var ref = scope.split(".");
 if(proto[current].Referente.includes(ref[1]) || ref[1] == "ALL" ){
 	 

 		 
var tag2 = "<p>" + "<b>Credenziali/Configurazioni : </b>" + proto[current].Utenze + "</p>";

var tag1 = "<br><div style='clear:both;' class='linker'><a style='' href=" + "VAPT/" + proto[current].Elettra + ".html" + " target=_blank ><span class='fa fa-external-link'></span>&nbsp;View Report</a></div>";

if(proto[current].attach >1)
{
	tag1 += "<div class='linker'><a style='' href=" + "VAPT/" + proto[current].Elettra + "_2" +".html" + " target=_blank ><span class='fa fa-external-link'></span>&nbsp;View Report 2</a></div>";
	
}

var tag3 = "<div style='' class='linker'><a style='' href=" + "/project2/DownloadFile?report=" + proto[current].Elettra + ".html" + "><span class='fa fa-download'></span>&nbsp;Download file</a></div>";

$j('#' + "container" + x).append(tag);//url ambiente
$j('#' + "container" + x).append(tag2);//credenziali/configurazione
$j('#' + "container" + x).append(p);// Vulnerabilita
$j('#' + "container" + x).append(tag1);// Report link
$j('#' + "container" + x).append(tag3);//DOWNload
}
else
{
$j('#' + "container" + x).append(tag);
$j('#' + "container" + x).append(p);
	}
}

function getCookie(cname) {
    var name = cname + "=";
var decodedCookie = decodeURIComponent(document.cookie);
var ca = decodedCookie.split(';');
for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
        c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
    }
}
return "";
	}
function check(){
	//console.log("invoked check function");
	var cookie = getCookie('user');
	if(cookie == "" || cookie == null)
		{
		$j('body').css("opacity","0.5");
		
		}
	}
//check();

});
