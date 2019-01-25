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

<title>Portale Sicurezza</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"	rel="stylesheet">
<!-- JQVMap -->
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<!-- PNotify -->
<link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

<script src="../vendors/highcharts/highcharts.js"></script>
<script src="../vendors/highcharts/exporting.js"></script>
<script src="../vendors/datejs/date.min.js"></script>



<!-- Custom Theme Style -->
<link href="../build/css/custom.css" rel="stylesheet">
<!-- ho dovuto fare modifiche riga 1303 commentata classe -->
</head>
<style>

</style>
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
						<a href="index.jsp" class="site_title"> 
				<span><img class="" height="32" width="42" src="/project2/TemplateAdmin2/Images/PortaleSicurezza.png" alt="">Portale Sicurezza</span>
						</a>
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
										<li><a href="index.jsp" target="_blank">Dashboard</a></li>
										<li id="preit_com"><a  href="index2.jsp" target="_blank">Pre-IT.Com</a></li>
										<li id="file_manager"><a  href="index3.jsp" target="_blank">File-Manager</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Forms <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										
										<li><a id="form_upload" href="form_upload.jsp" target="_blank">Form Upload</a></li>
										<li><a href="attivita.jsp" target="_blank">Attività non eseguiti</a></li>
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
										<li id="table_table"><a href="tables.jsp" target="_blank">Owasp Issues</a></li>
										<li id="table_table"><a href="history.jsp" target="_blank">Remediation Vapt</a></li>
										
									</ul></li>
								<li><a><i class="fa fa-wrench"></i> Remediation <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										
										<li><a href="Cross-Site-Scripting.jsp" target="_blank">Cross-Site-Scripting</a></li>
										<li><a href="Flash-cross-domain.jsp" target="_blank">Flash-cross-domain</a></li>
									</ul></li>

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
												type="submit" value="button" name="bottone">Log Out</li>
									</form>
								</ul>
								</li>

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
									</a>
									</li>
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
				<!-- top tiles -->
				<div class="row tile_count">
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Projects on Pmta01</span>
						<div id="total" class="count">0</div>
						<span class="count_bottom"><i class="green">4% </i> From
							last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-clock-o"></i> HIGH</span>
						<div id="ALTA" class="count">0</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>3% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> MEDIUM</span>
						<div id="MEDIA" class="count green">0</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>1% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> LOW</span>
						<div id="BASSA" class="count">0</div>
						<span class="count_bottom"><i class="red"><i
								class="fa fa-sort-desc"></i>2% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> INFO</span>
						<div id="INFO" class="count">0</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>4% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> NONE</span>
						<div id="NONE" class="count">0</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>2% </i> From last Week</span>
					</div>
					</div>
				<!-- /top tiles -->

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>		
							Riepilogo Attività : VAPT di Laboratorio <a href="tables_dynamic2.jsp" target="_blank"><i class="fa fa-table"></i></a><small></small>
									</h3>
								</div>
								<div class="col-md-6">
									<div id="reportrange" class="pull-right"
										style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
										<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span>December
											30, 2016 - April 28, 2017</span> <b class="caret"></b>
									</div>
								</div>
							</div>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id="Graph1" class="demo-placeholder"></div>
							</div>
							<!-- -->
							<div class="clearfix"></div>
						</div>
					</div>

				</div>
				<br />

				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-12">
						<div class="x_panel tile fixed_height_320">
							<div class="x_title">
								<h2>VAPT eseguiti</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<h4>Table : Vapt Report</h4>
								<div class="widget_summary">
									<div class="w_left w_25">
										<span>Alta</span>
									</div>
									<div class="w_center w_55">
										<div class="progress">
											<div id="widget_ALTA" class="progress-bar bg-red"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 0%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
									<div class="w_right w_20">
										<span id="widget_ALTA2">0k</span>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="widget_summary">
									<div class="w_left w_25">
										<span>Media</span>
									</div>
									<div class="w_center w_55">
										<div class="progress">
											<div id="widget_MEDIA" class="progress-bar bg-orange"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 0%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
									<div class="w_right w_20">
										<span id="widget_MEDIA2">0k</span>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="widget_summary">
									<div class="w_left w_25">
										<span>Bassa</span>
									</div>
									<div class="w_center w_55">
										<div class="progress">
											<div id="widget_BASSA" class="progress-bar bg-yellow"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 0%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
									<div class="w_right w_20">
										<span id="widget_BASSA2">0k</span>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="widget_summary">
									<div class="w_left w_25">
										<span>Info</span>
									</div>
									<div class="w_center w_55">
										<div class="progress">
											<div id="widget_INFO" class="progress-bar bg-cyan"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 0%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
									<div class="w_right w_20">
										<span id="widget_INFO2">0k</span>
									</div>
									<div class="clearfix"></div>
								</div>


							</div>

						</div>
					</div>

					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="x_panel tile fixed_height_320 overflow_hidden">
							<div class="x_title">
								<h2>VAPT General Overview</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<!-- <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas> -->

								<div id="PieChart" style="height: 250px; width: auto;"></div>
								<table class="tile_info">
									<tr>
										<td>
											<p>
												<i class="fa fa-square blue"></i>IOS
											</p>
										</td>
										<td>25%</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="fa fa-square green"></i>Android
											</p>
										</td>
										<td>25%</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="fa fa-square purple"></i>Blackberry
											</p>
										</td>
										<td>25%</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="fa fa-square aero"></i>Symbian
											</p>
										</td>
										<td>25%</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="fa fa-square red"></i>Others
											</p>
										</td>
										<td>0%</td>
									</tr>
								</table>
								-->

							</div>
						</div>
					</div>

					<!-- era qui -->
					<div id="panel_ToDo" class="col-md-4 col-sm-4 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									VAPT Report : <small>Parziale Anno</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i	class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<div id="year_count" class="" style="margin-top: 6px;"></div>
							</div>
						</div>
					</div>
					<!-- era qui -->

				</div>


				<div class="row">
					
					<div class="col-md-12 col-sm-12 col-xs-12">

					</div>
					<!-- end of weather widget -->
				</div>
			</div>
			<!-- /page content -->

	<!-- footer content -->
	<footer>
		<div class="pull-right">
			Gentelella - Bootstrap Admin Template by <a
				href="https://colorlib.com">Colorlib</a>
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
	<!-- Chart.js -->
	<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
	
	<!-- bootstrap-progressbar -->
	<script	src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="../vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="../vendors/skycons/skycons.js"></script>
	
	<!-- bootstrap-daterangepicker -->
	<script src="../vendors/moment/min/moment.min.js"></script>
	<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>

	<script src="js/tablejs2/DB.js"></script>

	<script src="js/grafici/CertProdDB.js"></script>
	<script src="js/grafici/barChart.js"></script>
	<script src="js/PieChart/PieChart.js"></script>
	<script src="js/widget/widgets.js"></script>
	
	<script src="js/LogoPersona/personal_logo.js"></script>
	<script src="js/CustomTheme/customize.js"></script>
	<script src="js/PieChart/yearCount.js"></script>
	<!-- PNotify -->
	<script src="../vendors/pnotify/dist/pnotify.js"></script>
	<script src="../vendors/pnotify/dist/pnotify.buttons.js"></script>
	<script src="../vendors/pnotify/dist/pnotify.nonblock.js"></script>
	
	<script type="text/javascript">
  $(document).ready(function(){
  	//PNotify.removeAll();
  	var provenienza = window.location.href;
  	var access = document.cookie;
  	if(access.includes("index.jsp"))	return ;  	
  	$.get( "/project2/CentroNotifiche?provenienza=" + provenienza);  	
	var __msg = "";
	var __msg1 = "Nuovi elementi aggiunti";	
	if(access.includes("ALL.ALL"))
	{__msg = "No Restriction Applied"}
	
	else
	{__msg= "Restrictions applied:\n è possibile visionare o scaricare i report dei quali si è referente di progetto"
	 __msg1= "Nel menù di sinistra espandere Tables e selezionare Vapt Report per vedere il report del proprio progetto"	
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
        type: 'Warning',
        hide: true,
        styling: 'bootstrap3',
        addclass: 'dark'
    });
	
	//notifiche();
  });
	</script>
</body>
</html>
