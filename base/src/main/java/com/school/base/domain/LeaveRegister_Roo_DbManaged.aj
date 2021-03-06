// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.LeaveRegister;
import com.school.base.domain.LeaveStatus;
import com.school.base.domain.LeaveType;
import com.school.base.domain.SchoolSession;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

privileged aspect LeaveRegister_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "LEAVE_STATUS_ID", referencedColumnName = "LEAVE_STATUS")
    private LeaveStatus LeaveRegister.leaveStatusId;
    
    @ManyToOne
    @JoinColumn(name = "LEAVE_TYPE_ID", referencedColumnName = "LEAVE_TYPE_ID", nullable = false)
    private LeaveType LeaveRegister.leaveTypeId;
    
    @ManyToOne
    @JoinColumn(name = "SCHOOL_SESSION_ID", referencedColumnName = "SCHOOL_SESSION_ID", nullable = false)
    private SchoolSession LeaveRegister.schoolSessionId;
    
    @Column(name = "LEAVE_WHOM_ID")
    @NotNull
    private Integer LeaveRegister.leaveWhomId;
    
   
    
    @Column(name = "LEAVE_REASON", length = 300)
    private String LeaveRegister.leaveReason;
    
    public LeaveStatus LeaveRegister.getLeaveStatusId() {
        return leaveStatusId;
    }
    
    public void LeaveRegister.setLeaveStatusId(LeaveStatus leaveStatusId) {
        this.leaveStatusId = leaveStatusId;
    }
    
    public LeaveType LeaveRegister.getLeaveTypeId() {
        return leaveTypeId;
    }
    
    public void LeaveRegister.setLeaveTypeId(LeaveType leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }
    
    public SchoolSession LeaveRegister.getSchoolSessionId() {
        return schoolSessionId;
    }
    
    public void LeaveRegister.setSchoolSessionId(SchoolSession schoolSessionId) {
        this.schoolSessionId = schoolSessionId;
    }
    
    public Integer LeaveRegister.getLeaveWhomId() {
        return leaveWhomId;
    }
    
    public void LeaveRegister.setLeaveWhomId(Integer leaveWhomId) {
        this.leaveWhomId = leaveWhomId;
    }
    
    public String LeaveRegister.getLeaveReason() {
        return leaveReason;
    }
    
    public void LeaveRegister.setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason;
    }
    
}
