// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.School;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.Sms;
import com.school.base.domain.Staff;
import com.school.base.domain.Student;
import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Sms_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID")
    private School Sms.schoolId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ACADEMIC_YEAR_ID", referencedColumnName = "SCHOOL_ACADEMIC_YEAR_ID")
    private SchoolAcademic Sms.schoolAcademicYearId;
    
    @ManyToOne
    @JoinColumn(name = "STUDENT_ID", referencedColumnName = "STUDENT_ID")
    private Student Sms.studentId;
    
    @ManyToOne
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    private Staff Sms.staffId;
    
    @ManyToOne
    @JoinColumn(name = "AUDIT_USER_ID", referencedColumnName = "STAFF_ID")
    private Staff Sms.auditUserId;
    
    @Column(name = "RECIPIENT_MOBILE_NO", length = 255)
    private String Sms.recipientMobileNo;
    
    @Column(name = "SMS_DETAIL", length = 500)
    @NotNull
    private String Sms.smsDetail;
    
    @Column(name = "SMS_COUNT")
    private Integer Sms.smsCount;
    
    @Column(name = "SMS_COST", precision = 12)
    private Float Sms.smsCost;
    
    @Column(name = "SMS_STATUS", length = 255)
    private String Sms.smsStatus;
    
    @Column(name = "MESSAGE_ID", length = 200)
    private String Sms.messageId;
    
    @Column(name = "SMS_SENT_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Sms.smsSentDtTime;
    
    @Column(name = "SMS_DELIVERED_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Sms.smsDeliveredDtTime;
    
    public School Sms.getSchoolId() {
        return schoolId;
    }
    
    public void Sms.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public SchoolAcademic Sms.getSchoolAcademicYearId() {
        return schoolAcademicYearId;
    }
    
    public void Sms.setSchoolAcademicYearId(SchoolAcademic schoolAcademicYearId) {
        this.schoolAcademicYearId = schoolAcademicYearId;
    }
    
    public Student Sms.getStudentId() {
        return studentId;
    }
    
    public void Sms.setStudentId(Student studentId) {
        this.studentId = studentId;
    }
    
    public Staff Sms.getStaffId() {
        return staffId;
    }
    
    public void Sms.setStaffId(Staff staffId) {
        this.staffId = staffId;
    }
    
    public Staff Sms.getAuditUserId() {
        return auditUserId;
    }
    
    public void Sms.setAuditUserId(Staff auditUserId) {
        this.auditUserId = auditUserId;
    }
    
    public String Sms.getRecipientMobileNo() {
        return recipientMobileNo;
    }
    
    public void Sms.setRecipientMobileNo(String recipientMobileNo) {
        this.recipientMobileNo = recipientMobileNo;
    }
    
    public String Sms.getSmsDetail() {
        return smsDetail;
    }
    
    public void Sms.setSmsDetail(String smsDetail) {
        this.smsDetail = smsDetail;
    }
    
    public Integer Sms.getSmsCount() {
        return smsCount;
    }
    
    public void Sms.setSmsCount(Integer smsCount) {
        this.smsCount = smsCount;
    }
    
    public Float Sms.getSmsCost() {
        return smsCost;
    }
    
    public void Sms.setSmsCost(Float smsCost) {
        this.smsCost = smsCost;
    }
    
    public String Sms.getSmsStatus() {
        return smsStatus;
    }
    
    public void Sms.setSmsStatus(String smsStatus) {
        this.smsStatus = smsStatus;
    }
    
    public String Sms.getMessageId() {
        return messageId;
    }
    
    public void Sms.setMessageId(String messageId) {
        this.messageId = messageId;
    }
    
    public Calendar Sms.getSmsSentDtTime() {
        return smsSentDtTime;
    }
    
    public void Sms.setSmsSentDtTime(Calendar smsSentDtTime) {
        this.smsSentDtTime = smsSentDtTime;
    }
    
    public Calendar Sms.getSmsDeliveredDtTime() {
        return smsDeliveredDtTime;
    }
    
    public void Sms.setSmsDeliveredDtTime(Calendar smsDeliveredDtTime) {
        this.smsDeliveredDtTime = smsDeliveredDtTime;
    }
    
}