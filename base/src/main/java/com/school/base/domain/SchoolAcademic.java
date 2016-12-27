package com.school.base.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "school_academic")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "classExaminations", "homeWorks", "schoolFees", "schoolHolidays", "smss", "students", "studentAttedances", "schoolId", "academicYearId" })
@RooJson
public class SchoolAcademic {
	@Override
  	protected void finalize() throws Throwable {
  		if (entityManager!=null) {
  			entityManager.clear();
  			entityManager.close();
  			entityManager=null;
		}
  		
  	}
}
