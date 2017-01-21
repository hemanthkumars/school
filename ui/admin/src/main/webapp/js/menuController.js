angular.module('app')
.controller ('menuController', function($scope,$rootScope,$stateParams,$http,$filter,$state) {
	$('#fullDashBoard').attr('style', 'visibility: collapse;');
	alertify.success("menuController");
  
  $scope.swithView=function(path){
	  alertify.success(path);
	  if(path=='login'){
		  $("#menuGrid").hide();
	  }
	  $state.go(path,{});
  }
  
  //$("#totalDashBoardDiv").hide();
  
 });