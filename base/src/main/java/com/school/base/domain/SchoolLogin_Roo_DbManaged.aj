// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Role;
import com.school.base.domain.School;
import com.school.base.domain.SchoolLogin;
import com.school.base.domain.Staff;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

privileged aspect SchoolLogin_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_ID", referencedColumnName = "SCHOOL_ID", nullable = false)
    private School SchoolLogin.schoolId;
    
    @ManyToOne
    @JoinColumn(name = "ROLE_ID", referencedColumnName = "ROLE_ID")
    private Role SchoolLogin.roleId;
    
    @ManyToOne
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    private Staff SchoolLogin.staffId;
    
    @Column(name = "USER_NAME", length = 100)
    @NotNull
    private String SchoolLogin.userName;
    
    @Column(name = "PASSWORD", length = 500)
    @NotNull
    private String SchoolLogin.password;
    
    @Column(name = "NO_OF_ATTEMPTS_REMAINING")
    private Integer SchoolLogin.noOfAttemptsRemaining;
    
    @Column(name = "LOGIN_STATUS_ID")
    private Integer SchoolLogin.loginStatusId;
    
    public School SchoolLogin.getSchoolId() {
        return schoolId;
    }
    
    public void SchoolLogin.setSchoolId(School schoolId) {
        this.schoolId = schoolId;
    }
    
    public Role SchoolLogin.getRoleId() {
        return roleId;
    }
    
    public void SchoolLogin.setRoleId(Role roleId) {
        this.roleId = roleId;
    }
    
    public Staff SchoolLogin.getStaffId() {
        return staffId;
    }
    
    public void SchoolLogin.setStaffId(Staff staffId) {
        this.staffId = staffId;
    }
    
    public String SchoolLogin.getUserName() {
        return userName;
    }
    
    public void SchoolLogin.setUserName(String userName) {
        this.userName = userName;
    }
    
    public String SchoolLogin.getPassword() {
        return password;
    }
    
    public void SchoolLogin.setPassword(String password) {
        this.password = password;
    }
    
    public Integer SchoolLogin.getNoOfAttemptsRemaining() {
        return noOfAttemptsRemaining;
    }
    
    public void SchoolLogin.setNoOfAttemptsRemaining(Integer noOfAttemptsRemaining) {
        this.noOfAttemptsRemaining = noOfAttemptsRemaining;
    }
    
    public Integer SchoolLogin.getLoginStatusId() {
        return loginStatusId;
    }
    
    public void SchoolLogin.setLoginStatusId(Integer loginStatusId) {
        this.loginStatusId = loginStatusId;
    }
    
}
