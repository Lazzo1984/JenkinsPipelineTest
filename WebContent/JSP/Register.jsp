<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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
  <style>
  
  </style>
</head>
<body>


<!-- <input type="text" name="txtbox"/>-->
<!-- <input type="submit" value="button" name="bottone"/>-->
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Register in to continue</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">
                <form action="${pageContext.request.contextPath}/Register" method="post" class="form-signin">
                <input type="text" class="form-control" name="txtbox" placeholder="Email(nome.cognome@lispa.it)" required autofocus>
                <input type="password" class="form-control" name="txtbox1" placeholder="Password" required>
                <button class="btn btn-lg btn-danger btn-block" type="submit" value="button" name="bottone">
                    Register</button>
                <label class="checkbox pull-left" style="margin-left: 20px;">
                    <input type="checkbox" style="display:none;" value="remember-me">
                </label>
                <a href="#" style="display:none;" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
           
        </div>
    </div>
</div>

</body>
</html>