package com.school.base.domain;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "leave_register")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "leaveStatusId", "leaveTypeId", "schoolSessionId" })
@RooJson
public class LeaveRegister {
	
	@Column(name = "SCHOOL_ID")
    @NotNull
    private Integer schoolId;
	
	@Column(name = "SCHOOL_ACADEMIC_YEAR_ID")
    @NotNull
    private Integer schoolAcademicYearId;
	
	@Column(name = "FROM_LEAVE_DATE")
    @NotNull
    private Date fromLeaveDate;
	
	@Column(name = "TO_LEAVE_DATE")
    @NotNull
    private Date toLeaveDate;
	
	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public Integer getSchoolAcademicYearId() {
		return schoolAcademicYearId;
	}

	public void setSchoolAcademicYearId(Integer schoolAcademicYearId) {
		this.schoolAcademicYearId = schoolAcademicYearId;
	}

	public Date getFromLeaveDate() {
		return fromLeaveDate;
	}

	public void setFromLeaveDate(Date fromLeaveDate) {
		this.fromLeaveDate = fromLeaveDate;
	}

	public Date getToLeaveDate() {
		return toLeaveDate;
	}

	public void setToLeaveDate(Date toLeaveDate) {
		this.toLeaveDate = toLeaveDate;
	}

	public static List<LeaveRegister>  findLeaveRegister(Integer studentId,Integer schoolId,Integer schoolAcademicYearId){
		List<LeaveRegister> list=entityManager().createQuery("SELECT sl FROM  "
				+ " LeaveRegister sl WHERE sl.leaveWhomId="+studentId+" AND sl.schoolId="+schoolId+"  AND sl.schoolAcademicYearId="+schoolAcademicYearId+"").getResultList();
		return list;
	}
	
	public static List<LeaveRegister>  findLeaveRegister(Integer leaveRegisterId,Integer schoolId){
		List<LeaveRegister> list=entityManager().createQuery("SELECT sl FROM  "
				+ " LeaveRegister sl WHERE sl.leaveRegisterId="+leaveRegisterId+" AND sl.schoolId="+schoolId+" ").getResultList();
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
