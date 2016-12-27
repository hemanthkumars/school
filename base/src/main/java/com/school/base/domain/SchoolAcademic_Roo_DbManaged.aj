// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.AcademicYear;
import com.school.base.domain.ClassExamination;
import com.school.base.domain.HomeWork;
import com.school.base.domain.School;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolFee;
import com.school.base.domain.SchoolHoliday;
import com.school.base.domain.Sms;
import com.school.base.domain.Student;
import com.school.base.domain.StudentAttedance;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect SchoolAcademic_Roo_DbManaged {
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<ClassExamination> SchoolAcademic.classExaminations;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<HomeWork> SchoolAcademic.homeWorks;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<SchoolFee> SchoolAcademic.schoolFees;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<SchoolHoliday> SchoolAcademic.schoolHolidays;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<Sms> SchoolAcademic.smss;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<Student> SchoolAcademic.students;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "schoolAcademicYearId")
    private Set<StudentAttedance> SchoolAcademic.studentAttedances;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID", nullable = false)
    private School SchoolAcademic.schoolId;
    
    @ManyToOne
    @JoinColumn(name = "ACADEMIC_YEAR_ID", referencedColumnName = "ACADEMIC_YEAR_ID", nullable = false)
    private AcademicYear SchoolAcademic.academicYearId;
    
    @Column(name = "START_DATE")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date SchoolAcademic.startDate;
    
    @Column(name = "END_DATE")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date SchoolAcademic.endDate;
    
    @Column(name = "CURRENT_YEAR_MARK")
    @NotNull
    private Integer SchoolAcademic.currentYearMark;
    
    public Set<ClassExamination> SchoolAcademic.getClassExaminations() {
        return classExaminations;
    }
    
    public void SchoolAcademic.setClassExaminations(Set<ClassExamination> classExaminations) {
        this.classExaminations = classExaminations;
    }
    
    public Set<HomeWork> SchoolAcademic.getHomeWorks() {
        return homeWorks;
    }
    
    public void SchoolAcademic.setHomeWorks(Set<HomeWork> homeWorks) {
        this.homeWorks = homeWorks;
    }
    
    public Set<SchoolFee> SchoolAcademic.getSchoolFees() {
        return schoolFees;
    }
    
    public void SchoolAcademic.setSchoolFees(Set<SchoolFee> schoolFees) {
        this.schoolFees = schoolFees;
    }
    
    public Set<SchoolHoliday> SchoolAcademic.getSchoolHolidays() {
        return schoolHolidays;
    }
    
    public void SchoolAcademic.setSchoolHolidays(Set<SchoolHoliday> schoolHolidays) {
        this.schoolHolidays = schoolHolidays;
    }
    
    public Set<Sms> SchoolAcademic.getSmss() {
        return smss;
    }
    
    public void SchoolAcademic.setSmss(Set<Sms> smss) {
        this.smss = smss;
    }
    
    public Set<Student> SchoolAcademic.getStudents() {
        return students;
    }
    
    public void SchoolAcademic.setStudents(Set<Student> students) {
        this.students = students;
    }
    
    public Set<StudentAttedance> SchoolAcademic.getStudentAttedances() {
        return studentAttedances;
    }
    
    public void SchoolAcademic.setStudentAttedances(Set<StudentAttedance> studentAttedances) {
        this.studentAttedances = studentAttedances;
    }
    
    public School SchoolAcademic.getSchoolId() {
        return schoolId;
    }
    
    public void SchoolAcademic.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public AcademicYear SchoolAcademic.getAcademicYearId() {
        return academicYearId;
    }
    
    public void SchoolAcademic.setAcademicYearId(AcademicYear academicYearId) {
        this.academicYearId = academicYearId;
    }
    
    public Date SchoolAcademic.getStartDate() {
        return startDate;
    }
    
    public void SchoolAcademic.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date SchoolAcademic.getEndDate() {
        return endDate;
    }
    
    public void SchoolAcademic.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public Integer SchoolAcademic.getCurrentYearMark() {
        return currentYearMark;
    }
    
    public void SchoolAcademic.setCurrentYearMark(Integer currentYearMark) {
        this.currentYearMark = currentYearMark;
    }
    
}