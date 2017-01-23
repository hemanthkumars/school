package com.school.ui.admin.controller.admin;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.base.domain.AttendanceStatus;
import com.school.base.domain.LeaveRegister;
import com.school.base.domain.LeaveStatus;
import com.school.base.domain.LeaveType;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolHoliday;
import com.school.base.domain.SchoolSession;
import com.school.base.domain.Student;
import com.school.base.domain.StudentAttedance;
import com.school.base.util.GeneralConstants;
import com.school.ui.admin.util.SessionManager;

import flexjson.JSONSerializer;

@RequestMapping("/admin/attendance")
@Controller
public class AttendanceController {
	
	@RequestMapping(value = "/saveAttendance", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 @Transactional
	 public String login(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try{
		Integer schoolSessionId=input.getInt("schoolSession");
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy");
		Date attendanceDate=dateFormat.parse(input.getString("attendanceDate"));
		Date todayDate= new Date(System.currentTimeMillis());
		if(attendanceDate.getTime()>todayDate.getTime()){
			output.put("error", "true");
			 output.put("message", "Sorry you cannot mark attendance for Date greater than today date");
			 return output.toString();
		}
		String classOrSectionId=input.getString("classOrSectionId");
		JSONArray jsonArray=input.getJSONArray("studentIdArrayForAttendance");
		Integer schoolId=SessionManager.getUserContext(request).getSchoolId();
		List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId());
		  if(schoolAcademics.isEmpty()){
			  output.put("error", "true");
				output.put("message", "Define active Academic Year");
				return output.toString();
		  }
		  SimpleDateFormat dateFormat2= new SimpleDateFormat("yyyy-MM-dd");
		  boolean isFullDaySession=false;
		  SchoolSession schoolSession2=SchoolSession.findSchoolSession(schoolSessionId,SessionManager.getUserContext(request).getSchoolId()).get(0);
		  if(schoolSession2.getIsFullDaySession()==1){
			  isFullDaySession=true;
		  }
		  List<Integer> schoolHoildayIds=null;
		//  if(isFullDaySession){
			  schoolHoildayIds= SchoolHoliday. findSchoolHoliday(null, schoolId, schoolAcademics.get(0).getSchoolAcademicYearId(), dateFormat2.format(attendanceDate));
		 // }else{
		//	  schoolHoildayIds= SchoolHoliday. findSchoolHoliday(schoolSessionId, schoolId, schoolAcademics.get(0).getSchoolAcademicYearId(), dateFormat2.format(attendanceDate));
		  //}
     
    if(!schoolHoildayIds.isEmpty()){
    	SchoolHoliday schoolHoliday=SchoolHoliday.findSchoolHoliday(schoolHoildayIds.get(0));
    	if(schoolHoliday.getSchoolSessionId().getIsFullDaySession()==1){
            output.put("error", "true");
  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" .Hence Cannot mark attendance !");
  			return output.toString();
    	}
    	SchoolSession reqSchoolSession=SchoolSession.findSchoolSession(schoolSessionId);
    	if(reqSchoolSession.getIsFullDaySession()==1){
            output.put("error", "true");
  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" .Hence Cannot mark attendance !");
  			return output.toString();
    	}
    	if(reqSchoolSession.getSchoolSessionId()==schoolHoliday.getSchoolSessionId().getSchoolSessionId()){
            output.put("error", "true");
  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" for "+reqSchoolSession.getSessionName()+" Session .Hence Cannot mark attendance !");
  			return output.toString();
    	}
    }

		  
		List<Integer> studentIds=new ArrayList<Integer>();
	
		for (Object object : jsonArray) {
			JSONObject jsonObject=(JSONObject) object;
		     studentIds.add(jsonObject.getInt("studentId"));	
		}
		
		List<Integer> allStudentIds=new ArrayList<Integer>();
		if(classOrSectionId.startsWith("osc-")){
			String schoolClassId=classOrSectionId.split("-")[1];
			allStudentIds=Student.findStudentIdsBySchoolClassId(Integer.parseInt(schoolClassId), SessionManager.getUserContext(request).getSchoolId());
		}else if (classOrSectionId.startsWith("scs-")) {
			String schoolClassSectionId=classOrSectionId.split("-")[1];
			allStudentIds=Student.findStudentIdsBySchoolClassSectioId(Integer.parseInt(schoolClassSectionId), SessionManager.getUserContext(request).getSchoolId() );
		
		}
		  
		  //deleting old attendance
		  String studentIdsStr=studentIds.toString();
		  studentIdsStr=studentIdsStr.replace("[", "(");
		  studentIdsStr=studentIdsStr.replace("]", ")");
		  
		  String allStudentIdsStr=allStudentIds.toString();
		  allStudentIdsStr=allStudentIdsStr.replace("[", "(");
		  allStudentIdsStr=allStudentIdsStr.replace("]", ")");
		  Integer schoolId1=SessionManager.getUserContext(request).getSchoolId();
		  List<SchoolSession> fullSession=SchoolSession.fetchOnlyFullSchoolSessions(schoolId1);
          
          List<Long> studentAttendanceIds= new ArrayList<Long>();
          if(isFullDaySession){
        	  studentAttendanceIds=StudentAttedance.
		        		  findStudentAttedancesForStudentOnlyIds(allStudentIdsStr, schoolId1, attendanceDate, null, schoolAcademics.get(0).getSchoolAcademicYearId());
		  }else{
			  studentAttendanceIds=StudentAttedance.
		        		 findStudentAttedancesForStudentOnlyIds(allStudentIdsStr, schoolId1, attendanceDate, schoolSessionId, schoolAcademics.get(0).getSchoolAcademicYearId());

		  }
 		  String studentAttendanceIdsStr= studentAttendanceIds.toString();
 		 studentAttendanceIdsStr=studentAttendanceIdsStr.replace("[", "(");
 		studentAttendanceIdsStr=studentAttendanceIdsStr.replace("]", ")");
		   
 		StudentAttedance.deleteStudentAttendaceByIds(studentAttendanceIdsStr, schoolId1);
 		  
 		  List<SchoolSession> schoolSessions=SchoolSession.fetchSchoolSessions(schoolId1);
		  
	    for (Integer studentId : studentIds) {
	    	if(isFullDaySession){
	    		for (SchoolSession schoolSession : schoolSessions) {
		    		StudentAttedance studentAttedance= new StudentAttedance();
					studentAttedance.setAttendanceDate(attendanceDate);
					AttendanceStatus attendanceStatusId= new AttendanceStatus();
					attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_PRESENT);
					studentAttedance.setAttendanceStatusId(attendanceStatusId);
					studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAttendanceDate(attendanceDate);
					studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
					studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
					studentAttedance.setSchoolSessionId(schoolSession);
					Student student= new Student();
					student.setStudentId(studentId);
					studentAttedance.setStudentId(student);
					studentAttedance.persist();
				}
	    		allStudentIds.remove(studentId);
	    	}else{
	    		StudentAttedance studentAttedance= new StudentAttedance();
				studentAttedance.setAttendanceDate(attendanceDate);
				AttendanceStatus attendanceStatusId= new AttendanceStatus();
				attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_PRESENT);
				studentAttedance.setAttendanceStatusId(attendanceStatusId);
				studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
				studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
				studentAttedance.setAttendanceDate(attendanceDate);
				studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
				studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
				SchoolSession schoolSession= new SchoolSession();
				schoolSession.setSchoolSessionId(schoolSessionId);
				studentAttedance.setSchoolSessionId(schoolSession);
				Student student= new Student();
				student.setStudentId(studentId);
				studentAttedance.setStudentId(student);
				studentAttedance.persist();
				allStudentIds.remove(studentId);
	    	}
		}
	    
	    for (Integer studentId : allStudentIds) {
	    	if(isFullDaySession){
	    		for (SchoolSession schoolSession : schoolSessions) {
	    			StudentAttedance studentAttedance= new StudentAttedance();
	    			studentAttedance.setAttendanceDate(attendanceDate);
	    			AttendanceStatus attendanceStatusId= new AttendanceStatus();
	    			attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
	    			studentAttedance.setAttendanceStatusId(attendanceStatusId);
	    			studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
	    			studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
	    			studentAttedance.setAttendanceDate(attendanceDate);
	    			studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
	    			studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
	    			studentAttedance.setSchoolSessionId(schoolSession);
	    			Student student= new Student();
	    			student.setStudentId(studentId);
	    			studentAttedance.setStudentId(student);
	    			studentAttedance.persist();
	    		}
	    	}else{
	    		StudentAttedance studentAttedance= new StudentAttedance();
				studentAttedance.setAttendanceDate(attendanceDate);
				AttendanceStatus attendanceStatusId= new AttendanceStatus();
				attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
				studentAttedance.setAttendanceStatusId(attendanceStatusId);
				studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
				studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
				studentAttedance.setAttendanceDate(attendanceDate);
				studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
				studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
				SchoolSession schoolSession= new SchoolSession();
				schoolSession.setSchoolSessionId(schoolSessionId);
				studentAttedance.setSchoolSessionId(schoolSession);
				Student student= new Student();
				student.setStudentId(studentId);
				studentAttedance.setStudentId(student);
				studentAttedance.persist();
				if(!fullSession.isEmpty()){
					StudentAttedance studentAttedance1= new StudentAttedance();
					studentAttedance1.setAttendanceDate(attendanceDate);
					AttendanceStatus attendanceStatusId1= new AttendanceStatus();
					attendanceStatusId1.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
					studentAttedance1.setAttendanceStatusId(attendanceStatusId1);
					studentAttedance1.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance1.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance1.setAttendanceDate(attendanceDate);
					studentAttedance1.setAuditUserId(SessionManager.getUserContext(request).getStaff());
					studentAttedance1.setSchoolAcademicYearId(schoolAcademics.get(0));
					studentAttedance1.setSchoolSessionId(fullSession.get(0));
					Student student1= new Student();
					student1.setStudentId(studentId);
					studentAttedance1.setStudentId(student1);
					studentAttedance1.persist();
				}
				
	    	}
			
		}
		
		output.put("error", "false");
		 output.put("message", "Attendance Successfuly saved");
		 return output.toString();
		} catch (Exception e) {
				output.put("error", "true");
				 output.put("message", "Some Error Occurred");
				 e.printStackTrace();
				 return output.toString();
			}
	}
	
	
     @RequestMapping(value = "/saveStudentAbsentees", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 @Transactional
	 public String saveStudentAbsentees(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		JSONArray jsonArray=input.getJSONArray("studentIdArray");
		
		List<Integer> absentStudentIds=new ArrayList<Integer>();
         for (Object object : jsonArray) {
			JSONObject jsonObject=(JSONObject) object;
			absentStudentIds.add(jsonObject.getInt("studentId"));
		}
         Integer schoolId=SessionManager.getUserContext(request).getSchoolId();
        try {
        	 List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId());
   		  if(schoolAcademics.isEmpty()){
   			  output.put("error", "true");
   				output.put("message", "Define active Academic Year");
   				return output.toString();
   		  }
			SimpleDateFormat dateFormat= new SimpleDateFormat("dd-MM-yyyy");
			Date attendanceDate=dateFormat.parse(input.getString("attendanceMarkingdate"));
			Date currentDate=new Date(System.currentTimeMillis());
			if(attendanceDate.getTime()>currentDate.getTime()){
				output.put("error", "true");
				 output.put("message", "Cannot mark attendance for future dates");
				 return output.toString();
			}
			Integer schoolSessionId=input.getInt("schoolSessionId");
			List<Integer> fullSchoolStudentsIds=Student.findFullSchoolStudentIdsBySchoolClassId(schoolId);
			 String fullSchoolStudentIdsStr=fullSchoolStudentsIds.toString();
			 fullSchoolStudentIdsStr=fullSchoolStudentIdsStr.replace("[", "(");
			 fullSchoolStudentIdsStr=fullSchoolStudentIdsStr.replace("]", ")");
			 SchoolSession schoolSession2=SchoolSession.findSchoolSession(schoolSessionId,SessionManager.getUserContext(request).getSchoolId()).get(0);
			  boolean isFullDaySession=false;
			  if(schoolSession2.getIsFullDaySession()==1){
				  isFullDaySession=true;
			  }
			  SimpleDateFormat dateFormat2= new SimpleDateFormat("yyyy-MM-dd");
			  List<Integer> schoolHoildayIds=null;
				//  if(isFullDaySession){
					  schoolHoildayIds= SchoolHoliday. findSchoolHoliday(null, schoolId, schoolAcademics.get(0).getSchoolAcademicYearId(), dateFormat2.format(attendanceDate));
				 // }else{
				//	  schoolHoildayIds= SchoolHoliday. findSchoolHoliday(schoolSessionId, schoolId, schoolAcademics.get(0).getSchoolAcademicYearId(), dateFormat2.format(attendanceDate));
				  //}
		     
		    if(!schoolHoildayIds.isEmpty()){
		    	SchoolHoliday schoolHoliday=SchoolHoliday.findSchoolHoliday(schoolHoildayIds.get(0));
		    	if(schoolHoliday.getSchoolSessionId().getIsFullDaySession()==1){
		            output.put("error", "true");
		  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" .Hence Cannot mark attendance !");
		  			return output.toString();
		    	}
		    	SchoolSession reqSchoolSession=SchoolSession.findSchoolSession(schoolSessionId);
		    	if(reqSchoolSession.getIsFullDaySession()==1){
		            output.put("error", "true");
		  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" .Hence Cannot mark attendance !");
		  			return output.toString();
		    	}
		    	if(reqSchoolSession.getSchoolSessionId()==schoolHoliday.getSchoolSessionId().getSchoolSessionId()){
		            output.put("error", "true");
		  			output.put("message", " On "+dateFormat.format(attendanceDate) +" You have declared Holiday On account of  "+schoolHoliday.getReason() +" for "+reqSchoolSession.getSessionName()+" Session .Hence Cannot mark attendance !");
		  			return output.toString();
		    	}
		    }
			  
			  List<Long> studentAttendanceIds= new ArrayList<Long>();
	          if(isFullDaySession){
	        	  studentAttendanceIds=StudentAttedance.
			        		  findStudentAttedancesForStudentOnlyIds(fullSchoolStudentIdsStr, schoolId, attendanceDate, null, schoolAcademics.get(0).getSchoolAcademicYearId());
			  }else{
				  studentAttendanceIds=StudentAttedance.
			        		 findStudentAttedancesForStudentOnlyIds(fullSchoolStudentIdsStr, schoolId, attendanceDate, schoolSessionId, schoolAcademics.get(0).getSchoolAcademicYearId());
			  }
	 		  String studentAttendanceIdsStr= studentAttendanceIds.toString();
	 		 studentAttendanceIdsStr=studentAttendanceIdsStr.replace("[", "(");
	 		studentAttendanceIdsStr=studentAttendanceIdsStr.replace("]", ")");
			   
	 		StudentAttedance.deleteStudentAttendaceByIds(studentAttendanceIdsStr, schoolId);
	 		
	 		fullSchoolStudentsIds.removeAll(absentStudentIds);
	 		  
	 		  List<SchoolSession> schoolSessions=SchoolSession.fetchSchoolSessions(schoolId);
			  
		    for (Integer studentId : fullSchoolStudentsIds) {
		    	if(isFullDaySession){
		    		for (SchoolSession schoolSession : schoolSessions) {
			    		StudentAttedance studentAttedance= new StudentAttedance();
						studentAttedance.setAttendanceDate(attendanceDate);
						AttendanceStatus attendanceStatusId= new AttendanceStatus();
						attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_PRESENT);
						studentAttedance.setAttendanceStatusId(attendanceStatusId);
						studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
						studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
						studentAttedance.setAttendanceDate(attendanceDate);
						studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
						studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
						studentAttedance.setSchoolSessionId(schoolSession);
						Student student= new Student();
						student.setStudentId(studentId);
						studentAttedance.setStudentId(student);
						studentAttedance.persist();
					}
		    	}else{
		    		StudentAttedance studentAttedance= new StudentAttedance();
					studentAttedance.setAttendanceDate(attendanceDate);
					AttendanceStatus attendanceStatusId= new AttendanceStatus();
					attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_PRESENT);
					studentAttedance.setAttendanceStatusId(attendanceStatusId);
					studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAttendanceDate(attendanceDate);
					studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
					studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
					SchoolSession schoolSession= new SchoolSession();
					schoolSession.setSchoolSessionId(schoolSessionId);
					studentAttedance.setSchoolSessionId(schoolSession);
					Student student= new Student();
					student.setStudentId(studentId);
					studentAttedance.setStudentId(student);
					studentAttedance.persist();
		    	}
			}
		    List<SchoolSession> fullSession=SchoolSession.fetchOnlyFullSchoolSessions(schoolId);
		    for (Integer studentId : absentStudentIds) {
		    	if(isFullDaySession){
		    		for (SchoolSession schoolSession : schoolSessions) {
		    			StudentAttedance studentAttedance= new StudentAttedance();
		    			studentAttedance.setAttendanceDate(attendanceDate);
		    			AttendanceStatus attendanceStatusId= new AttendanceStatus();
		    			attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
		    			studentAttedance.setAttendanceStatusId(attendanceStatusId);
		    			studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
		    			studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
		    			studentAttedance.setAttendanceDate(attendanceDate);
		    			studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
		    			studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
		    			studentAttedance.setSchoolSessionId(schoolSession);
		    			Student student= new Student();
		    			student.setStudentId(studentId);
		    			studentAttedance.setStudentId(student);
		    			studentAttedance.persist();
		    		}
		    	}else{
		    		StudentAttedance studentAttedance= new StudentAttedance();
					studentAttedance.setAttendanceDate(attendanceDate);
					AttendanceStatus attendanceStatusId= new AttendanceStatus();
					attendanceStatusId.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
					studentAttedance.setAttendanceStatusId(attendanceStatusId);
					studentAttedance.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
					studentAttedance.setAttendanceDate(attendanceDate);
					studentAttedance.setAuditUserId(SessionManager.getUserContext(request).getStaff());
					studentAttedance.setSchoolAcademicYearId(schoolAcademics.get(0));
					SchoolSession schoolSession= new SchoolSession();
					schoolSession.setSchoolSessionId(schoolSessionId);
					studentAttedance.setSchoolSessionId(schoolSession);
					Student student= new Student();
					student.setStudentId(studentId);
					studentAttedance.setStudentId(student);
					studentAttedance.persist();
					if(!fullSession.isEmpty()){
						StudentAttedance studentAttedance1= new StudentAttedance();
						studentAttedance1.setAttendanceDate(attendanceDate);
						AttendanceStatus attendanceStatusId1= new AttendanceStatus();
						attendanceStatusId1.setAttendanceStatusId(GeneralConstants.STUDENT_ATTENDANCE_STATUS_ABSENT);
						studentAttedance1.setAttendanceStatusId(attendanceStatusId1);
						studentAttedance1.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
						studentAttedance1.setAuditModifiedDtTime(new Date(System.currentTimeMillis()));
						studentAttedance1.setAttendanceDate(attendanceDate);
						studentAttedance1.setAuditUserId(SessionManager.getUserContext(request).getStaff());
						studentAttedance1.setSchoolAcademicYearId(schoolAcademics.get(0));
						studentAttedance1.setSchoolSessionId(fullSession.get(0));
						Student student1= new Student();
						student1.setStudentId(studentId);
						studentAttedance1.setStudentId(student1);
						studentAttedance1.persist();
					}
					
		    	}
				
			}
			
			output.put("error", "false");
			 output.put("message", "Attendance Successfuly saved");
			 return output.toString();
			 
			
			
		} catch (JSONException e) {
			output.put("error", "true");
			 output.put("message", "Invalid Input");
			 e.printStackTrace();
			 return output.toString();
		} catch (ParseException e) {
			output.put("error", "true");
			 output.put("message", "Invalid Date");
			 e.printStackTrace();
			 return output.toString();
		}
		
	}
     @RequestMapping(value = "/findStudentLeaveData", method = RequestMethod.POST,produces = "application/json")
 	 @ResponseBody
 	 public String findStudentLeaveData(HttpServletRequest request,HttpServletResponse reresponse)  {
 		JSONObject input= new JSONObject(request.getParameter("input"));
 		JSONObject output= new JSONObject();
 		Integer studentId=input.getInt("studentId");
 		
 		List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId());
 		  if(schoolAcademics.isEmpty()){
 			  output.put("error", "true");
 				output.put("message", "Define active Academic Year");
 				return output.toString();
 		  }
 		List<LeaveRegister> leaveRegisters=LeaveRegister.findLeaveRegister(studentId, SessionManager.getUserContext(request).getSchoolId(),
 				schoolAcademics.get(0).getSchoolAcademicYearId());
 		   output.put("error", "false");
			output.put("result", new JSONSerializer().serialize(leaveRegisters));
			return output.toString();
     }
     
     @RequestMapping(value = "/deleteStudentLeave", method = RequestMethod.POST,produces = "application/json")
 	 @ResponseBody
 	 public String deleteStudentLeave(HttpServletRequest request,HttpServletResponse reresponse)  {
 		JSONObject input= new JSONObject(request.getParameter("input"));
 		JSONObject output= new JSONObject();
 		Integer leaveRegisterId=input.getInt("leaveRegisterId");
 		List<LeaveRegister> leaveRegisters=LeaveRegister.findLeaveRegister(leaveRegisterId, SessionManager.getUserContext(request).getSchoolId());
 		for (LeaveRegister leaveRegister : leaveRegisters) {
 			leaveRegister.remove();
		}
 		 output.put("error", "false");
 		output.put("message", "Deleted Successfully");
			return output.toString();
     }
     
     @RequestMapping(value = "/saveStudentLeave", method = RequestMethod.POST,produces = "application/json")
 	 @ResponseBody
 	 public String saveStudentLeave(HttpServletRequest request,HttpServletResponse reresponse)  {
 		JSONObject input= new JSONObject(request.getParameter("input"));
 		JSONObject output= new JSONObject();
 		String fromDateForLeave=input.getString("fromDateForLeave");
 		String toDateForLeave=input.getString("toDateForLeave");
 		Integer schoolSessionId=input.getInt("schoolSessionId");
 		String leaveReason=input.getString("leaveReason");
 		Integer studentId=input.getInt("studentId");
 		LeaveRegister leaveRegister= new LeaveRegister();
 		SimpleDateFormat dateFormat= new SimpleDateFormat("dd-MM-yyyy");
 		List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId());
		  if(schoolAcademics.isEmpty()){
			  output.put("error", "true");
				output.put("message", "Define active Academic Year");
				return output.toString();
		  }
 		
 		
 		Date fromDate=null;
 		Date toDate=null;
		try {
			fromDate = dateFormat.parse(fromDateForLeave);
			 toDate=dateFormat.parse(toDateForLeave);
		} catch (ParseException e) {
			e.printStackTrace();
			 output.put("error", "true");
		  		output.put("message", "Invalid Date");
		 			return output.toString();
		}
 		
 		leaveRegister.setFromLeaveDate(fromDate);
 		leaveRegister.setToLeaveDate(toDate);
 		LeaveStatus leaveStatusId= new LeaveStatus();
 		leaveStatusId.setLeaveStatus(1);
 		leaveRegister.setLeaveStatusId(leaveStatusId);
 		leaveRegister.setLeaveReason(leaveReason);
 		LeaveType leaveTypeId= new LeaveType();
 		leaveTypeId.setLeaveTypeId(2);
 		leaveRegister.setLeaveTypeId(leaveTypeId);
 		leaveRegister.setLeaveWhomId(studentId);
 		leaveRegister.setSchoolAcademicYearId(schoolAcademics.get(0).getSchoolAcademicYearId());
 		leaveRegister.setSchoolId(SessionManager.getUserContext(request).getSchoolId());
 		SchoolSession schoolSession= new SchoolSession();
 		schoolSession.setSchoolSessionId(schoolSessionId);
 		leaveRegister.setSchoolSessionId(schoolSession);
 		leaveRegister.setToLeaveDate(toDate);
 		leaveRegister.persist();
 		 output.put("error", "false");
  		output.put("message", "Leave Saved Successfully");
 			return output.toString();
     }
     
     
     @RequestMapping(value = "/findRegularAbsentees", method = RequestMethod.POST,produces = "application/json")
  	 @ResponseBody
  	 public String findRegularAbsentees(HttpServletRequest request,HttpServletResponse reresponse)  {
  		JSONObject input= new JSONObject(request.getParameter("input"));
  		JSONObject output= new JSONObject();
  		Integer schoolSessionId =input.getInt("schoolSessionId");
  		List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId());
		  if(schoolAcademics.isEmpty()){
			  output.put("error", "true");
				output.put("message", "Define active Academic Year");
				return output.toString();
		  }
		  List<Object[]> result=StudentAttedance.findRegularAbsentees(schoolSessionId, schoolAcademics.get(0).getSchoolAcademicYearId(), SessionManager.getUserContext(request).getSchoolId());
		  output.put("error", "false");
	  		output.put("result", new JSONSerializer().serialize(result));
	 			return output.toString();
     }
     
	
}
