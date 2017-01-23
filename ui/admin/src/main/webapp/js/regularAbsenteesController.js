angular.module('app')
.controller ('regularAbsenteesCtrl', function($scope,$rootScope,$stateParams,$http,$filter,$state,$compile,$timeout) {
	 $('#fullDashBoard').attr('style', 'visibility: collapse;');
	$scope.findSchoolSessionsForAttendance=function(){
		var serverPath="admin/schoolsetup/findSchoolSessions";
		var input={};
		$http({
           url: $rootScope.urlappend + serverPath+';jsessionid='+$rootScope.JSESSIONID,
           method: "POST",
           params:{"input":JSON.stringify(input)} 

       }).success(function (data, status, headers, config) {
       	$rootScope.validateSession(data);
       	if(data.error=="true"){
       		alertify.error(data.message);
       	}else{
       		$rootScope.schoolSessions=JSON.parse(data.result);
       	}
       	
       }).error(function (data, status, headers, config) {
       	
       });
   } ;
   
   $scope.findSchoolSessionsForAttendance();
   
   $scope.resetRegularAbsenteesData=function(){
	   $("#regularAbsenteesFullData").empty();
   }
   
   $scope.findRegularAbsentees=function(){
		var serverPath="admin/attendance/findRegularAbsentees";
		if($("#schoolSession").val()==""||$("#schoolSession").val()==undefined){
			$("#regularAbsenteesFullData").empty();
			return;
		}
		var input={"schoolSessionId":$("#schoolSession").val()};
		$http({
           url: $rootScope.urlappend + serverPath+';jsessionid='+$rootScope.JSESSIONID,
           method: "POST",
           params:{"input":JSON.stringify(input)} 

       }).success(function (data, status, headers, config) {
       	$rootScope.validateSession(data);
       	if(data.error=="true"){
       		alertify.error(data.message);
       	}else{
       		$("#regularAbsenteesFullData").empty();
                 var results=JSON.parse(data.result);
       		   $scope.regularAbsenteesFullData="";
       							$scope.regularAbsenteesFullData+=" <table class='table' >";
       							$scope.regularAbsenteesFullData+="     <thead>";
       							$scope.regularAbsenteesFullData+="       <tr>";
       							$scope.regularAbsenteesFullData+="         <th>Sl No</th>";
       							$scope.regularAbsenteesFullData+="         <th>Name</th>";
       							$scope.regularAbsenteesFullData+="         <th>Class</th>";
       							$scope.regularAbsenteesFullData+="         <th>Father Name</th>";
       							$scope.regularAbsenteesFullData+="          <th>Father Mobile</th>";
       							$scope.regularAbsenteesFullData+="         <th>No Of Days Absent</th>";
       							$scope.regularAbsenteesFullData+="       </tr>";
       							$scope.regularAbsenteesFullData+="     </thead>";
       							$scope.regularAbsenteesFullData+="     <tbody>";
       							for (var int = 0; int < results.length; int++) {
       								var slno=int;
       								slno+=1
       								$scope.regularAbsenteesFullData+="<tr>";
       								$scope.regularAbsenteesFullData+="   <td>"+slno+"</td>";
       								$scope.regularAbsenteesFullData+="   <td>"+results[int][1]+"</td>";
       								$scope.regularAbsenteesFullData+="   <td>"+results[int][2]+"</td>";
       								$scope.regularAbsenteesFullData+="   <td>"+results[int][5]+"</td>";
       								$scope.regularAbsenteesFullData+="   <td>"+results[int][4]+"</td>";
       								$scope.regularAbsenteesFullData+="   <td><b>"+results[int][0]+"</b></td>";
       								$scope.regularAbsenteesFullData+=" </tr>";
       							}

       							$scope.regularAbsenteesFullData+="     </tbody>";
       							$scope.regularAbsenteesFullData+=" </table>";
       							var temp = $compile($scope.regularAbsenteesFullData)($scope);
       							$("#regularAbsenteesFullData").append(temp);
       	}
       	
       }).error(function (data, status, headers, config) {
       	
       });
   } ;
   
   
 });

