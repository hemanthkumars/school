angular.module('app')
.controller ('leaveRegisterCtrl', function($scope,$rootScope,$stateParams,$http,$filter,$state,$compile,$timeout) {
	$('#fullDashBoard').attr('style', 'visibility: collapse;');
	$timeout(enableAutoCompleteLeaveRegister(),0);
	
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
	   
	   $scope.resetNameDaatInLeaveRegister=function(){
		   $("#oldLeavesOfThisStudent").empty();
		   $("#studentNameForLeaveRegister").val('');
		   
	   }
	   
	   $scope.findSchoolSessionsForAttendance();
	
 });

function enableAutoCompleteLeaveRegister(){
	
	$("#fromDateForLeave").datepicker({ dateFormat: 'dd-mm-yy' });
	$("#toDateForLeave").datepicker({ dateFormat: 'dd-mm-yy' });
	$("#studentNameForLeaveRegister").autocomplete({
        autofocus : true,
        minlength : 2,
        source:  function( request, response ) {
            $.ajax({
                dataType: "json",
                type : 'POST',
                url: 'admin/student/fetchStudentNameLike;jsessionid='+JSESSIONID,
                data: {"param":$( "#studentNameForLeaveRegister" ).val()},
                success: function(data) {
                	if(data.error=="false"){
                		var res=JSON.parse(data.result);
                		nameInputData=res;
                   	 response(res);
                	}else{
                		if(data.errorCode!=undefined){
                			alertify.error(data.message);
                			location.href="#/login";
                		}
                	}
                	
                },
                error: function(data) {
                  //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
                }
            });
        },
        focus: function( event, ui ) {
           $( "#studentNameForLeaveRegister" ).val( ui.item.label );
              return false;
           },
        select: function( event, ui ) {
           $( "#studentNameForLeaveRegister" ).val( ui.item.forInpuBox );
          // $( "#schoolClassSectionId" ).val( ui.item.value );
           studentIdForFetching=ui.item.value;
           findFullLeaveDataAfterSelecting(studentIdForFetching);
           return false;
        }
     })	;
}
var studentIdForFetching=0;

function findFullLeaveDataAfterSelecting(studentId){
	studentIdForFetching=studentId;
	 var input={"studentId":studentId};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/attendance/findStudentLeaveData;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		var result=JSON.parse(data.result);
	        		formTheLeaveRegisterGrid(result);
	        		
	        	}else{
	        		if(data.errorCode!=undefined){
	        			alertify.error(data.message);
	        			location.href="#/login";
	        		}
	        		alertify.error(data.message);
	        	}
	        	
	        },
	        error: function(data) {
	          //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
	        }
	    });
}

function formTheLeaveRegisterGrid(result){
	$("#oldLeavesOfThisStudent").empty();
	var oldLeavesOfThisStudent="";
							oldLeavesOfThisStudent+=" <table class='table' >";
							oldLeavesOfThisStudent+="     <thead>";
							oldLeavesOfThisStudent+="       <tr>";
							oldLeavesOfThisStudent+="         <th>Sl No</th>";
							oldLeavesOfThisStudent+="         <th>From Date</th>";
							oldLeavesOfThisStudent+="         <th>To Date</th>";
							oldLeavesOfThisStudent+="         <th>Session</th>";
							oldLeavesOfThisStudent+="         <th>Reason</th>";
							oldLeavesOfThisStudent+="          <th>Delete</th>";
							oldLeavesOfThisStudent+="       </tr>";
							oldLeavesOfThisStudent+="     </thead>";
							oldLeavesOfThisStudent+="     <tbody>";
						for (var int = 0; int < result.length; int++) {
							var slno=int;
							slno+=1;
							oldLeavesOfThisStudent+="<tr>";
							oldLeavesOfThisStudent+="   <td>"+slno+"</td>";
							var fromleaveDate=new Date(result[int].fromLeaveDate);
							var tolaeveDate=new Date (result[int].toLeaveDate);
							oldLeavesOfThisStudent+="   <td>"+fromleaveDate.toDateString()+"</td>";
							oldLeavesOfThisStudent+="   <td>"+tolaeveDate.toDateString()+"</td>";
							oldLeavesOfThisStudent+="   <td>"+result[int].schoolSessionId.sessionName+"</td>";
							oldLeavesOfThisStudent+="   <td>"+result[int].leaveReason+"</td>";
							oldLeavesOfThisStudent+="   <td><input type='button' value='Delete'   id="+result[int].leaveRegisterId+"  onclick='deleteStudentLeave("+result[int].leaveRegisterId+")'/></td>";
							oldLeavesOfThisStudent+=" </tr>";
						
						}
						if(result.length==0){
							oldLeavesOfThisStudent+="<tr>";
							oldLeavesOfThisStudent+="   <td>No Leaves are taken Yet</td>";
							oldLeavesOfThisStudent+=" </tr>";
						}
						oldLeavesOfThisStudent+="     </tbody>";
						oldLeavesOfThisStudent+=" </table>";
						$("#oldLeavesOfThisStudent").append(oldLeavesOfThisStudent);
}

function deleteStudentLeave(leaveRegisterId){
	 var input={"leaveRegisterId":leaveRegisterId};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/attendance/deleteStudentLeave;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		alertify.success("Leave Deleted Successfully");
	        		findFullLeaveDataAfterSelecting(studentIdForFetching);
	        	}else{
	        		if(data.errorCode!=undefined){
	        			alertify.error(data.message);
	        			location.href="#/login";
	        		}
	        		alertify.error(data.message);
	        	}
	        	
	        },
	        error: function(data) {
	          //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
	        }
	    });
}

function saveStudentLeave(){
	if(studentIdForFetching==0||studentIdForFetching==undefined){
		alertify.error("Please select student for savinf Leave");
		return;
	}
	
	if($("#schoolSession").val()==""||$("#schoolSession").val()==undefined){
		alertify.error("Please select School Session");
		return;
	}
	
	if($("#leaveReason").val()==""||$("#leaveReason").val()==undefined){
		alertify.error("Please Enter the reason");
		return;
	}
	
	if($("#fromDateForLeave").val()==""||$("#fromDateForLeave").val()==undefined){
		alertify.error("Please select From Date ");
		return;
	}
	
	if($("#toDateForLeave").val()==""||$("#toDateForLeave").val()==undefined){
		alertify.error("Please select To Date");
		return;
	}
	
	 var input={"studentId":studentIdForFetching,"schoolSessionId":$("#schoolSession").val(),"leaveReason":$("#leaveReason").val(),
			 "fromDateForLeave":$("#fromDateForLeave").val(),"toDateForLeave":$("#toDateForLeave").val(),};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/attendance/saveStudentLeave;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		alertify.success(data.message);
	        		findFullLeaveDataAfterSelecting(studentIdForFetching);
	        	}else{
	        		if(data.errorCode!=undefined){
	        			alertify.error(data.message);
	        			location.href="#/login";
	        		}
	        		alertify.error(data.message);
	        	}
	        	
	        },
	        error: function(data) {
	          //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
	        }
	    });
}

