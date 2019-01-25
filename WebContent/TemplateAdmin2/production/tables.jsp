<%@ page import="com.dev.project2.Servlet,java.io.*,javax.xml.parsers.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*,javax.xml.*,org.w3c.dom.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Owasp issues</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
<!-- JQVMap -->
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<script	src="../vendors/datejs/date.min.js"></script>

<!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>



<!-- <link rel="stylesheet" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> -->

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">

<!-- Angular app JS -->
    <script src="../vendors/angularjs/angular.min.js"></script>
    <script src="js/table_1/proto2.js"></script>
	<script src="js/table_1/app.js"></script>
	
    
<style>
.selEcted {background-color:#a3abb3 !important;}

.color-red 
		{background-color: red;color: black;}
		.color-orange
		{background-color:orange;color: black;}
		.color-yellow
		{background-color:yellow;color: black;}
		.color-cyan
		{background-color:cyan;color: black;}
		.table thead a {color:white;}
		tbody tr td {background-color:white;}
		.expande{cursor:pointer;}
</style>
</head>

<body class="nav-md">
  <%
  	String userName = null;
    String _unique = null;
    Cookie[] cookies = request.getCookies();
    boolean test = false;
    
    com.dev.project2.Servlet _obj = new com.dev.project2.Servlet();


  if(cookies !=null){
  for(Cookie cookie : cookies){
  	if(cookie.getName().equals("unique"))
  	{ 
  		_unique = cookie.getValue();test = true;
  	}
  	if(cookie.getName().equals("user"))
  	{
  		userName = cookie.getValue();test = true;
  	}
  }
  }
  if(!test)
     {response.sendRedirect("/project2/JSP/welcome.jsp");}
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
							<img src="images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=userName%></h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Home <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="index.jsp">Dashboard</a></li>
										<li id="preit_com"><a  href="index2.jsp" target="_blank">Pre-IT.Com</a></li>
										<li id="file_manager"><a  href="index3.jsp" target="_blank">File-Manager</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Forms <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
										<li><a id="form_upload" href="form_upload.jsp" target="_blank">Form Upload</a></li>
										<li><a href="attivita.jsp" target="_blank">Attivita' non eseguite</a></li>
									</ul></li>
								
								<li><a><i class="fa fa-table"></i> Tables <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
										
                     					 <li><a href="tables_dynamic.jsp" target="_blank">Vapt Report [ALL]</a></li>
                     					 <li><a href="tables_dynamic2.jsp" target="_blank">Vapt Report</a></li>
                     					 <li id="Vapt_view1"><a href="Vapt_view1.jsp" target="_blank">Vapt [OLD]</a></li>
										 
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Data
										Presentation <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="tables.jsp" target="_blank">Owasp issues</a></li>
										<li id="table_table"><a href="history.jsp" target="_blank">Remediation Vapt</a></li>
										
									</ul></li>
									<li>
								<a><i class="fa fa-wrench"></i> Remediation <span
										class="fa fa-chevron-down"></span></a>
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
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
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
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img id="logout_logo" src="" alt=""><%=userName%>
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									
									<form action="${pageContext.request.contextPath}/LogoutServlet" method="post" class="form-signin">
                    <li><button class="btn btn-sm btn-primary RBanner" type="submit" value="button" name="bottone">Log Out</button></li>
                    </form>
									
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">1</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> 
									<span class="image">
									<img src="images/img.jpg" alt="Profile Image" /></span> <span> <span>ppirani</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Welcome in. </span>
									</a></li>
									
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class=""> <!-- #1 -->
            <div class="page-title">
              <div class="title_left">
                <h3 style="color:black;">Prodotti</h3>
                <h2>Tutti i prodotti affetti da vulnerabilità divisi per tipologia e ordinati per gravità. Non viene tenuto conto del livello di confidence .</h2>
                
              </div>
				
              
            </div>

            <div class="clearfix"></div>
	<div class="table-responsive">
			  
				<div class="" ng-app="sortApp" ng-controller="mainController" style="width:100%;margin-left:auto;margin-right:auto;">
				
				
				<div class="page-title">
              <div class="title_left">
                <h3>Owasp issues<small></small></h3>
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
  <table class="table table-bordered">
    
    <thead>
      <tr style="background-color:#5A738E;font-weight:bold;color: white;">
	  <td>
          <a href="#" ng-click="sortType = 'Name'; sortReverse = !sortReverse">
            Owasp Issue           
			<span ng-show="sortType == 'Name' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Name' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'Count'; sortReverse = !sortReverse">
            Quantity
            <span ng-show="sortType == 'Count' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Count' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'Severity'; sortReverse = !sortReverse">
          Severity
            <span ng-show="sortType == 'Severity' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Severity' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'Elenco'; sortReverse = !sortReverse">
          Products affected by issues
            <span ng-show="sortType == 'Elenco' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Elenco' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		
		<!-- <td>
		<a href="#">#</a>
		</td> -->
		
      </tr>
    </thead>
      
    
    <tbody>
      <tr id="{{roll.Name}}" ng-repeat="roll in sushi | orderBy:sortType:sortReverse | filter:searchFish">
		
        <td><b>{{ roll.Name }}</b></td>
        <td>{{ roll.Count }}</td>
        <td ng-class="{'color-red': roll.Severity === 'High', 'color-cyan': roll.Severity === 'Information', 'color-yellow': roll.Severity === 'Low', 'color-orange': roll.Severity === 'Medium'}">{{roll.Severity}}</td>
		<td><a>{{ roll.Elenco }}</a></td>
		<!-- <td>{{ $index +1 }}</td> -->
        
      </tr>
    </tbody>
    
  </table>
            
                  
                </div>
              </div> <!--  // right_col main -->
              </div>
              </div>

              <div class="clearfix"></div>
          
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
         
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
	<!--  <script src="http://code.highcharts.com/highcharts.js"></script>-->
	<script src="js/LogoPersona/personal_logo.js"></script>
	
  </body>
</html>