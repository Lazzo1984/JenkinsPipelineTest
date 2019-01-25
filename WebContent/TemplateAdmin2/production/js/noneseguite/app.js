var app = angular.module('sortApp', []).controller('mainController', function($scope) {
  $scope.sortType = 'data_cert'   // set the default sort type
  $scope.sortReverse  = true;    // set the default sort order
  $scope.searchFish   = '';     // set the default search/filter term
  
  $scope.notepad = "";
  
  
  $scope.filtro = "Attivita' non ancora eseguita";
  $scope.sushi = connectorAjax($scope.filtro);
  
  $scope.loadData = function(){
	  $('#switchTableI').removeClass('fa fa-rotate-left');
	  $("#switchTableI").addClass('fa fa-spinner fa-spin fa-3x fa-fw'); // spinner
	  if($scope.filtro == "Attivita' non ancora eseguita"){
          $scope.sushi = connectorAjax("Non testabile"); 
          $scope.filtro = "Non testabile";      
	  }
	  else
		  {
		  $scope.sushi = connectorAjax("Attivita' non ancora eseguita");
		  $scope.filtro = "Attivita' non ancora eseguita";		  
		  }
	  $('#switchTableI').removeClass("fa fa-spinner fa-spin fa-3x fa-fw");
	  $('#switchTableI').addClass('fa fa-rotate-left');
    } 
  $scope.changeNote = function()
  {
	  var _len = $scope.sushi.length;
	  var currentElettra = $('#txtbox1').val();
	  var userName = $("#user_namE").text();
	  for(var i = 0; i < _len ; i++){
		  if($scope.sushi[i].Elettra == currentElettra){
		  
			  $scope.sushi[i].Note = $scope.notepad;
			  $scope.sushi[i].updatedby = userName;
		  }
	  }
  }
  });

app.directive('tooltipLoader', function() {
    return function(scope, element, attrs) {
      element.tooltip({
        trigger:"hover",
        placement: "top",
        delay: {show: 500, hide: 0}
      });
    };
  });