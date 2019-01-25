<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Portale Sicurezza</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/TemplateAdmin2/vendors/jquery/dist/jquery.min.js"></script>

<!-- <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>-->
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/TemplateAdmin2/vendors/bootstrap/dist/css/bootstrap.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/TemplateAdmin2/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/logincss.css" />

  <script type="text/javascript">
  $(document).ready(function(){
	  $(window).resize(function () {
          var containerwidthResize = $('.container').width();
			//alert(containerwidthResize);
          //$('#fotter').width(containerwidthResize);
      });
	  
  });
  </script>
</head>
<body>


<div class="container">
<div align="center" style="width: 100%; height: 10%;background-image: linear-gradient(#6facd5,#497bae);" data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="b">
			<div id="headerDiv" class="ui-grid-b" style="width: 100%; height: 100%;">
				
				<div align="center" class="ui-block-b" style="width: 60%; height: 80%;">
					<img id="headerImg" src="/project2/TemplateAdmin2/Images/certificazionelispa.jpg" alt="" style="width: 80%; height: 100%;margin-top:7px;margin-bottom:7px;"/>
				</div>
				
			</div>
		</div> 
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            
            <h1 class="text-center login-title">Sign-in to continue</h1>
            <div class="account-wall">
                <!-- <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt=""> -->
                <div class="form-signin">
                <table>
                <tr>
                <td>
                <img class="" src="/project2/TemplateAdmin2/Images/PortaleSicurezza.png" alt="none">
                </td>
                <td>															   <!--                        --> 
                <h3 style="font-style:oblique;font-family: Tahoma;margin-top:10px;"><b>Software Quality</b></h3>
                </td>
                </tr>
                <tr>
                <td colspan="2">
                <h3 style="text-align:center;" ><b>Sicurezza Applicativa</b></h3>
                </td>
                </tr>
                </table>
                </div>
                
                
                <form action="${pageContext.request.contextPath}/Servlet" method="post" class="form-signin">
                <input type="text" class="form-control" name="txtbox" placeholder="Username" required autofocus>
                <input type="password" class="form-control" name="txtbox1" placeholder="Password" required>
                <p style="color:#f7f7f7;"><%=request.getAttribute("error") %></p>
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="button" name="bottone">
                    Sign in</button>
                <label class="checkbox pull-left" style="margin-left: 20px;">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
            <a href="${pageContext.request.contextPath}/JSP/Register.jsp" class="text-center new-account">Create an account </a>
        </div>
    </div>
</div>

</body>
</html>