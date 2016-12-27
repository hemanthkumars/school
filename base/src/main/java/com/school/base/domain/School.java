package com.school.base.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "school")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "departments", "examinations", "homeWorkTypes", "schoolAcademics", "schoolCalendars", "schoolClasses", "schoolDeparments", "schoolFeeReceipts", "schoolFeeTypes", "schoolGrades", "schoolGroups", "schoolHolidays", "schoolLogins", "schoolSessions", "schoolSmsTemplates", "schoolSubjects", "smss", "staffs", "students" })
@RooJson
public class School {
	@Override
  	protected void finalize() throws Throwable {
  		if (entityManager!=null) {
  			entityManager.clear();
  			entityManager.close();
  			entityManager=null;
		}
  		
  	}
}
