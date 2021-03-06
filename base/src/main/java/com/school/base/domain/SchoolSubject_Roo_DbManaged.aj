// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ClassExamination;
import com.school.base.domain.School;
import com.school.base.domain.SchoolSubject;
import com.school.base.domain.StudentAttedance;
import com.school.base.domain.SubjectClass;
import com.school.base.domain.SubjectStaffClass;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect SchoolSubject_Roo_DbManaged {
    
    @OneToMany(mappedBy = "schoolSubjectId")
    private Set<ClassExamination> SchoolSubject.classExaminations;
    
    @OneToMany(mappedBy = "subjectId")
    private Set<StudentAttedance> SchoolSubject.studentAttedances;
    
    @OneToMany(mappedBy = "schoolSubjectId")
    private Set<SubjectClass> SchoolSubject.subjectClasses;
    
    @OneToMany(mappedBy = "schoolSubjectId")
    private Set<SubjectStaffClass> SchoolSubject.subjectStaffClasses;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID", nullable = false)
    private School SchoolSubject.schoolId;
    
    @Column(name = "SUBJECT_NAME", length = 100)
    @NotNull
    private String SchoolSubject.subjectName;
    
    @Column(name = "SUBJECT_CODE", length = 20)
    private String SchoolSubject.subjectCode;
    
    @Column(name = "CREDITS", length = 100)
    private String SchoolSubject.credits;
    
    @Column(name = "PLACEHOLDER", length = 100)
    private String SchoolSubject.placeholder;
    
    public Set<ClassExamination> SchoolSubject.getClassExaminations() {
        return classExaminations;
    }
    
    public void SchoolSubject.setClassExaminations(Set<ClassExamination> classExaminations) {
        this.classExaminations = classExaminations;
    }
    
    public Set<StudentAttedance> SchoolSubject.getStudentAttedances() {
        return studentAttedances;
    }
    
    public void SchoolSubject.setStudentAttedances(Set<StudentAttedance> studentAttedances) {
        this.studentAttedances = studentAttedances;
    }
    
    public Set<SubjectClass> SchoolSubject.getSubjectClasses() {
        return subjectClasses;
    }
    
    public void SchoolSubject.setSubjectClasses(Set<SubjectClass> subjectClasses) {
        this.subjectClasses = subjectClasses;
    }
    
    public Set<SubjectStaffClass> SchoolSubject.getSubjectStaffClasses() {
        return subjectStaffClasses;
    }
    
    public void SchoolSubject.setSubjectStaffClasses(Set<SubjectStaffClass> subjectStaffClasses) {
        this.subjectStaffClasses = subjectStaffClasses;
    }
    
    public School SchoolSubject.getSchoolId() {
        return schoolId;
    }
    
    public void SchoolSubject.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public String SchoolSubject.getSubjectName() {
        return subjectName;
    }
    
    public void SchoolSubject.setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    public String SchoolSubject.getSubjectCode() {
        return subjectCode;
    }
    
    public void SchoolSubject.setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
    
    public String SchoolSubject.getCredits() {
        return credits;
    }
    
    public void SchoolSubject.setCredits(String credits) {
        this.credits = credits;
    }
    
    public String SchoolSubject.getPlaceholder() {
        return placeholder;
    }
    
    public void SchoolSubject.setPlaceholder(String placeholder) {
        this.placeholder = placeholder;
    }
    
}
