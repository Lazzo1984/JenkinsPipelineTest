// app.js
var app = angular.module('sortApp', [])

.controller('mainController', function($scope) {
  $scope.sortType = 'data_esecuzione' // set the default sort type
  $scope.sortReverse  = true;  // set the default sort order
  $scope.searchFish   = '';     // set the default search/filter term  
  // create the list of sushi rolls 
  $scope.sushi = proto;
  
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