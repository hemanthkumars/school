package com.school.base.domain;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "school_fee")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "receiptSchoolFees", "schoolFeeTypeId", "studentId", "schoolAcademicYearId", "auditUserId" })
@RooJson
public class SchoolFee {
	
	@Column(name = "AUDIT_CREATED_DT_TIME")
    private Date auditCreatedDtTime;
	
	
	public Date getAuditCreatedDtTime() {
		return auditCreatedDtTime;
	}

	public void setAuditCreatedDtTime(Date auditCreatedDtTime) {
		this.auditCreatedDtTime = auditCreatedDtTime;
	}

	public static List<SchoolFee>  findSchoolFee(Integer studentId,Integer schoolId){
		List<SchoolFee> list=entityManager().createQuery("SELECT sa FROM SchoolFee  sa WHERE sa.studentId.schoolId.schoolId="+schoolId+" AND sa.studentId.studentId="+studentId+"  ").getResultList();
		return list;
	}
	
	public static List<SchoolFee>  findSchoolFeeActual(Integer schoolId,Integer schoolFeeId){
		List<SchoolFee> list=entityManager().createQuery("SELECT sa FROM SchoolFee  sa WHERE sa.studentId.schoolId.schoolId="+schoolId+" AND sa.schoolFeeId="+schoolFeeId+"  ").getResultList();
		return list;
	}
	
	public static List<SchoolFee>  findSchoolFeeByType(Integer schoolId,Integer schoolFeeTypeId){
		List<SchoolFee> list=entityManager().createQuery("SELECT sl FROM SchoolFee sl WHERE sl.studentId.schoolId.schoolId="+schoolId+" AND sl.schoolFeeTypeId.schoolFeeTypeId="+schoolFeeTypeId+"").getResultList();
		return list;
	}
	
	public static List<SchoolFee>  findSchoolFeeByType(Integer schoolId,Integer schoolFeeTypeId,Integer schoolAcademicYearId,Integer studentId){
		List<SchoolFee> list=entityManager().createQuery("SELECT sl FROM SchoolFee sl WHERE sl.studentId.schoolId.schoolId="+schoolId+" "
				+ " AND sl.schoolFeeTypeId.schoolFeeTypeId="+schoolFeeTypeId+" AND sl.schoolAcademicYearId.schoolAcademicYearId="+schoolAcademicYearId+" "
						+ " AND  sl.studentId.studentId="+studentId+" ").getResultList();
		return list;
	}
	
	public static List<Object[]>  findStudentFeeDefnData(Integer schoolId,Integer schoolClassSectionId,Integer schoolAcademicYearId){
		StringBuilder query= new StringBuilder();
		query.append(" SELECT sf.SCHOOL_FEE_ID,sft.FEE_TYPE,scs.SCHOOL_CLASS_SECTION_ID,");
		query.append(" sf.TOTAL_AMOUNT,sf.PAID_AMOUNT,sf.BALANCE,");
		query.append(" s.STUDENT_ID,s.FIRST_NAME,s.FATHER_NAME,");
		query.append(" s.FATHER_MOBILE");
		query.append(" FROM school_fee sf");
		query.append(" JOIN student s");
		query.append(" JOIN school_fee_type sft");
		query.append(" JOIN school_class_section scs JOIN school_class scl");
		query.append(" WHERE sf.STUDENT_ID=S.STUDENT_ID");
		query.append(" AND sft.SCHOOL_FEE_TYPE_ID=sf.SCHOOL_FEE_TYPE_ID");
		query.append(" AND scs.SCHOOL_CLASS_SECTION_ID=s.SCHOOL_CLASS_SECTION_ID");
		query.append(" AND scs.SCHOOL_CLASS_SECTION_ID="+schoolClassSectionId+"");
		query.append(" AND sf.SCHOOL_ACADEMIC_YEAR_ID="+schoolAcademicYearId+"");
		query.append(" AND scl.SCHOOL_ID="+schoolId+" AND scl.SCHOOL_CLASS_ID=scs.SCHOOL_CLASS_ID ");
		query.append(" GROUP BY sf.SCHOOL_FEE_ID");
		
		return entityManager().createNativeQuery(query.toString()).getResultList();
	}
	
	
	public static List<Object[]>  findStudentFeeDefnDataBySchoolClassId(Integer schoolId,Integer schoolClassId,Integer schoolAcademicYearId){
		StringBuilder query= new StringBuilder();
		query.append(" SELECT sf.SCHOOL_FEE_ID,sft.FEE_TYPE,scs.SCHOOL_CLASS_SECTION_ID,");
		query.append(" sf.TOTAL_AMOUNT,sf.PAID_AMOUNT,sf.BALANCE,");
		query.append(" s.STUDENT_ID,s.FIRST_NAME,s.FATHER_NAME,");
		query.append(" s.FATHER_MOBILE,scs.CODE");
		query.append(" FROM school_fee sf");
		query.append(" JOIN student s");
		query.append(" JOIN school_fee_type sft");
		query.append(" JOIN school_class_section scs JOIN school_class scl");
		query.append(" WHERE sf.STUDENT_ID=S.STUDENT_ID");
		query.append(" AND sft.SCHOOL_FEE_TYPE_ID=sf.SCHOOL_FEE_TYPE_ID");
		query.append(" AND scs.SCHOOL_CLASS_SECTION_ID=s.SCHOOL_CLASS_SECTION_ID");
		query.append(" AND scl.SCHOOL_CLASS_ID="+schoolClassId+"");
		query.append(" AND sf.SCHOOL_ACADEMIC_YEAR_ID="+schoolAcademicYearId+"");
		query.append(" AND scl.SCHOOL_ID="+schoolId+" AND scl.SCHOOL_CLASS_ID=scs.SCHOOL_CLASS_ID ");
		query.append(" GROUP BY sf.SCHOOL_FEE_ID");
		
		return entityManager().createNativeQuery(query.toString()).getResultList();
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
