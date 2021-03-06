// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolSession;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect SchoolSession_Roo_Jpa_Entity {
    
    declare @type: SchoolSession: @Entity;
    
    declare @type: SchoolSession: @Table(name = "school_session");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SCHOOL_SESSION_ID")
    private Integer SchoolSession.schoolSessionId;
    
    public Integer SchoolSession.getSchoolSessionId() {
        return this.schoolSessionId;
    }
    
    public void SchoolSession.setSchoolSessionId(Integer id) {
        this.schoolSessionId = id;
    }
    
}
