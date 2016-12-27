// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.BloodGroup;
import com.school.base.domain.Caste;
import com.school.base.domain.City;
import com.school.base.domain.Country;
import com.school.base.domain.Gender;
import com.school.base.domain.Language;
import com.school.base.domain.Religion;
import com.school.base.domain.School;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolClassSection;
import com.school.base.domain.SchoolFee;
import com.school.base.domain.SchoolGroup;
import com.school.base.domain.Sms;
import com.school.base.domain.Staff;
import com.school.base.domain.State;
import com.school.base.domain.Student;
import com.school.base.domain.StudentAttedance;
import com.school.base.domain.StudentClassHistory;
import com.school.base.domain.StudentExamination;
import com.school.base.domain.StudentGroup;
import com.school.base.domain.StudentLogin;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Student_Roo_DbManaged {
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<SchoolFee> Student.schoolFees;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<Sms> Student.smss;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<StudentAttedance> Student.studentAttedances;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<StudentClassHistory> Student.studentClassHistories;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<StudentExamination> Student.studentExaminations;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<StudentGroup> Student.studentGroups;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "studentId")
    private Set<StudentLogin> Student.studentLogins;
    
    @ManyToOne
    @JoinColumn(name = "AUDIT_USER_ID", referencedColumnName = "STAFF_ID")
    private Staff Student.auditUserId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID", nullable = false)
    private School Student.schoolId;
    
    @ManyToOne
    @JoinColumn(name = "CITY_ID", referencedColumnName = "CITY_ID")
    private City Student.cityId;
    
    @ManyToOne
    @JoinColumn(name = "STATE_ID", referencedColumnName = "STATE_ID")
    private State Student.stateId;
    
    @ManyToOne
    @JoinColumn(name = "COUNTRY_ID", referencedColumnName = "COUNTRY_ID")
    private Country Student.countryId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_CLASS_SECTION_ID", referencedColumnName = "SCHOOL_CLASS_SECTION_ID")
    private SchoolClassSection Student.schoolClassSectionId;
    
    @ManyToOne
    @JoinColumn(name = "GENDER_ID", referencedColumnName = "GENDER_ID", nullable = false)
    private Gender Student.genderId;
    
    @ManyToOne
    @JoinColumn(name = "BLOOD_GROUP_ID", referencedColumnName = "BLOOD_GROUP_ID")
    private BloodGroup Student.bloodGroupId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_GROUP_ID", referencedColumnName = "SCHOOL_GROUP_ID")
    private SchoolGroup Student.schoolGroupId;
    
    @ManyToOne
    @JoinColumn(name = "MOTHER_TONGUE_ID", referencedColumnName = "LANGUAGE_ID")
    private Language Student.motherTongueId;
    
    @ManyToOne
    @JoinColumn(name = "CASTE_ID", referencedColumnName = "CASTE_ID")
    private Caste Student.casteId;
    
    @ManyToOne
    @JoinColumn(name = "RELIGION_ID", referencedColumnName = "RELIGION_ID")
    private Religion Student.religionId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ACADEMIC_YEAR_ID", referencedColumnName = "SCHOOL_ACADEMIC_YEAR_ID")
    private SchoolAcademic Student.schoolAcademicYearId;
    
    @Column(name = "FIRST_NAME", length = 200)
    private String Student.firstName;
    
    @Column(name = "MIDDLE_NAME", length = 200)
    private String Student.middleName;
    
    @Column(name = "LAST_NAME", length = 200)
    private String Student.lastName;
    
    @Column(name = "INITIAL", length = 50)
    private String Student.initial;
    
    @Column(name = "DOB")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Student.dob;
    
    @Column(name = "ADMISSION_DATE")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Student.admissionDate;
    
    @Column(name = "ADMISSION_NO", length = 255)
    private String Student.admissionNo;
    
    @Column(name = "STUDENT_PHOTO_URL", length = 255)
    private String Student.studentPhotoUrl;
    
    @Column(name = "IDENTIFICATION_MARK", length = 255)
    private String Student.identificationMark;
    
    @Column(name = "FATHER_NAME", length = 255)
    private String Student.fatherName;
    
    @Column(name = "MOTHER_NAME", length = 255)
    private String Student.motherName;
    
    @Column(name = "FATHER_OCCUPATION", length = 255)
    private String Student.fatherOccupation;
    
    @Column(name = "MOTHER_OCCUPATION", length = 255)
    private String Student.motherOccupation;
    
    @Column(name = "FATHER_MOBILE", length = 20)
    private String Student.fatherMobile;
    
    @Column(name = "MOTHER_MOBILE", length = 20)
    private String Student.motherMobile;
    
    @Column(name = "FATHER_EMAIL", length = 300)
    private String Student.fatherEmail;
    
    @Column(name = "MOTHER_EMAIL", length = 300)
    private String Student.motherEmail;
    
    @Column(name = "ADDRESS", length = 500)
    private String Student.address;
    
    @Column(name = "LANDMARK", length = 200)
    private String Student.landmark;
    
    @Column(name = "DISTRICT_ID")
    private Integer Student.districtId;
    
    @Column(name = "PINCODE", length = 100)
    private String Student.pincode;
    
    @Column(name = "USERNAME", length = 300)
    private String Student.username;
    
    @Column(name = "PASSWORD", length = 500)
    private String Student.password;
    
    @Column(name = "AUDIT_CREATED_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Student.auditCreatedDtTime;
    
    @Column(name = "AUDIT_MODIFIED_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Student.auditModifiedDtTime;
    
    public Set<SchoolFee> Student.getSchoolFees() {
        return schoolFees;
    }
    
    public void Student.setSchoolFees(Set<SchoolFee> schoolFees) {
        this.schoolFees = schoolFees;
    }
    
    public Set<Sms> Student.getSmss() {
        return smss;
    }
    
    public void Student.setSmss(Set<Sms> smss) {
        this.smss = smss;
    }
    
    public Set<StudentAttedance> Student.getStudentAttedances() {
        return studentAttedances;
    }
    
    public void Student.setStudentAttedances(Set<StudentAttedance> studentAttedances) {
        this.studentAttedances = studentAttedances;
    }
    
    public Set<StudentClassHistory> Student.getStudentClassHistories() {
        return studentClassHistories;
    }
    
    public void Student.setStudentClassHistories(Set<StudentClassHistory> studentClassHistories) {
        this.studentClassHistories = studentClassHistories;
    }
    
    public Set<StudentExamination> Student.getStudentExaminations() {
        return studentExaminations;
    }
    
    public void Student.setStudentExaminations(Set<StudentExamination> studentExaminations) {
        this.studentExaminations = studentExaminations;
    }
    
    public Set<StudentGroup> Student.getStudentGroups() {
        return studentGroups;
    }
    
    public void Student.setStudentGroups(Set<StudentGroup> studentGroups) {
        this.studentGroups = studentGroups;
    }
    
    public Set<StudentLogin> Student.getStudentLogins() {
        return studentLogins;
    }
    
    public void Student.setStudentLogins(Set<StudentLogin> studentLogins) {
        this.studentLogins = studentLogins;
    }
    
    public Staff Student.getAuditUserId() {
        return auditUserId;
    }
    
    public void Student.setAuditUserId(Staff auditUserId) {
        this.auditUserId = auditUserId;
    }
    
    public School Student.getSchoolId() {
        return schoolId;
    }
    
    public void Student.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public City Student.getCityId() {
        return cityId;
    }
    
    public void Student.setCityId(City cityId) {
        this.cityId = cityId;
    }
    
    public State Student.getStateId() {
        return stateId;
    }
    
    public void Student.setStateId(State stateId) {
        this.stateId = stateId;
    }
    
    public Country Student.getCountryId() {
        return countryId;
    }
    
    public void Student.setCountryId(Country countryId) {
        this.countryId = countryId;
    }
    
    public SchoolClassSection Student.getSchoolClassSectionId() {
        return schoolClassSectionId;
    }
    
    public void Student.setSchoolClassSectionId(SchoolClassSection schoolClassSectionId) {
        this.schoolClassSectionId = schoolClassSectionId;
    }
    
    public Gender Student.getGenderId() {
        return genderId;
    }
    
    public void Student.setGenderId(Gender genderId) {
        this.genderId = genderId;
    }
    
    public BloodGroup Student.getBloodGroupId() {
        return bloodGroupId;
    }
    
    public void Student.setBloodGroupId(BloodGroup bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
    }
    
    public SchoolGroup Student.getSchoolGroupId() {
        return schoolGroupId;
    }
    
    public void Student.setSchoolGroupId(SchoolGroup schoolGroupId) {
        this.schoolGroupId = schoolGroupId;
    }
    
    public Language Student.getMotherTongueId() {
        return motherTongueId;
    }
    
    public void Student.setMotherTongueId(Language motherTongueId) {
        this.motherTongueId = motherTongueId;
    }
    
    public Caste Student.getCasteId() {
        return casteId;
    }
    
    public void Student.setCasteId(Caste casteId) {
        this.casteId = casteId;
    }
    
    public Religion Student.getReligionId() {
        return religionId;
    }
    
    public void Student.setReligionId(Religion religionId) {
        this.religionId = religionId;
    }
    
    public SchoolAcademic Student.getSchoolAcademicYearId() {
        return schoolAcademicYearId;
    }
    
    public void Student.setSchoolAcademicYearId(SchoolAcademic schoolAcademicYearId) {
        this.schoolAcademicYearId = schoolAcademicYearId;
    }
    
    public String Student.getFirstName() {
        return firstName;
    }
    
    public void Student.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Student.getMiddleName() {
        return middleName;
    }
    
    public void Student.setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    
    public String Student.getLastName() {
        return lastName;
    }
    
    public void Student.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String Student.getInitial() {
        return initial;
    }
    
    public void Student.setInitial(String initial) {
        this.initial = initial;
    }
    
    public Date Student.getDob() {
        return dob;
    }
    
    public void Student.setDob(Date dob) {
        this.dob = dob;
    }
    
    public Date Student.getAdmissionDate() {
        return admissionDate;
    }
    
    public void Student.setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }
    
    public String Student.getAdmissionNo() {
        return admissionNo;
    }
    
    public void Student.setAdmissionNo(String admissionNo) {
        this.admissionNo = admissionNo;
    }
    
    public String Student.getStudentPhotoUrl() {
        return studentPhotoUrl;
    }
    
    public void Student.setStudentPhotoUrl(String studentPhotoUrl) {
        this.studentPhotoUrl = studentPhotoUrl;
    }
    
    public String Student.getIdentificationMark() {
        return identificationMark;
    }
    
    public void Student.setIdentificationMark(String identificationMark) {
        this.identificationMark = identificationMark;
    }
    
    public String Student.getFatherName() {
        return fatherName;
    }
    
    public void Student.setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }
    
    public String Student.getMotherName() {
        return motherName;
    }
    
    public void Student.setMotherName(String motherName) {
        this.motherName = motherName;
    }
    
    public String Student.getFatherOccupation() {
        return fatherOccupation;
    }
    
    public void Student.setFatherOccupation(String fatherOccupation) {
        this.fatherOccupation = fatherOccupation;
    }
    
    public String Student.getMotherOccupation() {
        return motherOccupation;
    }
    
    public void Student.setMotherOccupation(String motherOccupation) {
        this.motherOccupation = motherOccupation;
    }
    
    public String Student.getFatherMobile() {
        return fatherMobile;
    }
    
    public void Student.setFatherMobile(String fatherMobile) {
        this.fatherMobile = fatherMobile;
    }
    
    public String Student.getMotherMobile() {
        return motherMobile;
    }
    
    public void Student.setMotherMobile(String motherMobile) {
        this.motherMobile = motherMobile;
    }
    
    public String Student.getFatherEmail() {
        return fatherEmail;
    }
    
    public void Student.setFatherEmail(String fatherEmail) {
        this.fatherEmail = fatherEmail;
    }
    
    public String Student.getMotherEmail() {
        return motherEmail;
    }
    
    public void Student.setMotherEmail(String motherEmail) {
        this.motherEmail = motherEmail;
    }
    
    public String Student.getAddress() {
        return address;
    }
    
    public void Student.setAddress(String address) {
        this.address = address;
    }
    
    public String Student.getLandmark() {
        return landmark;
    }
    
    public void Student.setLandmark(String landmark) {
        this.landmark = landmark;
    }
    
    public Integer Student.getDistrictId() {
        return districtId;
    }
    
    public void Student.setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }
    
    public String Student.getPincode() {
        return pincode;
    }
    
    public void Student.setPincode(String pincode) {
        this.pincode = pincode;
    }
    
    public String Student.getUsername() {
        return username;
    }
    
    public void Student.setUsername(String username) {
        this.username = username;
    }
    
    public String Student.getPassword() {
        return password;
    }
    
    public void Student.setPassword(String password) {
        this.password = password;
    }
    
    public Calendar Student.getAuditCreatedDtTime() {
        return auditCreatedDtTime;
    }
    
    public void Student.setAuditCreatedDtTime(Calendar auditCreatedDtTime) {
        this.auditCreatedDtTime = auditCreatedDtTime;
    }
    
    public Calendar Student.getAuditModifiedDtTime() {
        return auditModifiedDtTime;
    }
    
    public void Student.setAuditModifiedDtTime(Calendar auditModifiedDtTime) {
        this.auditModifiedDtTime = auditModifiedDtTime;
    }
    
}