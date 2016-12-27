// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.BloodGroup;
import com.school.base.domain.Caste;
import com.school.base.domain.City;
import com.school.base.domain.ClassExamination;
import com.school.base.domain.Country;
import com.school.base.domain.Department;
import com.school.base.domain.Gender;
import com.school.base.domain.HomeWork;
import com.school.base.domain.Language;
import com.school.base.domain.Postion;
import com.school.base.domain.Religion;
import com.school.base.domain.School;
import com.school.base.domain.SchoolClassSection;
import com.school.base.domain.SchoolFee;
import com.school.base.domain.SchoolFeeReceipt;
import com.school.base.domain.SchoolHoliday;
import com.school.base.domain.SchoolLogin;
import com.school.base.domain.Sms;
import com.school.base.domain.Staff;
import com.school.base.domain.StaffAttendance;
import com.school.base.domain.State;
import com.school.base.domain.Student;
import com.school.base.domain.StudentAttedance;
import com.school.base.domain.StudentExamination;
import com.school.base.domain.SubjectStaffClass;
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

privileged aspect Staff_Roo_DbManaged {
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditCreatedId")
    private Set<ClassExamination> Staff.classExaminations;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "staffId")
    private Set<HomeWork> Staff.homeWorks;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "classTeacherId")
    private Set<SchoolClassSection> Staff.schoolClassSections;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<SchoolFee> Staff.schoolFees;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<SchoolFeeReceipt> Staff.schoolFeeReceipts;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<SchoolHoliday> Staff.schoolHolidays;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "staffId")
    private Set<SchoolLogin> Staff.schoolLogins;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "staffId")
    private Set<Sms> Staff.smss;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<Sms> Staff.smss1;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auiditUserId")
    private Set<Staff> Staff.staffs;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<StaffAttendance> Staff.staffAttendances;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "staffId")
    private Set<StaffAttendance> Staff.staffAttendances1;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<Student> Staff.students;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<StudentAttedance> Staff.studentAttedances;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "auditUserId")
    private Set<StudentExamination> Staff.studentExaminations;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy = "staffId")
    private Set<SubjectStaffClass> Staff.subjectStaffClasses;
    
    @ManyToOne
    @JoinColumn(name = "AUIDIT_USER_ID", referencedColumnName = "STAFF_ID", insertable = false, updatable = false)
    private Staff Staff.auiditUserId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID", nullable = false)
    private School Staff.schoolId;
    
    @ManyToOne
    @JoinColumn(name = "STATE_ID", referencedColumnName = "STATE_ID")
    private State Staff.stateId;
    
    @ManyToOne
    @JoinColumn(name = "COUNTRY_ID", referencedColumnName = "COUNTRY_ID", insertable = false, updatable = false)
    private Country Staff.countryId;
    
    @ManyToOne
    @JoinColumn(name = "RELIGION_ID", referencedColumnName = "RELIGION_ID")
    private Religion Staff.religionId;
    
    @ManyToOne
    @JoinColumn(name = "BLOOD_GROUP_ID", referencedColumnName = "BLOOD_GROUP_ID")
    private BloodGroup Staff.bloodGroupId;
    
    @ManyToOne
    @JoinColumn(name = "GENDER_ID", referencedColumnName = "GENDER_ID")
    private Gender Staff.genderId;
    
    @ManyToOne
    @JoinColumn(name = "MOTHER_TONGUE_ID", referencedColumnName = "LANGUAGE_ID")
    private Language Staff.motherTongueId;
    
    @ManyToOne
    @JoinColumn(name = "CASTE_ID", referencedColumnName = "CASTE_ID")
    private Caste Staff.casteId;
    
    @ManyToOne
    @JoinColumn(name = "DEPARTMENT_ID", referencedColumnName = "DEPARTMENT_ID")
    private Department Staff.departmentId;
    
    @ManyToOne
    @JoinColumn(name = "POSITION_ID", referencedColumnName = "POSTION_ID")
    private Postion Staff.positionId;
    
    @ManyToOne
    @JoinColumn(name = "CITY_ID", referencedColumnName = "CITY_ID")
    private City Staff.cityId;
    
    @Column(name = "STAFF_PHOTO_URL", length = 200)
    private String Staff.staffPhotoUrl;
    
    @Column(name = "FIRST_NAME", length = 200)
    private String Staff.firstName;
    
    @Column(name = "LAST_NAME", length = 200)
    private String Staff.lastName;
    
    @Column(name = "MIDDLE_NAME", length = 200)
    private String Staff.middleName;
    
    @Column(name = "INITIAL", length = 20)
    private String Staff.initial;
    
    @Column(name = "DOJ")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Staff.doj;
    
    @Column(name = "DOB")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Staff.dob;
    
    @Column(name = "JOB_TITLE", length = 200)
    private String Staff.jobTitle;
    
    @Column(name = "QUALIFICATION", length = 200)
    private String Staff.qualification;
    
    @Column(name = "EXPERIENCE_INFO", length = 500)
    private String Staff.experienceInfo;
    
    @Column(name = "TOTAL_YEAS_EXP", length = 20)
    private String Staff.totalYeasExp;
    
    @Column(name = "FATHER_NAME", length = 200)
    private String Staff.fatherName;
    
    @Column(name = "MOTHER_NAME", length = 200)
    private String Staff.motherName;
    
    @Column(name = "MOBILE_NO", length = 100)
    private String Staff.mobileNo;
    
    @Column(name = "PHONE_NO", length = 100)
    private String Staff.phoneNo;
    
    @Column(name = "EMAIL_ID", length = 200)
    private String Staff.emailId;
    
    @Column(name = "ADDRESS", length = 255)
    private String Staff.address;
    
    @Column(name = "LANDMARK", length = 100)
    private String Staff.landmark;
    
    @Column(name = "PINCODE", length = 20)
    private String Staff.pincode;
    
    @Column(name = "STAFF_ID_PROOF_IMAGE_URL", length = 100)
    private String Staff.staffIdProofImageUrl;
    
    public Set<ClassExamination> Staff.getClassExaminations() {
        return classExaminations;
    }
    
    public void Staff.setClassExaminations(Set<ClassExamination> classExaminations) {
        this.classExaminations = classExaminations;
    }
    
    public Set<HomeWork> Staff.getHomeWorks() {
        return homeWorks;
    }
    
    public void Staff.setHomeWorks(Set<HomeWork> homeWorks) {
        this.homeWorks = homeWorks;
    }
    
    public Set<SchoolClassSection> Staff.getSchoolClassSections() {
        return schoolClassSections;
    }
    
    public void Staff.setSchoolClassSections(Set<SchoolClassSection> schoolClassSections) {
        this.schoolClassSections = schoolClassSections;
    }
    
    public Set<SchoolFee> Staff.getSchoolFees() {
        return schoolFees;
    }
    
    public void Staff.setSchoolFees(Set<SchoolFee> schoolFees) {
        this.schoolFees = schoolFees;
    }
    
    public Set<SchoolFeeReceipt> Staff.getSchoolFeeReceipts() {
        return schoolFeeReceipts;
    }
    
    public void Staff.setSchoolFeeReceipts(Set<SchoolFeeReceipt> schoolFeeReceipts) {
        this.schoolFeeReceipts = schoolFeeReceipts;
    }
    
    public Set<SchoolHoliday> Staff.getSchoolHolidays() {
        return schoolHolidays;
    }
    
    public void Staff.setSchoolHolidays(Set<SchoolHoliday> schoolHolidays) {
        this.schoolHolidays = schoolHolidays;
    }
    
    public Set<SchoolLogin> Staff.getSchoolLogins() {
        return schoolLogins;
    }
    
    public void Staff.setSchoolLogins(Set<SchoolLogin> schoolLogins) {
        this.schoolLogins = schoolLogins;
    }
    
    public Set<Sms> Staff.getSmss() {
        return smss;
    }
    
    public void Staff.setSmss(Set<Sms> smss) {
        this.smss = smss;
    }
    
    public Set<Sms> Staff.getSmss1() {
        return smss1;
    }
    
    public void Staff.setSmss1(Set<Sms> smss1) {
        this.smss1 = smss1;
    }
    
    public Set<Staff> Staff.getStaffs() {
        return staffs;
    }
    
    public void Staff.setStaffs(Set<Staff> staffs) {
        this.staffs = staffs;
    }
    
    public Set<StaffAttendance> Staff.getStaffAttendances() {
        return staffAttendances;
    }
    
    public void Staff.setStaffAttendances(Set<StaffAttendance> staffAttendances) {
        this.staffAttendances = staffAttendances;
    }
    
    public Set<StaffAttendance> Staff.getStaffAttendances1() {
        return staffAttendances1;
    }
    
    public void Staff.setStaffAttendances1(Set<StaffAttendance> staffAttendances1) {
        this.staffAttendances1 = staffAttendances1;
    }
    
    public Set<Student> Staff.getStudents() {
        return students;
    }
    
    public void Staff.setStudents(Set<Student> students) {
        this.students = students;
    }
    
    public Set<StudentAttedance> Staff.getStudentAttedances() {
        return studentAttedances;
    }
    
    public void Staff.setStudentAttedances(Set<StudentAttedance> studentAttedances) {
        this.studentAttedances = studentAttedances;
    }
    
    public Set<StudentExamination> Staff.getStudentExaminations() {
        return studentExaminations;
    }
    
    public void Staff.setStudentExaminations(Set<StudentExamination> studentExaminations) {
        this.studentExaminations = studentExaminations;
    }
    
    public Set<SubjectStaffClass> Staff.getSubjectStaffClasses() {
        return subjectStaffClasses;
    }
    
    public void Staff.setSubjectStaffClasses(Set<SubjectStaffClass> subjectStaffClasses) {
        this.subjectStaffClasses = subjectStaffClasses;
    }
    
    public Staff Staff.getAuiditUserId() {
        return auiditUserId;
    }
    
    public void Staff.setAuiditUserId(Staff auiditUserId) {
        this.auiditUserId = auiditUserId;
    }
    
    public School Staff.getSchoolId() {
        return schoolId;
    }
    
    public void Staff.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public State Staff.getStateId() {
        return stateId;
    }
    
    public void Staff.setStateId(State stateId) {
        this.stateId = stateId;
    }
    
    public Country Staff.getCountryId() {
        return countryId;
    }
    
    public void Staff.setCountryId(Country countryId) {
        this.countryId = countryId;
    }
    
    public Religion Staff.getReligionId() {
        return religionId;
    }
    
    public void Staff.setReligionId(Religion religionId) {
        this.religionId = religionId;
    }
    
    public BloodGroup Staff.getBloodGroupId() {
        return bloodGroupId;
    }
    
    public void Staff.setBloodGroupId(BloodGroup bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
    }
    
    public Gender Staff.getGenderId() {
        return genderId;
    }
    
    public void Staff.setGenderId(Gender genderId) {
        this.genderId = genderId;
    }
    
    public Language Staff.getMotherTongueId() {
        return motherTongueId;
    }
    
    public void Staff.setMotherTongueId(Language motherTongueId) {
        this.motherTongueId = motherTongueId;
    }
    
    public Caste Staff.getCasteId() {
        return casteId;
    }
    
    public void Staff.setCasteId(Caste casteId) {
        this.casteId = casteId;
    }
    
    public Department Staff.getDepartmentId() {
        return departmentId;
    }
    
    public void Staff.setDepartmentId(Department departmentId) {
        this.departmentId = departmentId;
    }
    
    public Postion Staff.getPositionId() {
        return positionId;
    }
    
    public void Staff.setPositionId(Postion positionId) {
        this.positionId = positionId;
    }
    
    public City Staff.getCityId() {
        return cityId;
    }
    
    public void Staff.setCityId(City cityId) {
        this.cityId = cityId;
    }
    
    public String Staff.getStaffPhotoUrl() {
        return staffPhotoUrl;
    }
    
    public void Staff.setStaffPhotoUrl(String staffPhotoUrl) {
        this.staffPhotoUrl = staffPhotoUrl;
    }
    
    public String Staff.getFirstName() {
        return firstName;
    }
    
    public void Staff.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Staff.getLastName() {
        return lastName;
    }
    
    public void Staff.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String Staff.getMiddleName() {
        return middleName;
    }
    
    public void Staff.setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    
    public String Staff.getInitial() {
        return initial;
    }
    
    public void Staff.setInitial(String initial) {
        this.initial = initial;
    }
    
    public Date Staff.getDoj() {
        return doj;
    }
    
    public void Staff.setDoj(Date doj) {
        this.doj = doj;
    }
    
    public Date Staff.getDob() {
        return dob;
    }
    
    public void Staff.setDob(Date dob) {
        this.dob = dob;
    }
    
    public String Staff.getJobTitle() {
        return jobTitle;
    }
    
    public void Staff.setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    
    public String Staff.getQualification() {
        return qualification;
    }
    
    public void Staff.setQualification(String qualification) {
        this.qualification = qualification;
    }
    
    public String Staff.getExperienceInfo() {
        return experienceInfo;
    }
    
    public void Staff.setExperienceInfo(String experienceInfo) {
        this.experienceInfo = experienceInfo;
    }
    
    public String Staff.getTotalYeasExp() {
        return totalYeasExp;
    }
    
    public void Staff.setTotalYeasExp(String totalYeasExp) {
        this.totalYeasExp = totalYeasExp;
    }
    
    public String Staff.getFatherName() {
        return fatherName;
    }
    
    public void Staff.setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }
    
    public String Staff.getMotherName() {
        return motherName;
    }
    
    public void Staff.setMotherName(String motherName) {
        this.motherName = motherName;
    }
    
    public String Staff.getMobileNo() {
        return mobileNo;
    }
    
    public void Staff.setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }
    
    public String Staff.getPhoneNo() {
        return phoneNo;
    }
    
    public void Staff.setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    
    public String Staff.getEmailId() {
        return emailId;
    }
    
    public void Staff.setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public String Staff.getAddress() {
        return address;
    }
    
    public void Staff.setAddress(String address) {
        this.address = address;
    }
    
    public String Staff.getLandmark() {
        return landmark;
    }
    
    public void Staff.setLandmark(String landmark) {
        this.landmark = landmark;
    }
    
    public String Staff.getPincode() {
        return pincode;
    }
    
    public void Staff.setPincode(String pincode) {
        this.pincode = pincode;
    }
    
    public String Staff.getStaffIdProofImageUrl() {
        return staffIdProofImageUrl;
    }
    
    public void Staff.setStaffIdProofImageUrl(String staffIdProofImageUrl) {
        this.staffIdProofImageUrl = staffIdProofImageUrl;
    }
    
}
