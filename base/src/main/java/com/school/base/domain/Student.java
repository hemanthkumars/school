package com.school.base.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "student")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "schoolFees", "smss", "studentAttedances", "studentClassHistories", "studentExaminations", "studentGroups", "studentLogins", "auditUserId", "schoolId", "cityId", "stateId", "countryId", "schoolClassSectionId", "genderId", "bloodGroupId", "schoolGroupId", "motherTongueId", "casteId", "religionId", "schoolAcademicYearId" })
@RooJson
public class Student {
	@Override
  	protected void finalize() throws Throwable {
  		if (entityManager!=null) {
  			entityManager.clear();
  			entityManager.close();
  			entityManager=null;
		}
  		
  	}
}
