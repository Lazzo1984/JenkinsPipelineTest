<%@ page
	import="com.dev.project2.Servlet,java.io.*,javax.xml.parsers.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*,javax.xml.*,org.w3c.dom.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Storico Vapt</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    
	<link rel="stylesheet" href="js/tablejs/VTag.css" />

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
		
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
		
	<script src="../vendors/angularjs/angular.min.js"></script>

<!-- Custom Theme Style -->
<link href="../build/css/custom.css" rel="stylesheet">
<!-- ho dovuto fare modifiche riga 1303 commentata classe -->
<style>
        /*body { padding-top:50px;font-size: 11px; }*/
		.color-red 
		{background-color: red;color: black;}
		.color-orange
		{background-color:orange;color: black;}
		.color-yellow
		{background-color:yellow;color: black;}
		.color-cyan
		{background-color:cyan;color: black;}
		.color-grey
		{background-color:#c9bdbd;color: black;}
		
		.redd{background-color: red;}
		.greenn{background-color: green;}
		
		.label {font-size : 82%;}
		
		.table thead a {color:white;}
		tbody tr td {background-color:white;}
		.expande{cursor:pointer;}
		.table
		{margin-bottom: 0px!important;}
		
		.rounded
		{
		border-radius: 25px;
		background: #444;
		padding-left: 4px;
		padding-right; 6px;
		width: 64px;
		font-size 12px;
		color: white;
		}
		.clickable
		{
		cursor:pointer;
		}
		
    </style>
</head>

<body class="nav-md">
	<%
		String userName = null;
			String _unique = null;
			String _scope = null;
			String _ou = null;
			Cookie[] cookies = request.getCookies();
			Integer test = 0;

			com.dev.project2.Servlet _obj = new com.dev.project2.Servlet();

			if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("unique")) {
				_unique = cookie.getValue();
				test++;
			} else if (cookie.getName().equals("user")) {
				userName = cookie.getValue();
				test++;
			} else if (cookie.getName().equals("scope")) {
				_scope = cookie.getValue();
				test++;
			} else if (cookie.getName().equals("OU")) {
				_ou = cookie.getValue();
				test++;
			}
		}
			}
			if (test < 3) {
		response.sendRedirect("/project2/JSP/welcome.jsp");
			}
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
							<img src="" alt="..." class="img-circle profile_img">
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
										<li><a id="preit_com" href="index2.jsp" target="_blank">Pre-IT.Com</a></li>
										<li><a id="file_manager" href="index3.jsp"
											target="_blank">File-Manager</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Forms <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
										<li><a id="form_upload" href="form_upload.jsp">Form Upload</a></li>
										<li><a href="attivita.jsp" target="_blank">Vapt Non Eseguiti</a></li>
									</ul></li>
								
									
								<li><a><i class="fa fa-table"></i> Tables <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

										
										<li><a href="tables_dynamic.jsp" target="_blank">Vapt Report [ALL]</a></li>
                      					<li><a href="tables_dynamic2.jsp" target="_blank">Vapt Report</a></li>
                      					<li><a href="Vapt_view1.jsp" target="_blank">Vapt [OLD]</a></li>
										
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Data
										Presentation <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									<li id="table_table"><a href="tables.jsp" target="_blank">Owasp Issues</a></li>
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

									<form action="${pageContext.request.contextPath}/LogoutServlet"
										method="post" class="form-signin">
										<li><button class="btn btn-sm btn-primary RBanner"
												type="submit" value="button" name="bottone">Log Out</button></li>
									</form>

								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">1</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>ppirani</span>
												<span class="time">3 mins ago</span>
										</span> <span class="message"> Welcome in </span>
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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Remediation VAPT</h3>
                <h4>Tutti i prodotti per i quali sono stati effettuati 2 o più test di Vapt</h4>
                <h4>I prodotti che in seguito ad una remediation non hanno superato i test sono marcati come failed</h4>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                
                      <!--        da qui   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
 <div  ng-app="myapp" ng-controller="tableController" style="width:90%;margin-left:auto;margin-right:auto;">
  <br/>
  
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
	<p><b>Row Counter : {{ ( Actor | filter:searchFish).length }}</b></p>
  </div>
  </br>
  
 <table id="myTable" class="table table-bordered" >
 
     <thead>
    <tr style="background-color:#5A738E;font-weight:bold;color:white;"> 
	<td>#</td> 
	<td>
			<a href="#" ng-click="sortType = 'Elettra'; sortReverse = !sortReverse">
            Elettra           
			<span ng-show="sortType == 'Elettra' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Elettra' && sortReverse" class="fa fa-caret-up"></span>
	</td>
	<td>
			<a href="#" ng-click="sortType = 'elettra' ; sortReverse = !sortReverse">
            Status           
			<span ng-show="sortType == 'elettra' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'elettra' && sortReverse" class="fa fa-caret-up"></span>
	</td>
	
	<td>Pentester</td>
	<td>Data Vapt</td>
	<td>Valutazione</td>
	
	
	</tr>
    </thead>
    <tr ng-repeat="a in Actor | orderBy:sortType:sortReverse | filter:searchFish">
        <td><b>{{ $index+1 }}</b></td>
        <td>
		<b>{{ a.Elettra }}</b>
		</td>
        <td>
		<span class="label"  ng-class="{'label-success greenn': a.elettra === 'Passed', 'label-success redd': a.elettra === 'Failed'}">{{ a.elettra }}</span>		
		</td>
		
        <td>
		
		<table class="table table-stripe table-bordered" style="margin-top: 0px;width:50%;">
		<!-- <tr><th>High</th> <th>Mid</th><th>Low</th><th>Info</th><th>None</th></tr> -->
		<tr style="width:75%;margin-top: 10px;" ng-repeat="f in a.data">
		
		
		
		<td><b>{{f.pentester}}</b></td>
		
		</tr>
		
		
		</table>
		</td>
		
		<!-- <td>
		<ul>
            <li ng-repeat="f in a.data">{{f.data_report}} </li>
            </ul>
		 
		</td> -->
		<!-- Nested Tables-->
		<td>
		
		<table class="table table-stripe table-bordered" style="margin-top: 0px;">
		<!-- <tr><th>High</th> <th>Mid</th><th>Low</th><th>Info</th><th>None</th></tr> -->
		<tr ng-repeat="f in a.data">
		
		<td class="" style="width:30%;" ><span id="{{a.Elettra}} {{$index}}" class="label label-success clickable"  ng-class="" >View</span></td>
		
	<!-- <td data-toggle="tooltip" title="{{f.vulnerabilities}}"><b>{{f.datareport | date: 'dd/MM/yyyy'}}</b></td> -->
	
		<td><span style="line-height:0px;" data-toggle="tooltip" data-original-title="{{f.vulnerabilities}}" tooltip-loader><b>{{f.datareport | date: 'dd-MM-yyyy'}}</b></span></td>
		
		</tr>
		
		
		</table>
		</td>
		<!-- Nested Tables-->
		<td>
		
		<table class="table table-stripe table-bordered" style="margin-top: 0px;">
		<!-- <tr><th>High</th> <th>Mid</th><th>Low</th><th>Info</th><th>None</th></tr> -->
		<tr ng-repeat="f in a.data">
		
		
		
		<td style="width:20%;" ng-class="{'color-red': f.alta === 'High'}">{{f.alta}}</td>
		
		
		<td style="width:20%;" ng-class="{'color-orange': f.media === 'Medium'}">{{f.media}}</td>
		
		<td style="width:20%;" ng-class="{'color-yellow': f.bassa === 'Low'}">{{f.bassa}}</td>
		<td style="width:20%;" ng-class="{'color-cyan': f.info === 'Info'}">{{f.info}}</td>
		<td style="width:20%;" ng-class="{'color-grey': f.none === 'None'}">{{f.none}}</td>
		</tr>
		</table>
		 
		</td>
		<!-- Nested Tables-->		
    </tr>
    </table>
    <br>
    <br>

<script src="js/history/app.js"></script>
 </div>
                                     
              </div> <!-- row -->
            </div>
          </div>
        </div>
        <!-- /page content -->
		<div class="clearfix"></div>
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
   
    <!-- Bootstrap -->
   <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script src="js/LogoPersona/personal_logo.js"></script>
	<script src="js/CustomTheme/customize.js"></script>
	
	<script src="js/history/regexSelector.js"></script>
	
	<script>
$(document).ready(function(){
 
	$('.clickable').click(function(){
	var _report = $(this).attr('id');
    var x = _report.split(" ");
    
    var counter = $('span:regex(id,' + x[0] + " " + '[0-9]+)').length;
    
    //alert(x[0]);
    //var counter = $( "span[id^=" + x[0] + "]" ).length;    # debug this roll back this if not works correctely test di apertura di tutti i report
	//alert(counter);
	
    if(_report.includes(0))
    {
    	window.open('/project2/ViewOldReport?Report=' + x[0], '_blank');
    	console.log('/project2/ViewOldReport?Report=' + x[0]);
    	} 
	else if (_report.includes(counter-1))
	{
		window.open('/project2/ViewReport?Report=' + x[0], '_blank'); 
		console.log('/project2/ViewReport?Report=' + x[0]);
	}
	else	
	{
	var __z = +x[1] + 1;
	window.open('/project2/ViewOldReport?Report=' + x[0] + " (" + __z + ")", '_blank');
	//console.log("Report=" + x[0] + " (" + __z + ")");
	console.log('/project2/ViewOldReport?Report=' + x[0] + " (" + __z + ")");
	}
	
})

});

</script>
  </body>
</html>
