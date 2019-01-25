<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DataTables Vapt</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
		
	<link rel="stylesheet" href="js/tablejs/VTag.css" />

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    	
    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <!--  -->
    <script src="../vendors/angularjs/angular.min.js"></script>
    
    
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<script src="js/tablejs2/DB.js"></script>
    <script src="js/tablejs2/app.js"></script>
	<script src="js/tablejs2/examdable.js"></script>
	
	<!-- PNotify -->
    <link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
	
	
	<style>
		.color-red 
		{background-color: red;color: black;font-weight:400;}
		.color-orange
		{background-color:orange;color: black;font-weight:400;}
		.color-yellow
		{background-color:yellow;color: black;font-weight:400;}
		.color-cyan
		{background-color:cyan;color: black;font-weight:400;}
		.table thead a {color:white;}
		tbody tr td {background-color:white;}
		.expande{cursor:pointer;}
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
                    <li><a href="index.jsp" target="_blank">Dashboard</a></li>
					<li id="preit_com"><a  href="index2.jsp" target="_blank">Pre-IT.Com</a></li>
					<li id="file_manager"><a  href="index3.jsp" target="_blank">File-Manager</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <li id="form_upload"><a  href="form_upload.jsp" target="_blank">Form Upload</a></li>
                    <li><a href="attivita.jsp" target="_blank">Attivita' non eseguite</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    
                     
                     <li id="table_vaptall"><a href="tables_dynamic.jsp" target="_blank">Vapt Report [ALL]</a></li>
                     <li id="table_vapt"><a href="tables_dynamic2.jsp" target="_blank">Vapt Report</a></li>
                     <li id="table_old"><a href="Vapt_view1.jsp" target="_blank">Vapt [OLD]</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <li id="table_table"><a href="tables.jsp" target="_blank">Owasp Issues</a></li>
                    <li id="table_table"><a href="history.jsp" target="_blank">Remediation Vapt</a></li>
                    
                    </ul>
                  </li>
                  <li>
                  <a><i class="fa fa-wrench"></i> Remediation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="Cross-Site-Scripting.jsp" target="_blank">Cross-Site-Scripting</a></li>
                      <li><a href="Flash-cross-domain.jsp" target="_blank">Flash-cross-domain</a></li>
                    </ul>
                  </li>
                  
                 <li><a><i class="fa fa-clone"></i>Layouts <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="diagrams.jsp" target="_blank">FlowChart</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Live On</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> Additional Pages <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
									</ul></li>
								<li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										
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
 		    <div id="panel_riepilogo_vapt" class="col-md-4 col-sm-4 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
					
					<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a></li>
												<li class="dropdown"><a href="#"
													class="dropdown-toggle" data-toggle="dropdown"
													role="button" aria-expanded="false"><i
														class="fa fa-wrench"></i></a>
													<ul class="dropdown-menu" role="menu">
														<li><a href="#">Settings 1</a></li>
														<li><a href="#">Settings 2</a></li>
													</ul></li>
												<li><a class="close-link"><i class="fa fa-close"></i></a>
												</li>
											</ul>
					<div id="year_count2"></div>	
					</div>
				</div>
			</div>
            

             <div class="clearfix"></div> 
 			  <div class="table-responsive">
			  
				<div class="" ng-app="sortApp" ng-controller="mainController" style="width:100%;margin-left:auto;margin-right:auto;">
				
				
				<div class="page-title">
              <div class="title_left">
                <h3>VAPT Reports <small></small></h3>
              </div>
				
              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." ng-model="searchFish">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
               
              </div>
            </div>
  
  <div class="">
    <b>Sort Type: {{ sortType }}</b><br>
    <b>Sort Reverse: {{ sortReverse }}</b><br>
    <b>Search Query: {{ searchFish }}</b><br>
	<p><b>Row Counter : {{ ( sushi | filter:searchFish).length }}</b></p>
  </div>
  <br>
 
  <table class="table table-bordered" style="font-size: 11px;">
    
    <thead>
      <tr style="background-color:#5A738E;font-weight:bold;">
	  <td>
          <a href="#" ng-click="sortType = 'id'; sortReverse = !sortReverse">
            Id           
			<span ng-show="sortType == 'id' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'id' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'Elettra'; sortReverse = !sortReverse">
            Elettra
            <span ng-show="sortType == 'Elettra' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Elettra' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'Prodotto'; sortReverse = !sortReverse">
          Prodotto
            <span ng-show="sortType == 'Prodotto' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Prodotto' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
    
		<td>
          <a href="#" ng-click="sortType = 'Polarion'; sortReverse = !sortReverse">
          Polarion
            <span ng-show="sortType == 'Polarion' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Polarion' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'Area'; sortReverse = !sortReverse">
          Area
            <span ng-show="sortType == 'Area' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Area' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
	
            <td>
          <a href="#" ng-click="sortType = 'Responsabile'; sortReverse = !sortReverse">
          Referente
            <span ng-show="sortType == 'Responsabile' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Responsabile' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
	
		<td>
          <a href="#" ng-click="sortType = 'Risultati'; sortReverse = !sortReverse">
          Risultati
            <span ng-show="sortType == 'Risultati' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Risultati' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'data_esecuzione'; sortReverse = !sortReverse">
          Data
            <span ng-show="sortType == 'data_esecuzione' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'data_esecuzione' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		
      </tr>
    
    </thead>
    
    <tbody>
      <tr id="{{roll.Elettra}}" ng-repeat="roll in sushi | orderBy:sortType:sortReverse | filter:searchFish" style="font-weight:400;">
		<td><span class="expande"><img src="images/ExpandArrow-50_up.png" alt="none" width="18" height="18" ></span>&nbsp;{{ roll.id }}</td>
        <td>{{ roll.Elettra }}</td>
        <td>{{ roll.Prodotto }}</td>
        <td><span style="line-height: 0px;" data-toggle="tooltip" data-original-title="Author Polarion : {{ roll.Referente }}" tooltip-loader>{{ roll.Polarion }}</span></td>
<!-- 	<td>{{ roll.Polarion }}</td> -->
        <td>{{ roll.Area }}</td>
        <td>{{ roll.Responsabile }}</td>
        
		<!-- <td>{{ roll.Referente }}</td> -->
        <!-- <td>{{ roll.Kali }}</td> -->
		
		<td ng-class="{'color-red': roll.Risultati === 'Alta', 'color-cyan': roll.Risultati === 'Info', 'color-yellow': roll.Risultati === 'Bassa', 'color-orange': roll.Risultati === 'Media'}">{{roll.Risultati}}</td>
				
        <td>{{ roll.data_esecuzione  | date: 'dd/MM/yyyy' }} </td>
        
        
      </tr>
    </tbody>
    
  </table>					
          </div> <!-- angulare -->
         </div>     
        <!-- /page content -->     
      </div>
    </div>
    <!-- footer content -->
		
        <footer>
          <div class="pull-right" style="">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
	
        <!-- /footer content -->
    
    </div>  <!-- main container -->
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
           
	<!-- PNotify -->
    <script src="../vendors/pnotify/dist/pnotify.js"></script>
    <script src="../vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="../vendors/pnotify/dist/pnotify.nonblock.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script src="js/LogoPersona/personal_logo.js"></script>
    <script src="js/CustomTheme/customize.js"></script>
	<script src="js/PieChart/yearCount2.js"></script>
		
  </body>
  <script type="text/javascript">
  $(document).ready(function(){
  	//PNotify.removeAll();
  	var provenienza = window.location.href;
  	var access = document.cookie;
  	if(access.includes("vapt"))	return ;  	
  	$.get( "/project2/CentroNotifiche?provenienza=" + provenienza);  	
	var __msg = "";
	var __msg1 = "Nuovi elementi aggiunti";	
	if(access.includes("ALL.ALL"))
	{__msg = "No Restriction Applied"}
	
	else
	{__msg= "Restrictions applied:\n è possibile visionare o scaricare i report dei quali si è referente di progetto"
	 __msg1= "Effettua una ricerca per cognome utilizzando la barra di ricerca qui sotto\nespandi la riga utilizzando la freccia azzurra"	
	}
	var notifiche = new PNotify({
        title: 'Information',
        text: __msg,
        type: 'info',
        hide: true,
        styling: 'bootstrap3',
        addclass: 'dark'
    });
	var notifiche1 = new PNotify({
        title: 'Information',
        text: __msg1,
        type: 'info',
        hide: true,
        styling: 'bootstrap3',
        addclass: 'dark'
    });
	
	//notifiche();
  });
	</script>
	<script>
	
	$(document).ready(function(){
	//	$('[data-toggle="tooltip"]').tooltip();
	});
	
</script>
</html>