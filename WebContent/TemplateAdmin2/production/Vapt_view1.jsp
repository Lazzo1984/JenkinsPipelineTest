<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>VAPT [OLD]</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    
    
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="js/tablejs/VTag.css" />

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.css" rel="stylesheet">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
    
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script>
	
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">
	
	
	
	
	<!--<script src="js/tablejs/DB.js"></script>
    <script src="js/tablejs/app.js"></script>
	<script src="js/tablejs/examdable.js"></script>
	 -->
	 
	<style>
		.color-red 
		{background-color: red;color: black;}
		.color-orange
		{background-color:orange;color: black;}
		.color-yellow
		{background-color:yellow;color: black;}
		.color-cyan
		{background-color:cyan;color: black;}
		.table thead a {color:white;}
		
		

		.selEcted {
		background-color:#EDEDED !important;
					}
		.selectedX {
		background-color:#EDEDED !important;
					}
	</style>
  </head>

  <body class="nav-md">
  <%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("/project2/JSP/welcome.jsp");
%>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"> <span><img class="" height="32" width="42" src="/project2/TemplateAdmin2/Images/PortaleSicurezza.png" alt="">Portale Sicurezza</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%=userName %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.jsp">Dashboard</a></li>
                      <li><a href="index2.jsp">Pre-IT.Com</a></li>
                      <li><a href="index3.jsp">File-Manager</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    
                      <li><a id="form_upload" href="form_upload.jsp">Form Upload</a></li>
                      <li><a href="attivita.jsp" target="_blank">Attivita' non eseguite</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      
                      <li><a href="tables_dynamic.jsp">Vapt Report [ALL]</a></li>
                      <li><a href="tables_dynamic2.jsp">Vapt Report</a></li>
                      <li><a href="Vapt_view1.jsp">Vapt [OLD]</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <!-- 
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                      -->
                      <li><a href="tables.jsp">Owasp Issues</a></li>
                      <li id="table_table"><a href="history.jsp">Remediation Vapt</a></li>
                    </ul>
                  </li>
                  <li>
                  <a><i class="fa fa-wrench"></i> Remediation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="Cross-Site-Scripting.jsp">Cross-Site-Scripting</a></li>
                      <li><a href="Flash-cross-domain.jsp">Flash-cross-domain</a></li>
                     
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-clone"></i>Layouts <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="diagrams.jsp">FlowChart</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Live On</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> Additional Pages <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									<!-- <li><a href="e_commerce.html">E-commerce</a></li>
										<li><a href="projects.html">Projects</a></li>
										<li><a href="project_detail.html">Project Detail</a></li>
										<li><a href="contacts.html">Contacts</a></li>
										<li><a href="profile.html">Profile</a></li>
									</ul></li>
								<li><a><i class="fa fa-windows"></i> Extras <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="page_403.html">403 Error</a></li>
										<li><a href="page_404.html">404 Error</a></li>
										<li><a href="page_500.html">500 Error</a></li>
										<li><a href="plain_page.html">Plain Page</a></li>
										<li><a href="login.html">Login Page</a></li>
										<li><a href="pricing_tables.jsp">Pricing Tables</a></li> -->
									</ul></li>
								<li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<!-- <li><a href="#level1_1">Level One</a>
										<li><a>Level One<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li class="sub_menu"><a href="level2.html">Level
														Two</a></li>
												<li><a href="#level2_1">Level Two</a></li>
												<li><a href="#level2_2">Level Two</a></li>
											</ul></li>
										<li><a href="#level1_2">Level One</a></li> -->
									</ul></li>
								<li><a href="javascript:void(0)"><i
										class="fa fa-laptop"></i> Landing Page <span
										class="label label-success pull-right">Coming Soon</span></a></li>
							</ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                   <img id="logout_logo" src="" alt=""><%=userName%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post" class="form-signin">
                    <li><button class="btn btn-sm btn-primary RBanner" type="submit" value="button" name="bottone">Log Out</li>
                    </form>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">1</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>ppirani</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Welcome in
                        </span>
                      </a>
                    </li>                   
                   
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
           <div class="">
 		  
            

             <div class="clearfix"></div> 
             <h2><input type="button" id="mailBombing" class="btn btn-primary btn-sm" value="SendEmail"></input><b>Attività da Rieseguire : <small>Portale Certificazione Prodotti</small> </b></h2>
            
             <br>
 			  <div class="table-responsive">
        <div id="tabella">
         <table id="example" class="table jambo_table bulk_action" width="100%"></table>
      </div>
      </div>
      
      </div>
      </div>
               
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    
    <!-- <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>-->
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script>
    

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	<!-- <script src="js/tablejs/DB.js"></script> -->
	<!-- <script src="js/table_1/analitycs.js"></script> -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
	
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script type="text/javascript" >
	/*
	$(document).ready(function(){
		
		var s = [];
		var h = [];
		var referenti = [];
		var polarion = [];
		var elettra =[];
		
		var rel_url = "/project2/CertProd";
		
		var url = "http://127.0.0.1:2222/project2/CertProd"; //verso la mia servlet NATTATA su VirtualBOx 127.0.0.1:2222 => 139.168.1.10:8080
		
		var url_produzione = "http://10.221.208.138:8095/project2/CertProd"; // mio Tomcat in produzione sotto il portale di tony
		
		var URLtoNYLOCALE = "http://10.221.6.126:8080/CheckQualityWeb/CheckQualityWeb"; // boh qualcosa in locale da tony
		
		var url_CP = "http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWeb";  //Portale certificazione prodotti 
		
		var localJSON = "CP.json"; //http://10.221.208.138:8095
		
		$.getJSON(rel_url, function(json) {
		
		//console.log(Object.keys(json));
		//console.log(json.tableQuality[1][1] + " - " + json.tableQuality[1][2]);
		
		var counter = 0;
		var Ltablesecurity = json.tableSecurity.length;
				
		for(i=0; i < Ltablesecurity; i++)
		{
		//if(json.tableSecurity[i][5] ==  "Attivita' non ancora eseguita") // QUESTA QUESTA
		if(/^2016.*$/.test(json.tableSecurity[i][10]) && !json.tableSecurity[i][5].includes("Non applicabile"))		
		{ 
		  		  	
		var tsmp = (DateToTstamp(json.tableSecurity[i][1]));
		  		  
		  
		s.push([
				tsmp,                                  //   TIMESTAMP           
				json.tableGeneral[i][0],              //   DATA 
				json.tableGeneral[i][3],             //   POLARION
				json.tableGeneral[i][1],            //   ELETTRA
				json.tableGeneral[i][15],          //   AUTORE
				json.tableSecurity[i][5],   	  //   STATO (KALI LINUX)
				json.tableGeneral[i][4],   		 //   DEFECT
				json.tableSecurity[i][10]       //   NOTE
				]); 	 
			}		
		}
		
		
		var ordArr = s.sort(function(a,b){return b[0] - a[0]});
		//console.log(ordArr);
		
		//AttNese(s);
		
		function DateToTstamp(_date) // Se ha i : significa che è in formato 12:00 quindi bisogna aggiungere la data es 12/31/2017 12:00
		{
		var colon = ":";
		if(_date.includes(colon))
		{
		var currentdate = new Date(); 
		var datetime = currentdate.getFullYear() + "/" +
              (currentdate.getMonth()+1)  + "/" +
               currentdate.getDate() + " " + _date;

		var k = Math.round(new Date(datetime).getTime()/1000);
		
		return k;
		}
		else                              // altrimenti sotituisci i - con gli / e inverti gg con mm e aggiungi 12:00 e converti in new Date()
		{
		var myDate = _date;
		myDate = myDate.split("-");
				
		var newDate = myDate[2] + "/" + myDate[1] + "/" + myDate[0] + " 12:00:00";
		var k = Math.round(new Date(newDate).getTime()/1000);
		
		return k;
		}
		}
		// # END OF DateToTstamp
		//****************************************
		function sortNumber(a,b) {
		if (a[1] === b[1]) {
        return 0;
		}
			else {
			return (a[1] < b[1]) ? -1 : 1;
		}	
		}
		//****************************************
		function Uri4Defect(url,defect)
		{
		if(defect != null){
		var newurl ="";		
		var x = (url.includes("siss"))?"SISS":"SIRE";
		switch(x) {
		case "SISS":
        newurl = "http://sgr-siss.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" + defect ;
        break;
		case "SIRE":
        newurl = "http://sgr-sire.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" + defect;
        break;
		default:
		newurl = "vai ngulo vai";
		console.log(newurl);
		      
		}
		return newurl; 
		}
		else
		{
		return "";
		}
		 return "something goes wrong";
		}
		
		//***********************************************
		
		
		$('#example').DataTable( {
        data: ordArr,
		"order": [[ 0, "desc" ]],
        columns: [
			
		    { title: "TimeStamp" },
            { title: "Data" },
            { title: "Polarion" },
            { title: "Elettra" },
            { title: "Author" },
            { title: "Stato" },
			{ title: "Defect" },
			{ title: "Note"}
            
        ]
    } );
		$('#example tbody').on( 'click', 'tr', function () {
			$(this).toggleClass('selEcted');
			//alert("invoked");
			});
		}); //AJAX 
		

		
	});//document
	*/
      </script>
     <!--  <script src="js/sparetables/VaptOldMail.js"></script>-->
	<script type="text/javascript" src="js/sparetables/VaptOld.js"></script>
	<script src="js/LogoPersona/personal_logo.js"></script>
	
	
  </body>
</html>