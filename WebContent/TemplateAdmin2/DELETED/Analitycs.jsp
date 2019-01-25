<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Analytics&sup2</title>
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
     <meta http-equiv="Pragma" content="no-cache"/>
     
     <meta charset="utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <meta name="author" content="Parsifal Pirani Vandal Software"/>
     

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.js"></script>
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/redmond/jquery-ui.css"/>
  <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>-->
  <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
	
	
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>
	

  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/logout.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/VTag.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/jquery-ui-1.10.3.custom.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/jquery.mobile-1.3.1.min.css">
<style>
span {cursor:pointer;}
body
{font-size:11px;
 text-shadow:0 0px 0 #000!important;

}
</style>

<script type="text/javascript" src="../TemplateAdmin2/production/js/tablejs/DB.js"></script>
<script type="text/javascript" src="../TemplateAdmin2/analitycs.js"></script>
<script type="text/javascript"  src="../TemplateAdmin2/barChart.js"></script>
<script type="text/javascript">
$(document).ready(function()
		{
	window.open("/project2/JSP/welcome.jsp","_self");
	
		});
var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0],
    x = w.innerWidth || e.clientWidth || g.clientWidth,
    y = w.innerHeight|| e.clientHeight|| g.clientHeight;
//alert(x + ' ��������� ' + y);
</script>

<style>
#chartdiv {
  width: 100%;
  height: 500px;
}	
#headerImg {border-radius:15px;}									
</style>
</head>
<body class="ui-mobile-viewport ui-overlay-d">
<div data-url="home-page" id="home-page" data-role="page" data-theme="c" panel-menu="true" class="ui-responsive-panel">
		
		<div align="center" style="width: 100%; height: 10%;background-image: linear-gradient(#6facd5,#497bae);" data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="b">
			<div id="headerDiv" class="ui-grid-b" style="width: 100%; height: 100%;">
				<div align="left" class="ui-block-a" style="width: 20%;">
					<a id="headerImg" title="Link al precedente portale della Certificazione Prodotti 2016" href="http://10.221.208.138:8095/CheckQualityWeb2016" target="_blank" class="button"><img id="headerImg" src="Images/anno.jpg" alt="" style="width: 20%; height: 10%;margin-left:10px;margin-top:10px;"/></a>
				</div>
				<div align="center" class="ui-block-b" style="width: 60%; height: 80%;">
					<img id="headerImg" src="Images/certificazionelispa.jpg" alt="" style="width: 80%; height: 100%;margin-top:7px;margin-bottom:7px;"/>
				</div>
				<div align="right" class="ui-block-c" style="width: 20%;">
					<a id="headerImg" href="http://cm-maven.adlispa.local/cmqualityweb/CertificazioneDeiProdotti-v1.pdf" target="_blank" class="button"><img id="headerImg" src="Images/certificazione.jpg" alt=""  style="width: 40%; height: 15%;margin-right:10px;margin-top:10px;"/></a>
				</div>
			</div>
		</div> 
<%
String userName = "test";
%>
<form action="${pageContext.request.contextPath}/LogoutServlet" method="post" class="form-signin">
<div class="RDiv">
<h2>Configuration Management</h2>
<!-- <h2>Configuration Management<button class="btn btn-sm btn-primary RBanner" type="submit" value="button" name="bottone">Reports</button></h2> -->
<!-- -->
</div>
</form>
<div class="divrelativo">
<h2>VAPT Analytics<a href="production/index.jsp" class="right" target="_blank">Portale Sicurezza</a></h2>

</div>
<br>
<div style="width:95%;margin-left:auto;margin-right:auto;">

<!--  --><div id="grafico" style="height: 500px;width:80%;margin-left:auto;margin-right:auto;"></div> -->
<br>
<br>
<div id="pie_table_ALTA" style="width:15%;margin-left:auto;float:left;">
</div>
<div id="pie_table_MEDIA" style="width:15%;margin-left:auto;float:left;">
</div>
<div id="PieChart" style="width:40%;margin-left:auto;margin-left:auto;float:left;">
</div>
<div id="pie_table_BASSA" style="width:15%;margin-left:auto;float:left;">
</div>
<div id="pie_table_INFO" style="width:15%;margin-left:auto;float:left;">
</div>
</div>
<br>
<div id="contenitore" style="width:95%;margin-left:auto;margin-right:auto;float:clear;">
<!--<div id="chartdiv" style="width:100%;margin-left:auto;float:left;"></div> -->

<div id="analitica" style="margin-left:auto;margin-right:auto;">
</div>
</div>
</body>
</html>