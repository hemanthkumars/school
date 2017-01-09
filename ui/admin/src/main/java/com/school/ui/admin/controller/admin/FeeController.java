package com.school.ui.admin.controller.admin;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.text.WordUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.base.domain.ReceiptSchoolFee;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolFee;
import com.school.base.domain.SchoolFeeType;
import com.school.base.domain.Student;
import com.school.ui.admin.util.SessionManager;

@RequestMapping("/admin/fee")
@Controller
public class FeeController {
	
	@RequestMapping(value = "/fetchFeeType", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String login(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		List<SchoolFeeType> schoolFeeTypes=SchoolFeeType.findAllSchoolFeeType(SessionManager.getUserContext(request).getSchoolId());
        output.put("error", "false");
        output.put("result", SchoolFeeType.toJsonArray(schoolFeeTypes)); 
		
		return output.toString();
	}
	@RequestMapping(value = "/saveFeeType", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String saveFeeType(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		String schoolFeeType=input.getString("feeType");
		schoolFeeType=WordUtils.capitalize(schoolFeeType);
		Integer isConcessionType=input.getInt("isConcession");
		SchoolFeeType schoolFeeType2= new SchoolFeeType();
		schoolFeeType2.setDefaultAmount(0f);
		schoolFeeType2.setFeeType(schoolFeeType);
		schoolFeeType2.setIsConcessionType(isConcessionType);
		schoolFeeType2.setSchoolId(SessionManager.getUserContext(request).getStaff().getSchoolId());
		schoolFeeType2.persist();
		
		JSONObject output= new JSONObject();
		output.put("error", "false");
		output.put("message", "Suceessfully Saved");
		return output.toString();
	}
	
	@RequestMapping(value = "/deleteFeeType", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String deleteFeeType(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject input= new JSONObject(request.getParameter("input"));
		JSONObject output= new JSONObject();
		try {
			Integer schoolFeeTypeId=input.getInt("schoolFeeTypeId");
			List<SchoolFeeType> schoolFeeTypes  =SchoolFeeType.findSchoolFeeType(SessionManager.getUserContext(request).getSchoolId(), schoolFeeTypeId);
			
			if(schoolFeeTypes.isEmpty()){
				output.put("error", "true");
				output.put("message", "Not found");
				return output.toString();
			}
			
			List<SchoolFee> schoolFees=SchoolFee.findSchoolFeeByType(SessionManager.getUserContext(request).getSchoolId(), schoolFeeTypeId);
			if(!schoolFees.isEmpty()){
				output.put("error", "true");
				output.put("message", "You have received fees for "+schoolFeeTypes.get(0).getFeeType()+" Type . Hence Cannot Delete");
				return output.toString();
			}
			schoolFeeTypes.get(0).remove();
			output.put("error", "false");
			output.put("message", "Deleted Successfully");
			return output.toString();
		} catch (Exception e) {
			e.printStackTrace();
			output.put("error", "true");
			output.put("message", "Some Error Occurred");
			return output.toString();
		}
	}
	
	 @RequestMapping(value = "/findAllSchoolFeeDefn", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String findAllSchoolFeeDefn(HttpServletRequest request,HttpServletResponse reresponse)  {
		 JSONObject input= new JSONObject(request.getParameter("input"));
	     JSONObject output= new JSONObject();
	     try{
	     
		 Integer schoolClassId=input.getInt("schoolClassId");
		 Integer schoolId=SessionManager.getUserContext(request).getSchoolId();
		  List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(schoolId);
		  if(schoolAcademics.isEmpty()){
			  output.put("error", "true");
				output.put("message", "Define active Academic Year");
				return output.toString();
		  }
		 List<Object[]> result=SchoolFee.findStudentFeeDefnDataBySchoolClassId(schoolId, 
				 schoolClassId, schoolAcademics.get(0).getSchoolAcademicYearId());
		 List<Student> students=Student.findStudentBySchoolClassId(schoolClassId, SessionManager.getUserContext(request).getSchoolId());
		Map<Integer, Student> studentAllMap=new LinkedHashMap<Integer, Student>();
		for (Student student : students) {
			studentAllMap.put(student.getStudentId(), student);
		}
		 
		 
		 Map<Integer, List<Object[]>> studentIdWisefeeDefnMap= new HashMap<Integer, List<Object[]>>();
		 for (Object[] objects : result) {
			if(studentIdWisefeeDefnMap.containsKey(objects[6])){
				List<Object[]> list=studentIdWisefeeDefnMap.get(objects[6]);
				list.add(objects);
			}else{
				List<Object[]> list= new ArrayList<Object[]>();
				list.add(objects);
				studentIdWisefeeDefnMap.put((Integer)objects[6], list);
			}
		}
	JSONArray studentfeeDenyArray= new JSONArray();	 
	 for (Map.Entry<Integer, Student> entry1 : studentAllMap.entrySet()){
		 Integer studentId=entry1.getKey();
		 if(studentIdWisefeeDefnMap.containsKey(studentId)){
			 List<Object[]> res= studentIdWisefeeDefnMap.get(studentId);
			 Integer totalFees=0;
			 Integer totalPaid=0;
			 Integer totalBal=0;
			 JSONArray local= new JSONArray();
			 JSONObject jsonObject= new JSONObject();
			 jsonObject.put("studentName", res.get(0)[7]);
			 jsonObject.put("classSection", res.get(0)[10]);
			 jsonObject.put("containsFeeDefn", 1);
			
			 jsonObject.put("studentId", res.get(0)[6]);
			 jsonObject.put("feeDefnArray", local);
			 studentfeeDenyArray.put(jsonObject);
			 for (Object[] objects : res) {
				 JSONObject jsonObject1= new JSONObject();
				 jsonObject1.put("feeType", objects[1]);
				 totalFees+=(Integer)objects[3];
				 jsonObject1.put("feeAmount", objects[3]);
				 jsonObject1.put("paid", objects[4]);
				 totalPaid+=(Integer)objects[4];
				 jsonObject1.put("balance", objects[5]);
				 totalBal+=(Integer)objects[5];
				 jsonObject1.put("schoolFeeId", objects[0]);
				 local.put(jsonObject1);
			 }
			 jsonObject.put("totalFees",totalFees);
			 jsonObject.put("totalPaid", totalPaid);
			 jsonObject.put("totalBal", totalBal);
		 }else{
			 JSONObject jsonObject= new JSONObject();
			 Student student=entry1.getValue();
			 jsonObject.put("studentName", student.getFirstName() );
			 jsonObject.put("containsFeeDefn", 0);
			 jsonObject.put("classSection", student.getSchoolClassSectionId().getCode());
			 jsonObject.put("studentId", studentId);
			 studentfeeDenyArray.put(jsonObject);
			 
		 }
		 
	 }
			output.put("error", "false");
			output.put("result", studentfeeDenyArray.toString());
		return output.toString();
         }catch(Exception e){
        		output.put("error", "true");
    			output.put("message", "Some Error Ocurred");
    			e.printStackTrace();
    		return output.toString();
	     }
	}
	 
	 @RequestMapping(value = "/saveStudentFeeDefn", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String saveStudentFeeDefn(HttpServletRequest request,HttpServletResponse reresponse)  {
		 JSONObject input= new JSONObject(request.getParameter("input"));
	     JSONObject output= new JSONObject();
	     try{
             Integer schoolFeeTypeId=input.getInt("schoolFeeTypeId");
             Integer feeAmount=input.getInt("feeAmount");
             List<Integer> studentIds= new ArrayList<Integer>();
             JSONArray jsonArray=input.getJSONArray("studentIdArray");
             for (Object object : jsonArray) {
            	 JSONObject jsonObject=(JSONObject) object;
            	 Integer sid=jsonObject.getInt("studentId");
            	 studentIds.add(sid);
			}
             Integer schoolId=SessionManager.getUserContext(request).getSchoolId();
             List<SchoolAcademic> schoolAcademics=SchoolAcademic.fetchCurrentSchoolAcademic(SessionManager.getUserContext(request).getSchoolId() );
            
   		  if(schoolAcademics.isEmpty()){
   			  output.put("error", "true");
   				output.put("message", "Define active Academic Year");
   				return output.toString();
   		  }
             for (Integer studentId : studentIds) {
            	 
 				List<SchoolFee> schoolFees= SchoolFee.findSchoolFeeByType(schoolId, schoolFeeTypeId, schoolAcademics.get(0).getSchoolAcademicYearId(),studentId);
 				SchoolFee schoolFee=null;
 				if(schoolFees.isEmpty()){
 					schoolFee=new SchoolFee();
 				}else{
                   schoolFee=schoolFees.get(0);
 				}
 				
 				schoolFee.setAuditCreatedDtTime(new Date(System.currentTimeMillis()));
 				schoolFee.setAuditUserId(SessionManager.getUserContext(request).getStaff());
 				
 				schoolFee.setPaidAmount(0);
 				schoolFee.setSchoolAcademicYearId(schoolAcademics.get(0));
 				SchoolFeeType schoolFeeType= new SchoolFeeType();
 				schoolFeeType.setSchoolFeeTypeId(schoolFeeTypeId);
 				schoolFee.setSchoolFeeTypeId(schoolFeeType);
 				Student student= new Student();
 				student.setStudentId(studentId);
 				schoolFee.setStudentId(student);
 				if(!schoolFees.isEmpty()){
 					schoolFee.setTotalAmount(schoolFee.getTotalAmount()+feeAmount);
 					schoolFee.setBalance(feeAmount+schoolFee.getBalance());
 				}else{
 					schoolFee.setBalance(feeAmount);
 					schoolFee.setTotalAmount(feeAmount);
 				}
 				schoolFee.persist();
 			 }             
	         output.put("error", "false");
	 		 output.put("message", "Saved Successfully");
	 		return output.toString();
	     }catch(Exception e){
     		output.put("error", "true");
 			output.put("message", "Some Error Ocurred");
 			e.printStackTrace();
 		    return output.toString();
	     }
		 
	 }
	 
	 @RequestMapping(value = "/deleteStudentFeeDefn", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String deleteStudentFeeDefn(HttpServletRequest request,HttpServletResponse reresponse)  {
		 JSONObject input= new JSONObject(request.getParameter("input"));
	     JSONObject output= new JSONObject();
	     try{
	    	 Integer schoolFeeId=input.getInt("schoolFeeId");
	     Long  schoolFeeIdl=schoolFeeId.longValue();
	    List<ReceiptSchoolFee> receiptSchoolFees=ReceiptSchoolFee.findSchoolFee(SessionManager.getUserContext(request).getSchoolId(), schoolFeeIdl);
	    if(!receiptSchoolFees.isEmpty()){
	    	output.put("error", "true");
 			output.put("result", "You have Received Fees Hence Cannot delete");
 		    return output.toString();
	    }
	     
	     List<SchoolFee> schoolFees=SchoolFee.findSchoolFeeActual(SessionManager.getUserContext(request).getSchoolId(), schoolFeeId);
	     for (SchoolFee schoolFee : schoolFees) {
			schoolFee.remove();
		  }
	     output.put("error", "false");
			output.put("message", "Deleted Successfully");
	     return output.toString();
	     }
	     catch(Exception e){
	     		output.put("error", "true");
	 			output.put("message", "Some Error Ocurred");
	 			e.printStackTrace();
	 		    return output.toString();
		  }
	 }
	
}
