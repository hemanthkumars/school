angular.module('app')
.controller ('feeCollectCtrl', function($scope,$rootScope,$stateParams,$http,$filter,$state,$compile,$timeout) {
	$timeout(enableAutoCompleteForFeeCollect(),0);
	$scope.resetDataFeeCollect1=function(){
		$("#fcSchoolClassSection").val("");
    	$("#studentsData").empty();
    	$("#studentFeeDefinitionData").empty();
    	$("#studentFeeReceiptData").empty();
	}
    $scope.resetDataFeeCollect2=function(){
    	$("#fcStudentName").val("");
    	$("#studentsData").empty();
    	$("#studentFeeDefinitionData").empty();
    	$("#studentFeeReceiptData").empty();
	}

 });

var fcSchoolClassSectionId=0;
var studentIdSelected=0;
function enableAutoCompleteForFeeCollect(){
	$("#fcSchoolClassSection").autocomplete({
        autofocus : true,
        minlength : 2,
        source:  function( request, response ) {
            $.ajax({
                dataType: "json",
                type : 'POST',
                url: 'admin/class/fetchSchoolClassSectionLike;jsessionid='+JSESSIONID,
                data: {"param":$( "#fcSchoolClassSection" ).val()},
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
           $( "#fcSchoolClassSection" ).val( ui.item.label );
              return false;
           },
        select: function( event, ui ) {
           $( "#fcSchoolClassSection" ).val( ui.item.label );
          // $( "#schoolClassSectionId" ).val( ui.item.value );
           fcSchoolClassSectionId=ui.item.value;
           findAllStudentDataForPaying(fcSchoolClassSectionId);
           
           return false;
        }
     })	;
	
	
	$("#fcStudentName").autocomplete({
        autofocus : true,
        minlength : 2,
        source:  function( request, response ) {
            $.ajax({
                dataType: "json",
                type : 'POST',
                url: 'admin/student/fetchStudentNameLike;jsessionid='+JSESSIONID,
                data: {"param":$( "#fcStudentName" ).val()},
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
           $( "#fcStudentName" ).val( ui.item.label );
              return false;
           },
        select: function( event, ui ) {
           $( "#fcStudentName" ).val( ui.item.forInpuBox );
          // $( "#schoolClassSectionId" ).val( ui.item.value );
           studentIdSelected=ui.item.value;
           findSchoolFeeDefnForPaying(studentIdSelected);
           
           return false;
        }
     })	;
}

function findSchoolFeeDefnForPaying(studentIdSelected){
    var input={"studentId":studentIdSelected};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: 'admin/student/findSchoolDefnByStudentId;jsessionid='+JSESSIONID,
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	if(data.error=="false"){
        		var feeDefnData=JSON.parse(data.schoolFeeData);
        		var studentData=data.studentData;
        		var schoolFeeIds=JSON.parse(data.schoolFeeIds);
        		
        		var studentFeeDefinitionData="";
        		studentFeeDefinitionData+=studentData.firstName+"  " ;
        		studentFeeDefinitionData+=studentData.schoolClassSectionId.code+"  ";
        		studentFeeDefinitionData+=studentData.fatherName+"  ";
        		studentFeeDefinitionData+=studentData.fatherMobile+"  ";
        		for (var int = 0; int < feeDefnData.length; int++) {
					var slNo=int;
					slNo+=1;
					var feeType=feeDefnData[int].feeType;
					var feeAmount=feeDefnData[int].feeAmount;
					var paidFees=feeDefnData[int].paidFees;
					var balance=feeDefnData[int].balance;
					var schooFeeId=feeDefnData[int].schooFeeId;
					
					
					 	
				}
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


function findAllStudentDataForPaying(fcSchoolClassSectionId){
    var input={"schoolClassSectionId":fcSchoolClassSectionId};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: 'admin/student/findAllStudentDetails;jsessionid='+JSESSIONID,
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	if(data.error=="false"){
        		var results=JSON.parse(data.result);
        		populateStudentDataForPayment(results);
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

function populateStudentDataForPayment(results){
	var studentsData=""
		$("#studentsData").empty();
		studentsData="";
							studentsData+=" <table class='table' >";
							studentsData+="     <thead>";
							studentsData+="       <tr>";
							studentsData+="         <th>Sl No</th>";
							studentsData+="         <th>Class</th>";
							studentsData+="         <th>Name</th>";
							studentsData+="          <th>Father Name</th>";
							studentsData+="          <th>Action</th>";
							studentsData+="       </tr>";
							studentsData+="     </thead>";
							studentsData+="     <tbody>";

							for (var int = 0; int < results.length; int++) {
								var slno=int;
								slno+=1;
								studentsData+=" <tr>";
								studentsData+="   <td>"+slno+"</td>";
								studentsData+="   <td>"+results[int].schoolClassSectionId.code+"</td>";
								studentsData+="   <td>"+results[int].firstName+"</td>";
								studentsData+="   <td>"+results[int].fatherName+"</td>";
								studentsData+="   <td><input type='button' value='Select' onclick=\"findSchoolFeeDefnForPaying("+results[int].studentId+")\" /></td>";	
								studentsData+=" </tr>";
							}

							studentsData+="     </tbody>";
							studentsData+=" </table>";
							
							$("#studentsData").append(studentsData);
	
}



function payFees(fcSchoolClassSectionId){
	$(".text-field").each(function() {
	    alert($(this).val());
	});
	
	  var input={"schoolClassSectionId":fcSchoolClassSectionId};
	    $.ajax({
	        dataType: "json",
	        type : 'POST',
	        url: 'admin/student/payFees;jsessionid='+JSESSIONID,
	        data: {"input":JSON.stringify(input)} ,
	        success: function(data) {
	        	if(data.error=="false"){
	        		var results=JSON.parse(data.result);
	        		
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

function findReceiptDetails(studentId){
	var input={"studentId":studentId};
    $.ajax({
        dataType: "json",
        type : 'POST',
        url: 'admin/student/findReceiptDetails;jsessionid='+JSESSIONID,
        data: {"input":JSON.stringify(input)} ,
        success: function(data) {
        	if(data.error=="false"){
        		var results=JSON.parse(data.result);
        		
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




