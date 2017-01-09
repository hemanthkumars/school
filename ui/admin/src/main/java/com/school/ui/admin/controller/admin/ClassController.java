package com.school.ui.admin.controller.admin;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.base.domain.SchoolClass;
import com.school.base.domain.SchoolClassSection;
import com.school.base.domain.SchoolLogin;
import com.school.base.domain.Section;
import com.school.base.domain.Staff;
import com.school.base.domain.Student;
import com.school.base.util.EncryptAndDecrypt;
import com.school.ui.admin.util.SessionManager;
import com.school.ui.admin.util.UserContext;

import flexjson.JSONSerializer;

@RequestMapping("/admin/class")
@Controller
public class ClassController {
	
	@RequestMapping(value = "/fetchClassDefinition", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchClassDefinition(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		List<SchoolClass> schoolClasses=SchoolClass.fetchClassDefn(SessionManager.getUserContext(request).getStaff().getSchoolId().getSchoolId());
	    output.put("error", "false");
		output.put("result", SchoolClass.toJsonArray(schoolClasses));
		return output.toString();
	}
	

	 @RequestMapping(value = "/saveClassDefinition", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String saveClassDefinition(HttpServletRequest request,HttpServletResponse reresponse)  {
	    JSONObject input=new JSONObject(request.getParameter("input"));
	    JSONObject output= new JSONObject();
	    try {
			String className=input.getString("className");
			String classCode=input.getString("classCode");
			SchoolClass schoolClass= new SchoolClass();
			schoolClass.setClassCode(classCode);
			schoolClass.setClassName(className);
			schoolClass.setSchoolId(SessionManager.getUserContext(request).getStaff().getSchoolId());
			schoolClass.persist();
		} catch (Exception e) {
		   output.put("error", "true");
		   output.put("message", "Invalid Input");
		   return output.toString();
		}
	    output.put("error", "false");
		output.put("message", "Added Successfully !");
		return output.toString();
	}
	 
	 @RequestMapping(value = "/deleteClassDefinition", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String deleteClassDefinition(HttpServletRequest request,HttpServletResponse reresponse)  {
	    JSONObject input=new JSONObject(request.getParameter("input"));
	    JSONObject output= new JSONObject();
	    try {
			Integer schoolClassId=input.getInt("schoolClassId");
			List<SchoolClass> schoolClasses= SchoolClass.findSchoolClass(schoolClassId, SessionManager.getUserContext(request).getStaff().getSchoolId().getSchoolId());
			if(schoolClasses.isEmpty()){
				output.put("error", "true");
				output.put("message", "Unable to delete");
			}else{
				
				List<SchoolClassSection> schoolClassSections=SchoolClassSection.findSchoolClassSection(schoolClassId, SessionManager.getUserContext(request).getStaff().getSchoolId().getSchoolId());
				if(schoolClassSections.isEmpty()){
					schoolClasses.get(0).remove();
					output.put("error", "false");
					output.put("message", "Deleted Successfully !");
				}else{
					output.put("error", "true");
					output.put("message", schoolClasses.get(0).getClassName()+" Contains Sections Hence cannot delete" );
				}
			}
		} catch (Exception e) {
		   output.put("error", "true");
		   output.put("message", "Invalid Input");
		}
	    
		return output.toString();
	}
	 
	 @RequestMapping(value = "/fetchSchoolClassSection", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchSchoolClassSection(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		List<SchoolClassSection> schoolClassSections=SchoolClassSection.findSchoolClassSectionFull(SessionManager.getUserContext(request).getSchoolId());
		
	    output.put("error", "false");
		output.put("result", SchoolClassSection.toJsonArray(schoolClassSections));
		return output.toString();
	}
	 
	 @RequestMapping(value = "/fetchAllSections", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchAllSections(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		List<Section> sections=Section.findAllSections();
		
	    output.put("error", "false");
		output.put("result", Section.toJsonArray(sections));
		return output.toString();
	}
	 
	 
	 @RequestMapping(value = "/fetchAllSchoolClass", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchAllSchoolClass(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		List<SchoolClass> schoolClasses=SchoolClass.findAllSchoolClasses(SessionManager.getUserContext(request).getSchoolId());
		
	    output.put("error", "false");
		output.put("result", SchoolClass.toJsonArray(schoolClasses));
		return output.toString();
	}
	 
	 
	 
	 @RequestMapping(value = "/deleteSchoolClassSection", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String deleteSchoolClassSection(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		JSONObject input=new JSONObject(request.getParameter("input"));
		Integer schoolClassSectionId=input.getInt("schoolClassSectionId");
		List<Student> students=Student.findStudentBySchoolClassSectioId(schoolClassSectionId,SessionManager.getUserContext(request).getSchoolId());
		if(!students.isEmpty()){
			 output.put("error", "true");
				output.put("message","You have assigned student to this class Hence cannot delete");
				return output.toString();
		}
		List<SchoolClassSection> schoolClassSections=SchoolClassSection.findSchoolClassSectionActual(schoolClassSectionId, SessionManager.getUserContext(request).getSchoolId());
		if(schoolClassSections.isEmpty()){
			output.put("error", "true");
			output.put("message","Unable To Delete");
			return output.toString();
		}
		schoolClassSections.get(0).remove();
	    output.put("error", "false");
		output.put("message","Deleted Successfully!");
		return output.toString();
	}
	 
	 @RequestMapping(value = "/generateSchoolClassSection", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String generateSchoolClassSection(HttpServletRequest request,HttpServletResponse reresponse)  {
		JSONObject output= new JSONObject();
		JSONObject input=new JSONObject(request.getParameter("input"));
		Integer startSectionId=input.getInt("startSectionId");
		Integer endSectionId=input.getInt("endSectionId");
		Integer schoolClassId=input.getInt("schoolClassId");
		if(startSectionId>endSectionId){
			 output.put("error", "true");
				output.put("message", "Start Section Cannot be lower than End Section");
				return output.toString();
		}
		
		SchoolClass schoolClass=SchoolClass.findSchoolClass(schoolClassId);
		
		for (int i = startSectionId; i <= endSectionId; i++) {
			SchoolClassSection schoolClassSection= new SchoolClassSection();
			Section section= Section.findSection(i);
			schoolClassSection.setCode(schoolClass.getClassCode()+"-"+section.getSection());
			schoolClassSection.setSchoolClassSectionName(schoolClass.getClassName()+" "+section.getSection());
			schoolClassSection.setSectionId(section);
			schoolClassSection.setSchoolClassId(schoolClass);
			schoolClassSection.persist();
		}
		
		
	    output.put("error", "false");
		output.put("message", "Successfully classe(s) Generated");
		return output.toString();
	}
	 
	 @RequestMapping(value = "/fetchSchoolClassSectionLike", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchSchoolClassSectionLike(HttpServletRequest request,HttpServletResponse reresponse)  {
		String classSearchStr=request.getParameter("param");
		
		List<SchoolClassSection> schoolClassSections=SchoolClassSection.findSchoolClassSectionLike(SessionManager.getUserContext(request).getSchoolId(), classSearchStr);
		
         JSONArray jsonArray= new JSONArray();
         for (SchoolClassSection schoolClassSection : schoolClassSections) {
 			JSONObject jsonObject= new JSONObject();
 			jsonObject.put("label", schoolClassSection.getSchoolClassSectionName());
 		 	jsonObject.put("value", schoolClassSection.getSchoolClassSectionId());
 		 	jsonArray.put(jsonObject);
 		}
         JSONObject jsonObject= new JSONObject();
         jsonObject.put("error", "false");
         jsonObject.put("result", jsonArray.toString());
		
		return jsonObject.toString();
	}
	 @RequestMapping(value = "/fetchSchoolClassLike", method = RequestMethod.POST,produces = "application/json")
	 @ResponseBody
	 public String fetchSchoolClassLike(HttpServletRequest request,HttpServletResponse reresponse)  {
		String classSearchStr=request.getParameter("param");
		List<SchoolClass> schoolClassSections=SchoolClass.fetchSchoolClassLike(SessionManager.getUserContext(request).getSchoolId(), classSearchStr);
		
         JSONArray jsonArray= new JSONArray();
         for (SchoolClass schoolClass : schoolClassSections ) {
 			JSONObject jsonObject= new JSONObject();
 			jsonObject.put("label", schoolClass.getClassName());
 		 	jsonObject.put("value", schoolClass.getSchoolClassId());
 		 	jsonArray.put(jsonObject);
 		}
         JSONObject jsonObject= new JSONObject();
         jsonObject.put("error", "false");
         jsonObject.put("result", jsonArray.toString());
		
		return jsonObject.toString();
	}
	 
	 
	
}
