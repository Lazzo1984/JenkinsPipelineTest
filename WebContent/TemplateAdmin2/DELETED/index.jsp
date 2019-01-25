<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reports Vapt</title>
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/redmond/jquery-ui.css"/>
    
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>-->
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

    <!-- CSS -->
   
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
   <!--
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/sandstone/bootstrap.min.css">
    -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/VTag.css" />
	
	
    <style>
        body { font-size: 10px;}
		span { cursor:pointer; }
		.color-red 
		{background-color: red;}
		.color-orange
		{background-color:orange;}
		.color-yellow
		{background-color:yellow;}
		.color-cyan
		{background-color:cyan;}
		.table thead a {color:white;}
    </style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/STYLE/logout.css">
    <!-- JS -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
	<script src="DB.js"></script>
    <script src="app.js"></script>
	
	
	<script src="examdable.js"></script>
	<script type="text/javascript">
	
	</script>

</head>
<body>
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
<form action="${pageContext.request.contextPath}/LogoutServlet" method="post" class="form-signin">
<div class="RDiv">
<h2>Configuration Management<button class="btn btn-sm btn-primary RBanner" type="submit" value="button" name="bottone">Logout | <%=userName %></button></h2>
<!-- -->
</div>
</form>
<div class="divrelativo">
<h2>VAPT Report<a href="Analitycs.jsp" class="right" target="_blank">Analytics</a></h2>

</div>
<br>
<div class="" ng-app="sortApp" ng-controller="mainController" style="width:95%;margin-left:auto;margin-right:auto;">
  
  <div class="alert alert-info" style="background-color:#268abb;font-weight:bold;font-size: 11px;color:white;">
    <p>Sort Type: {{ sortType }}</p>
    <p>Sort Reverse: {{ sortReverse }}</p>
    <p>Search Query: {{ searchFish }}</p>
  </div>
  
  <form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>

        <input type="text" class="form-control" placeholder="Search" ng-model="searchFish">

      </div>      
    </div>
  </form>
  
  <table class="table table-bordered">
    
    <thead>
      <tr style="background-color:#146b96;font-weight:bold;font-size: 11px;color:white;">
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
          <a href="#" ng-click="sortType = 'Responsabile'; sortReverse = !sortReverse">
          Responsabile
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
          <a href="#" ng-click="sortType = 'Area'; sortReverse = !sortReverse">
          Area
            <span ng-show="sortType == 'Area' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Area' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		
		<td>
          <a href="#" ng-click="sortType = 'Referente'; sortReverse = !sortReverse">
          Referente
            <span ng-show="sortType == 'Referente' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'Referente' && sortReverse" class="fa fa-caret-up"></span>
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
          data esecuzione 
            <span ng-show="sortType == 'data_esecuzione' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'data_esecuzione' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		
		
      </tr>
    </thead>
      </tr>
    </thead>
    
    <tbody>
      <tr id="{{roll.Elettra}}" ng-repeat="roll in sushi | orderBy:sortType:sortReverse | filter:searchFish">
		<td><span class="expande"><img src="Images/ExpandArrow-50_up.png" alt="none" width="18" height="18" ></span>&nbsp;{{ roll.id }}</td>
        <td>{{ roll.Elettra }}</td>
        <td>{{ roll.Prodotto }}</td>
        <td>{{ roll.Responsabile }}</td>
		<td>{{ roll.Polarion }}</td>
        <td>{{ roll.Area }}</td>
		<td>{{ roll.Referente }}</td>
       
		
		<td ng-class="{'color-red': roll.Risultati === 'Alta', 'color-cyan': roll.Risultati === 'Info', 'color-yellow': roll.Risultati === 'Bassa', 'color-orange': roll.Risultati === 'Media'}">{{roll.Risultati}}</td>
		
		
		
        <td>{{ roll.data_esecuzione }}</td>
        
      </tr>
    </tbody>
    
  </table>
  
</div>
</body>
</html>