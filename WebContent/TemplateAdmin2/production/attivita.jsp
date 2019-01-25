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

<title>Attivita non eseguite</title>

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
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />  <!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css"	rel="stylesheet">


<script src="../vendors/datejs/date.min.js"></script>
<script src="../vendors/jquery/dist/jquery.min.js"></script>

<script src="../vendors/angularjs/angular.min.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<!-- Custom Theme Style -->
<link href="../build/css/custom.css" rel="stylesheet">
<link href="../build/css//cssnoneseguite.css" rel="stylesheet">
<!-- ho dovuto fare modifiche riga 1303 commentata classe -->

  <script src="js/noneseguite/prototype.js"></script>
  <script src="js/noneseguite/app.js"></script>
  <script type="text/javascript" src="js/noneseguite/emailBombing.js"></script>
  
<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#switchTable').click(function(){
	
	});
});
</script>

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
						<a href="index.jsp" class="site_title"> <span><img
								class="" height="32" width="42"
								src="/project2/TemplateAdmin2/Images/PortaleSicurezza.png"
								alt="">Portale Sicurezza</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="" alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2 id="user_namE"><%=userName%></h2>
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
										<li><a id="file_manager" href="index3.jsp" target="_blank">File-Manager</a></li>
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
                      					<li><a href="Vapt_view1.jsp" target="_blank">Vapt [OLD]</a></li>
										
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Data
										Presentation <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									<li id="table_table"><a href="tables.jsp" target="_blank">Owasp Issues</a></li>
									<li id="table_table"><a href="history.jsp" target="_blank">Remediation Vapt</a></li>
										
									</ul></li>
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
								<li><a><i class="fa fa-bug"></i> Additional Pages <span	class="fa fa-chevron-down"></span></a>
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

       <div class="right_col" role="main">
           <div class="row">
 		  		<div id="panel_riepilogo_attivita" class="col-md-12 col-sm-12 col-xs-12">
 		  		<!-- start # -->
 		  		
 		  		<div>  
  <div class="" ng-app="sortApp" ng-controller="mainController" style="width:100%;margin-left:auto;margin-right:auto;">
          <div class="page-title">
              <div class="title_left">
                <h3> Tabella : {{ filtro }} <small></small></h3>
                
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
  <div class="alert">
      <p><b>Sort Type: {{ sortType }}</b></p>
      <p><b>Sort Reverse: {{ sortReverse }}</b></p>
      <p><b>Search Query: {{ searchFish }}</b></p>
      <p><b>Row Counter : </b><b  style="color:red;">{{ ( sushi | filter:searchFish ).length }}</b></p>
      <p><b>Last added comment : {{ notepad }} </b></p>
      
    </div>


    <div>
     <div class="table-wrapper">
      <div class="table-title">
        <div class="row">
         
          <div class="col-sm-6">
            <a id="mailBombing" href="#addEmployeeModal" class="btn btn-primary" data-toggle="modal">
            <span><i class="fa fa-envelope" style="font-size:14px"></i></span>Create E-mail</a>
            
            <a id="switchTable" href="#" ng-click="loadData()" class="btn btn-danger">
            <span><i id="switchTableI" class="fa fa-rotate-left" style="font-size:14px"></i></span>
            Switch table
            </a>
            
        </div>
        
      </div>
    </div>

    <table class="table table-bordered" id="ToDo">

      <thead>
        <tr style="background-color:rgba(222, 222, 222, 0.2);font-weight:600;font-size:13px;">
          <td>
            <span class="custom-checkbox">
              <input type="checkbox" id="selectAll">
              <label for="selectAll"></label>
            </span>
          </td>
          <td>
            <a href="#" ng-click="sortType = 'data_cert'; sortReverse = !sortReverse">
              Date 
              <span ng-show="sortType == 'data_cert' && !sortReverse" class="fa fa-caret-down"></span>
              <span ng-show="sortType == 'data_cert' && sortReverse" class="fa fa-caret-up"></span>
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
        <a href="#" ng-click="sortType = 'Responsabile'; sortReverse = !sortReverse">
          Referente
          <span ng-show="sortType == 'Responsabile' && !sortReverse" class="fa fa-caret-down"></span>
          <span ng-show="sortType == 'Responsabile' && sortReverse" class="fa fa-caret-up"></span>
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
       <a href="#" ng-click="sortType = 'Note'; sortReverse = !sortReverse">
        Note
        <span ng-show="sortType == 'Note' && !sortReverse" class="fa fa-caret-down"></span>
        <span ng-show="sortType == 'Note' && sortReverse" class="fa fa-caret-up"></span>
      </a>
    </td>
    <td><a href="#" >Edit</a></td>
 </tr>

</thead>
<!-- end of table head -->
<tbody>
  <tr class="rows" id="{{roll.Elettra}}" ng-repeat="roll in sushi | orderBy:sortType:sortReverse | filter:searchFish">
    <td>
      <span class="custom-checkbox">
        <input type="checkbox" id="checkbox{{$index+1}}" name="options[]" value="1" class="" >
        <label for="checkbox{{$index+1}}"></label>
      </span>
    </td>
    
    <td><span class="spantd" data-toggle="tooltip" data-original-title="{{ roll.data_cert | date:'medium'}}" tooltip-loader>{{ roll.data_cert | date:'dd-MM-yyyy' }}</span></td>
    
    <td><span class="spantd" data-toggle="tooltip" data-original-title="{{ roll.Projname }}" tooltip-loader>{{ roll.Elettra }}</span></td>
    
    <td>{{ roll.Responsabile }}</td>
    <td><a href="{{ roll.Polarion }}" target=_blank><span class="fa fa-link" aria-hidden="true"></span><b>&nbsp;{{roll.PolarionWI}}</b></a></td>
    
    <td><span class="spantd" data-toggle="tooltip" data-original-title="Last updated by : {{ roll.updatedby }}" tooltip-loader>{{ roll.Note }}</span></td>
    
    <td>
      <a id="editNote" href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
     </td>
                 
     </tr>
   </tbody>
    <!-- 
	Per fare un contatore da qualche parte
	
    -->
</table>

</div>
</div>
<script type="text/javascript">
  var editeddata = "";
  $(document).ready(function(){
	  
    $("#ToDo").on('click','#editNote',function(){
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var col1=currentRow.find("td:eq(1)").text(); // get current row 1st TD value
         
         var col2=currentRow.find("td:eq(2)").text(); // ELETTRA
         $('#txtbox1').val(col2);   
         var col3=currentRow.find("td:eq(3)").text(); // POLARION
         $('#txtbox3').val(col3);             
         var col4=currentRow.find("td:eq(4)").text(); 
         $('#txtbox2').val(col4);                      // REFEREE
         var col5=currentRow.find("td:eq(5)").text();        
         $('#txtbox4').val(col5); 
         
         editeddata=col2 + ";" + col5;
         
        // alert(data);
      });
  });
</script>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form>
        <div class="modal-header">            
          <h4 class="modal-title">Edit Note</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">          
          <div class="form-group">
            <label>Elettra</label>
            <input type="text" class="form-control" id="txtbox1" disabled >
          </div>
          <div class="form-group">
            <label>Polarion</label>
            <input type="text" class="form-control" id="txtbox2" disabled>
          </div>          
          <div class="form-group">
            <label>Referente</label>
            <input type="text" class="form-control" id="txtbox3" disabled>
          </div>
          <div class="form-group">
            <label>Note</label>
            <textarea class="form-control" id="txtbox4" ng-model="notepad"></textarea>
          </div>          
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-info" value="Save" id="onSave" ng-click="changeNote()">
        </div>
      </form>
    </div>
  </div>
  
</div>

 </div> <!-- End of Angular controller -->
 </div>
 		  											  
				<!-- end # -->
				</div>
			</div> <!-- class="row" -->
		</div><!-- "right_col" role="main"  -->
       
        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
  </div> <!-- Main container -->

</div> <!-- Container-body -->   
   
    <!-- <script src="../vendors/jquery/dist/jquery.min.js"></script>-->
    
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
	
	<script type="text/javascript">
	$('#ToDo').on('click','#selectAll',function(){
  // Activate tooltip  
  // Select/Deselect checkboxes
  var checkbox = $('table tbody input[type="checkbox"]');
 // $("#selectAll").click(function(){
    if(this.checked){
      checkbox.each(function(){
        this.checked = true;                        
      });
    } else{
      checkbox.each(function(){
        this.checked = false;                        
      });
    } 
 // });
  checkbox.click(function(){
    if(!this.checked){
      $("#selectAll").prop("checked", false);
    }
  });
  //$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#onSave').click(function(){
		var str = $('#txtbox1').val();
		var e = str.trim();  // this white space is generated from html &nbps;
		var p=$('#txtbox2').val();
		var r=$('#txtbox3').val();
		var str2=$('#txtbox4').val();
		var n= str2.trim();		
		var u = $("#user_namE").text();
		
		//console.log(u);
		var submission = $.parseJSON($.ajax({
			type: 'POST',
			url:  "/project2/AggiornaNote",
			data: {'elettra':e,'note':n,'updatedby':u},
	        dataType: "json",
	        async: false
	    }).responseText);
					
		$("#editEmployeeModal .close").click();
	})
	 	
});
</script>
  </body>
</html>
