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
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List
href="Remediation%20XSS%20Scripting%20reflected%20stored_file/filelist.xml">
<title>Cross-site scripting remediation</title>


<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>





<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">

<!-- Custom Theme Style -->
<link href="../build/css/custom.css" rel="stylesheet">
<!-- ho dovuto fare modifiche riga 1303 commentata classe -->
</head>
<style>
.selectedX {
	background-color: #EDEDED !important;
}
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
										<li><a href="attivita.jsp" target="_blank">Attivita' non eseguite</a></li>
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
								<a><i class="fa fa-desktop"></i> Remediation <span
										class="fa fa-chevron-down"></span></a>
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
												type="submit" value="button" name="bottone"></button>Log Out</li>
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
                <h3>Remediation</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <b>revisited by:</b>
                  <p>ppirani</p>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                     
                    <!-- WORD DOCX -->

<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>parsifal pirani</o:Author>
  <o:LastAuthor>parsifal pirani</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>545</o:TotalTime>
  <o:Created>2018-03-17T23:07:00Z</o:Created>
  <o:LastSaved>2018-03-17T23:07:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>639</o:Words>
  <o:Characters>3647</o:Characters>
  <o:Company>Hewlett-Packard</o:Company>
  <o:Lines>30</o:Lines>
  <o:Paragraphs>8</o:Paragraphs>
  <o:CharactersWithSpaces>4278</o:CharactersWithSpaces>
  <o:Version>16.00</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:RelyOnVML/>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<link rel=dataStoreItem
href="Remediation%20XSS%20Scripting%20reflected%20stored_file/item0006.xml"
target="Remediation%20XSS%20Scripting%20reflected%20stored_file/props007.xml">
<link rel=themeData
href="Remediation%20XSS%20Scripting%20reflected%20stored_file/themedata.thmx">
<link rel=colorSchemeMapping
href="Remediation%20XSS%20Scripting%20reflected%20stored_file/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:HyphenationZone>14</w:HyphenationZone>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>IT</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="371">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:1;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536859905 1073786111 1 0 511 0;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:-536869121 64767 1 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	mso-themecolor:hyperlink;
	text-decoration:none; //BOMBATO
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	mso-themecolor:followedhyperlink;
	text-decoration:underline;
	text-underline:single;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	mso-style-link:"Nessuna spaziatura Carattere";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:36.0pt;
	mso-add-space:auto;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:36.0pt;
	mso-add-space:auto;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
span.keyword
	{mso-style-name:keyword;
	mso-style-unhide:no;}
span.string
	{mso-style-name:string;
	mso-style-unhide:no;}
span.annotation
	{mso-style-name:annotation;
	mso-style-unhide:no;}
span.number
	{mso-style-name:number;
	mso-style-unhide:no;}
span.comment
	{mso-style-name:comment;
	mso-style-unhide:no;}
span.tag
	{mso-style-name:tag;
	mso-style-unhide:no;}
span.tag-name
	{mso-style-name:tag-name;
	mso-style-unhide:no;}
span.NessunaspaziaturaCarattere
	{mso-style-name:"Nessuna spaziatura Carattere";
	mso-style-priority:1;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Nessuna spaziatura";
	font-family:"Times New Roman",serif;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-fareast-language:IT;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;
	mso-page-numbers:0;
	mso-title-page:yes;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 @list l0
	{mso-list-id:61636234;
	mso-list-template-ids:-1947819238;}
@list l0:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1
	{mso-list-id:318533875;
	mso-list-template-ids:-1030947324;}
@list l1:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2
	{mso-list-id:397171529;
	mso-list-type:hybrid;
	mso-list-template-ids:-288037814 3024356 68157465 68157467 68157455 68157465 68157467 68157455 68157465 68157467;}
@list l2:level1
	{mso-level-text:%1-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3
	{mso-list-id:694576833;
	mso-list-template-ids:-1661205520;}
@list l3:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4
	{mso-list-id:1342002205;
	mso-list-template-ids:1001564532;}
@list l4:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5
	{mso-list-id:1515415001;
	mso-list-template-ids:406112680;}
@list l5:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6
	{mso-list-id:1589777168;
	mso-list-template-ids:606389318;}
@list l6:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7
	{mso-list-id:2069642285;
	mso-list-template-ids:-1483439054;}
@list l7:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l7:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Tabella normale";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:8.0pt;
	mso-para-margin-left:0cm;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=IT link="#0563C1" vlink="#954F72" style='tab-interval:35.4pt'>

<div class=WordSection1>

<p class=MsoNormal><span style='font-size:24.0pt;line-height:107%'>Remediation
XSS Scripting Reflected &amp; Stored<o:p></o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:16.0pt;line-height:107%'>Che cos’è?<o:p></o:p></span></b></p>

<p class=MsoNormal><a href="https://it.wikipedia.org/wiki/Cross-site_scripting"><span
style='font-size:14.0pt;line-height:107%'>https://it.wikipedia.org/wiki/Cross-site_scripting</span></a><span
style='font-size:14.0pt;line-height:107%'><o:p></o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:14.0pt;line-height:107%'>Abstract:<o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>Lo scopo del
presente documento è quello di fornire una soluzione efficace a <o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>neutralizzare
gli attacchi di tipo XSS reflected e XSS stored<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>La soluzione
proposta viene applicata lato server ed è applicabile a tutte le
web-application che impieghino le seguenti tecnologie Java,JSP,JSTL,Tomcat etc.<o:p></o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:14.0pt;line-height:107%'>Specifiche:<o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>La soluzione
proposta è basata sul progetto OWASP HTML Sanitizer project :<o:p></o:p></span></p>

<p class=MsoNormal><a
href="https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer_Project"><span
style='font-size:14.0pt;line-height:107%'>https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer_Project</span></a><span
style='font-size:14.0pt;line-height:107%'><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>Questo
progetto è distribuito sotto licenza Apache2 License e NEW BSD License ed è
attivamente manutenuto da Mike Samuel del Google's AppSec team.<o:p></o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:14.0pt;line-height:107%'>Passi Operativi:<o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>L’implementazione
avviene in 3 semplici steps:<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpFirst style='text-indent:-18.0pt;mso-list:l2 level1 lfo5'><![if !supportLists]><span
style='font-size:14.0pt;line-height:107%;mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>1-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;line-height:107%'>Importazione di 2 dependecies nel
modulo war<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-indent:-18.0pt;mso-list:l2 level1 lfo5'><![if !supportLists]><span
style='font-size:14.0pt;line-height:107%;mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>2-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;line-height:107%'>Creazione di una classe nel proprio
package<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpLast style='text-indent:-18.0pt;mso-list:l2 level1 lfo5'><![if !supportLists]><span
style='font-size:14.0pt;line-height:107%;mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>3-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;line-height:107%'>Modificare file [web.xml]<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:14.0pt;line-height:107%'>Procedura:<o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>1 –
Importare le seguenti dependencies nel pom.xml del modulo war:<o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-left:solid #6CE26C 2.25pt;
padding:0cm 0cm 0cm 0cm;background:white;margin-left:18.0pt;margin-right:0cm'>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;dependency&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;groupId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>com.googlecode.owasp-java-html-sanitizer</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/groupId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;artifactId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>owasp-java-html-sanitizer</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/artifactId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;version&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>20171016.1</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/version&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/dependency&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;dependency&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;groupId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>com.google.guava</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/groupId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;artifactId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>guava</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/artifactId&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;version&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>11.0.2</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/version&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l7 level1 lfo7;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>10.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/dependency&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

</div>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'>2 – Creazione
della classe:<o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-left:solid #6CE26C 2.25pt;
padding:0cm 0cm 0cm 0cm;background:white;margin-left:18.0pt;margin-right:0cm'>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>package</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;project;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;java.io.IOException;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.Filter;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.FilterChain;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.FilterConfig;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.ServletException;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.ServletRequest;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.ServletResponse;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>10.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.http.HttpServletRequest;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>11.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;javax.servlet.http.HttpServletRequestWrapper;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>12.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>13.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;org.owasp.html.HtmlPolicyBuilder;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>14.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>import</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;org.owasp.html.PolicyFactory;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>15.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>16.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>final</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>class</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;XSSFilter&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>implements</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;Filter&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>17.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>18.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>static</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>class</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;FilteredRequest&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>extends</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;HttpServletRequestWrapper&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>19.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>20.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;FilteredRequest(ServletRequest&nbsp;request)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>21.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>super</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>((HttpServletRequest)request);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>22.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>23.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>24.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;String&nbsp;sanitize(String&nbsp;input)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>25.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PolicyFactory&nbsp;policy&nbsp;=&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>new</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;HtmlPolicyBuilder()&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>26.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.allowAttributes(</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;src&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>).onElements(</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;img&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>)&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>27.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.allowAttributes(</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;href&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>).onElements(</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;a&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>)&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>28.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.allowStandardUrlProtocols()&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>29.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.allowElements(</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;a&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>,&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:blue;mso-fareast-language:IT'>&quot;img&quot;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>).toFactory();&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>30.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>31.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;result&nbsp;=&nbsp;policy.sanitize(input);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>32.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>return</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;result;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>33.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>34.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#646464;mso-fareast-language:IT'>@Override</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;//
Qui lo Sviluppo deve implementare la propria logica</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>35.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;String&nbsp;getParameter(String&nbsp;paramName)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>36.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;value&nbsp;=&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>super</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>.getParameter(paramName);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>37.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>38.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String
cleanParameter&nbsp;=&nbsp;sanitize(value);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>39.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>40.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>return</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;cleanParameter;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>41.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>42.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#646464;mso-fareast-language:IT'>@Override</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;//
Qui lo Sviluppo deve implementare la propria logica</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>43.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;String[]&nbsp;getParameterValues(String&nbsp;paramName)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>44.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String[]&nbsp;values&nbsp;=&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>super</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>.getParameterValues(paramName);&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>45.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>46.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>for</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;(</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>int</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;index&nbsp;=&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#C00000;mso-fareast-language:IT'>0</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>;&nbsp;index&nbsp;&lt;&nbsp;values.length;&nbsp;index++)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>47.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;values[index]&nbsp;=&nbsp;sanitize(values[index]);&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>48.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>49.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>50.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>return</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;values;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>51.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>52.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>53.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#008200;mso-fareast-language:IT'>//&nbsp;End&nbsp;subclassing&nbsp;...</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>54.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#008200;mso-fareast-language:IT'>//&nbsp;implementing&nbsp;interface</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>55.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>void</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;doFilter(ServletRequest&nbsp;request,&nbsp;ServletResponse&nbsp;response,&nbsp;FilterChain&nbsp;chain)&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>throws</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;IOException,&nbsp;ServletException&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>56.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>57.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chain.doFilter(</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>new</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;FilteredRequest(request),&nbsp;response);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>58.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>59.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>60.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>void</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;destroy()&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>61.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>62.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>63.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>public</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>void</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;init(FilterConfig&nbsp;filterConfig)&nbsp;{&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>64.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l5 level1 lfo8;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>65.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>}&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

</div>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:18.0pt'><span style='font-size:14.0pt;
line-height:107%'>3-modifica del file web.xml<o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-left:solid #6CE26C 2.25pt;
padding:0cm 0cm 0cm 0cm;background:white;margin-left:18.0pt;margin-right:0cm'>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;filter&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;filter-name&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>XSS-Filter</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/filter-name&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;filter-class&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>project.XSSFilter</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/filter-class&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/filter&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;filter-mapping&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;filter-name&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>XSS-Filter</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/filter-name&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:#F8F8F8;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;url-pattern&gt;</span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
color:black;mso-fareast-language:IT'>/MiaServlet</span></b><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/url-pattern&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;=&gt;
Inserire url,Servlet,.jsp.html etc il Filtro verrà invocato solo per le
richieste dirette a questi pattern</span><span style='font-size:9.0pt;
font-family:Consolas;mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:
"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
margin-left:18.0pt;text-indent:-18.0pt;line-height:10.5pt;mso-list:l4 level1 lfo6;
tab-stops:list 36.0pt;background:white;border:none;mso-border-left-alt:solid #6CE26C 2.25pt;
padding:0cm;mso-padding-alt:0cm 0cm 0cm 0cm'><![if !supportLists]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:Consolas;
mso-bidi-font-family:Consolas;color:#5C5C5C;mso-fareast-language:IT'><span
style='mso-list:Ignore'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-fareast-language:IT'>&nbsp;&nbsp;</span><b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#006699;mso-fareast-language:IT'>&lt;/filter-mapping&gt;</span></b><span
style='font-size:9.0pt;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:#5C5C5C;mso-fareast-language:IT'><o:p></o:p></span></p>

</div>

<p class=MsoNormal style='margin-left:18.0pt'><span style='font-size:12.0pt;
line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:16.0pt;line-height:107%'><o:p>&nbsp;</o:p></span></p>

</div>
                     
                     
					<!-- WORD DOCX -->

                  </div>
                </div>
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
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script src="js/LogoPersona/personal_logo.js"></script>
	<script src="js/CustomTheme/customize.js"></script>
  </body>
</html>
