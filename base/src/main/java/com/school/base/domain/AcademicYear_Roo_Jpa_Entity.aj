// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.AcademicYear;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect AcademicYear_Roo_Jpa_Entity {
    
    declare @type: AcademicYear: @Entity;
    
    declare @type: AcademicYear: @Table(name = "academic_year");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ACADEMIC_YEAR_ID")
    private Integer AcademicYear.academicYearId;
    
    public Integer AcademicYear.getAcademicYearId() {
        return this.academicYearId;
    }
    
    public void AcademicYear.setAcademicYearId(Integer id) {
        this.academicYearId = id;
    }
    
}