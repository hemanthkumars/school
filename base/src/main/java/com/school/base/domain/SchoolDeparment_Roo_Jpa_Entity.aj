// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolDeparment;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect SchoolDeparment_Roo_Jpa_Entity {
    
    declare @type: SchoolDeparment: @Entity;
    
    declare @type: SchoolDeparment: @Table(name = "school_deparment");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SCHOOL_DEPARMENT_ID")
    private Integer SchoolDeparment.schoolDeparmentId;
    
    public Integer SchoolDeparment.getSchoolDeparmentId() {
        return this.schoolDeparmentId;
    }
    
    public void SchoolDeparment.setSchoolDeparmentId(Integer id) {
        this.schoolDeparmentId = id;
    }
    
}
