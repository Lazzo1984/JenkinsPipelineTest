// app.js
angular.module('sortApp', [])
.controller('mainController', function($scope) {
  $scope.sortType = 'Severity' // set the default sort type
  $scope.sortReverse  = false;  // set the default sort order
  $scope.searchFish   = '';     // set the default search/filter term
    
  
  // create the list of sushi rolls 
  $scope.sushi = proto2;
  
});