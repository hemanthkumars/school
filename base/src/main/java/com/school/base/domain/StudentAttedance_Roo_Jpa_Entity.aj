// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.StudentAttedance;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect StudentAttedance_Roo_Jpa_Entity {
    
    declare @type: StudentAttedance: @Entity;
    
    declare @type: StudentAttedance: @Table(name = "student_attedance");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "STUDENT_ATTENDANCE_ID")
    private Long StudentAttedance.studentAttendanceId;
    
    public Long StudentAttedance.getStudentAttendanceId() {
        return this.studentAttendanceId;
    }
    
    public void StudentAttedance.setStudentAttendanceId(Long id) {
        this.studentAttendanceId = id;
    }
    
}
