// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.AttendanceStatus;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect AttendanceStatus_Roo_Jpa_Entity {
    
    declare @type: AttendanceStatus: @Entity;
    
    declare @type: AttendanceStatus: @Table(name = "attendance_status");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ATTENDANCE_STATUS_ID")
    private Integer AttendanceStatus.attendanceStatusId;
    
    public Integer AttendanceStatus.getAttendanceStatusId() {
        return this.attendanceStatusId;
    }
    
    public void AttendanceStatus.setAttendanceStatusId(Integer id) {
        this.attendanceStatusId = id;
    }
    
}