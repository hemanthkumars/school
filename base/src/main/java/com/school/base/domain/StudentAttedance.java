package com.school.base.domain;
import java.util.List;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "student_attedance")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "auditUserId", "studentId", "subjectId", "schoolAcademicYearId", "schoolSessionId", "attendanceStatusId" })
@RooJson
public class StudentAttedance {
	
	public static List<StudentAttedance>  findStudentAttedanceForGivenSession(Integer schoolSessionId,Integer schoolId){
		List<StudentAttedance> list=entityManager().createQuery("SELECT sa FROM StudentAttedance sa WHERE sa.studentId.schoolId.schoolId="+schoolId+" AND sa.schoolSessionId.schoolSessionId="+schoolSessionId+"  ").getResultList();
		return list;
	}
	
	public static List<StudentAttedance>  findStudentAttedanceForStudentId(Integer studentId,Integer schoolId){
		List<StudentAttedance> list=entityManager().createQuery("SELECT sa FROM StudentAttedance sa WHERE sa.studentId.schoolId.schoolId="+schoolId+" AND sa.studentId.studentId="+studentId+"  ").getResultList();
		return list;
	}
	
	
	@Override
  	protected void finalize() throws Throwable {
  		if (entityManager!=null) {
  			entityManager.clear();
  			entityManager.close();
  			entityManager=null;
		}
  		
  	}
}
