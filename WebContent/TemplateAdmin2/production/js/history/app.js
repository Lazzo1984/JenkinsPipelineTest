var tabella = $.parseJSON($.ajax({
		type: 'POST',
		url:  "/project2/ApiAjaxCors",
		data: {'funzione':'aggregate'},
        dataType: "json",
        async: false
    }).responseText); // AJAX end
	isPassed();
	//console.log(tabella);
	function isPassed()
	{
		var __len = tabella.length;
    //alert(__len);
		for(i = 0; i < __len; i++)
		{
			for(j = 0; j < tabella[i].data.length; j ++)
			{
			if(j == (tabella[i].data.length-1) && tabella[i].data[j].alta == "High")
			{
			tabella[i].elettra = "Failed";
			}
			if(j == (tabella[i].data.length-1) && tabella[i].data[j].alta == "")
			{
			tabella[i].elettra = "Passed";
			}
			}
		}
		}
	
	var app = angular.module("myapp", []);
    app.controller("tableController", function($scope) {
    	$scope.sortType = 'elettra' ;   // set the default sort type
    	$scope.sortReverse  = false;  // set the default sort order
    	$scope.searchFish   = '';    // set the default search/filter term
    	
    	$scope.Actor = 	tabella
    }
	);
    app.directive('tooltipLoader', function() {
        return function(scope, element, attrs) {

          element.tooltip({
            trigger:"hover",
            placement: "top",
            delay: {show: 500, hide: 0}
          });
        };
      });