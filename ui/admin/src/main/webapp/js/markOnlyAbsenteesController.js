angular.module('app')
.controller ('markOnlyAbsenteesCtrl', function($scope,$rootScope,$stateParams,$http,$filter,$state,$compile,$timeout) {
	$('#fullDashBoard').attr('style', 'visibility: collapse;');
	if(!oldAbsentDataSaved){
		$('#saveAbsentButton').attr('disabled', 'disabled'); 
		alertify.error("Old Absent Data is not yet saved .Please wait for old operation to complete")
	}
	
	$timeout(enableAutoCompleteMarkOnlyAbsentees(),0);
	$scope.clearStudentName=function(){
		$scope.studentSearchForAbsentees="";
	};
	
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
	   
	   $scope.resetMarkAbsentees=function(){
		   $scope.attendanceMarkingdate="";
		   $scope.schoolSession="";
		   $("#studentAbsenteesData").empty();
		   studentIdMapForAbsenteesMarking={};
	   }

 });

var studentIdMapForAbsenteesMarking={};


function enableAutoCompleteMarkOnlyAbsentees(){
	
	$("#attendanceMarkingdate").datepicker({ dateFormat: 'dd-mm-yy' });
	$("#studentSearchForAbsentees").autocomplete({
        autofocus : true,
        minlength : 2,
        source:  function( request, response ) {
            $.ajax({
                dataType: "json",
                type : 'POST',
                url: 'admin/student/fetchStudentNameLike;jsessionid='+JSESSIONID,
                data: {"param":$( "#studentSearchForAbsentees" ).val()},
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
           $( "#studentSearchForAbsentees" ).val( ui.item.label );
              return false;
           },
        select: function( event, ui ) {
           $( "#studentSearchForAbsentees" ).val( ui.item.forInpuBox );
          // $( "#schoolClassSectionId" ).val( ui.item.value );
          var studentIdSelected=ui.item.value;
           findFullDataAfterSelecting(studentIdSelected);
           
           return false;
        }
     })	;
}

function findFullDataAfterSelecting(studentId){
	 var input={"studentId":studentId};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/student/findStudentDataForMarkingAbsent;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		var result=data.result;
	        		studentIdMapForAbsenteesMarking[studentId]=result;
	        		formTheStudentGrid();
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

var oldAbsentDataSaved=true;

function saveAbsenteesData(){
	var studentIdArrayForAbsentees=[];
	var containsStudentIds=false;
	for (var m in studentIdMapForAbsenteesMarking){
		var temp={"studentId":m};
		studentIdArrayForAbsentees.push(temp);
		containsStudentIds=true;
	}
	
	if(!containsStudentIds){
		alertify.error("Please select atleast one student for marking Absentees");
		return;
	}
	
	if($("#schoolSession").val()==""||$("#schoolSession").val()==undefined){
		alertify.error("Please Select Session For Attendance Marking");
		return;
	}
	
	if($("#attendanceMarkingdate").val()==""||$("#attendanceMarkingdate").val()==undefined){
		alertify.error("Please Select Date for Marking Attendance");
		return;
	}
	
	 alertify.success("This operation may take few minutes. " +
	 		" You need not wait for this you may continue with other operations .Once its complete we will notify you !");
	 $('#saveAbsentButton').attr('disabled', 'disabled'); 
	 oldAbsentDataSaved=false;
	 var input={"studentIdArray":studentIdArrayForAbsentees,"schoolSessionId":$("#schoolSession").val(),
			  "attendanceMarkingdate":$("#attendanceMarkingdate").val()};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/attendance/saveStudentAbsentees;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		alertify.success(data.message);
	        		oldAbsentDataSaved=true;
	        		 $('#saveAbsentButton').removeAttr('disabled');
	        		 studentIdMapForAbsenteesMarking={};
	        		 formTheStudentGrid();
	        	}else{
	        		if(data.errorCode!=undefined){
	        			alertify.error(data.message);
	        			location.href="#/login";
	        		}
	        		alertify.error(data.message);
	        		oldAbsentDataSaved=true;
	        		$('#saveAbsentButton').removeAttr('disabled');
	        	}
	        	
	        },
	        error: function(data) {
	        	$('#saveAbsentButton').removeAttr('disabled');
	        	oldAbsentDataSaved=true;
	          //  $('input.suggest-user').removeClass('ui-autocomplete-loading');  
	        }
	    });
}


function deleteStudentId(studentId){
	delete studentIdMapForAbsenteesMarking[studentId];
}


var firstTime=false;

function formTheStudentGrid(){
	
	$("#studentAbsenteesData").empty();
	var index=0;
	var studentAbsenteesData="";
							studentAbsenteesData+=" <table class='table' >";
							studentAbsenteesData+="     <thead>";
							studentAbsenteesData+="       <tr>";
							studentAbsenteesData+="         <th>Sl No</th>";
							studentAbsenteesData+="         <th>Name</th>";
							studentAbsenteesData+="         <th>Father Name</th>";
							studentAbsenteesData+="         <th>Father Mobile</th>";
							studentAbsenteesData+="          <th>Delete</th>";
							studentAbsenteesData+="       </tr>";
							studentAbsenteesData+="     </thead>";
							studentAbsenteesData+="     <tbody>";
						
						for (var m in studentIdMapForAbsenteesMarking){
							var studentData=studentIdMapForAbsenteesMarking[m];
							index+=1;
							studentAbsenteesData+="<tr>";
							studentAbsenteesData+="   <td>"+index+"</td>";
							studentAbsenteesData+="   <td>"+studentData.studentName+"</td>";
							studentAbsenteesData+="   <td>"+studentData.fatherName+"</td>";
							studentAbsenteesData+="   <td>"+studentData.fatherMobile+"</td>";
							studentAbsenteesData+="   <td><input type='button' value='Delete'   id="+studentData.studentId+"  onclick='deleteStudentFromstudentIdMapForAbsenteesMarking("+studentData.studentId+")'/></td>";
							studentAbsenteesData+=" </tr>";
						}
						studentAbsenteesData+="     </tbody>";
						studentAbsenteesData+=" </table>";
						$("#studentSearchForAbsentees").val("");
						$("#studentSearchForAbsentees").focus("");
						$("#studentAbsenteesData").append(studentAbsenteesData);
}

function deleteStudentFromstudentIdMapForAbsenteesMarking(studentId){
	delete studentIdMapForAbsenteesMarking[studentId];
	formTheStudentGrid();
}

