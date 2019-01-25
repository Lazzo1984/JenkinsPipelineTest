<%@ page
	import="com.dev.project2.Servlet,java.io.*,javax.xml.parsers.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*,javax.xml.*,org.w3c.dom.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Pre-IT.com</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">
<!-- PNotify -->
    <link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
</head>
<style>
.h_iframe iframe {
	/* position:absolute;
    top:0;
    left:0;
    */
	width: 100%;
	height: 620px;
}
</style>
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
										<li><a href="index2.jsp">Pre-IT.Com</a></li>
										<li><a href="index3.jsp" target="_blank">File-Manager</a></li>
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

										<li><a href="tables_dynamic.jsp">Vapt Report [ALL]</a></li>
										<li><a href="tables_dynamic2.jsp">Vapt Report</a></li>
										<li><a href="Vapt_view1.jsp">Vapt [OLD]</a></li>
										
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Data
										Presentation <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li id="table_table"><a href="tables.jsp">Owasp Issues</a></li>
										
									</ul></li>
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
										
									</ul></li>
								<li><a><i class="fa fa-windows"></i> Extras <span
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
				<!--  <div class="clearfix" style="width:auto;"> -->

				<div style="background-color: black;">
					<table>
						<col width="33%">
						<col width="33%">
						<col width="33%">
						<tr style="">
							<td style="display: inline-block;"><img	src="images/Node.svg" style="width: 60px; height: 40px;"></img></td>
							<td><span style="display: inline-block;"></span></td>
							<td><b style="color: white;"><p></p></b></td>
						</tr>
					</table>

				</div>
				<div id="wetty_container" class="h_iframe">
					<!-- <iframe src="http://10.202.98.4/wetty" frameborder="0" allowfullscreen></iframe> -->
					<!-- <iframe src="localhost:8181/wetty" frameborder="0" allowfullscreen></iframe> -->
					<iframe src="/project2/TemplateAdmin2/production/page_404.html" frameborder="0" allowfullscreen></iframe>
				</div>
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
	<!-- jQuery Sparklines -->
	<script src="../vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- Flot -->
	
	<!-- Flot plugins -->
	
	<!-- DateJS -->
	<script src="../vendors/DateJS/build/date.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="../vendors/moment/min/moment.min.js"></script>
	<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>
	<script src="js/LogoPersona/personal_logo.js"></script>
	<!-- PNotify -->
    <script src="../vendors/pnotify/dist/pnotify.js"></script>
    <script src="../vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="../vendors/pnotify/dist/pnotify.nonblock.js"></script>
    <script type="text/javascript">
  $(document).ready(function(){
  	//PNotify.removeAll();
  	/*
  	var altezza = $(.right_col).height();
  	console.log(altezza);
  	var final_altezza = +(altezza) - 10;
  	$('#wetty_container').height(final_altezza);
  	console.log(final_altezza);
  	*/
  	var provenienza = window.location.href;
  	var access = document.cookie;
  	if(access.includes("index2.jsp"))	return ;  	
  	$.get( "/project2/CentroNotifiche?provenienza=" + provenienza); 
   	
  		
	var __msg = "";
	var __msg1 = "Nuovi elementi aggiunti";
	if(access.includes("ALL.ALL"))
	{__msg = "Per seguire le pre-integrazioni:\n1- Accedere con admin/admin\n2- cd ppirani(ad es.) \n3- preit.sh\n4- incollare link Tomcat Updater "}
	
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
	/* var notifiche1 = new PNotify({
        title: 'Information',
        text: __msg1,
        type: 'info',
        hide: true,
        styling: 'bootstrap3',
        addclass: 'dark'
    }); */
	
	//notifiche();
  });
	</script>
</body>
</html>