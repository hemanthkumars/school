// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ClassExamination;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect ClassExamination_Roo_Jpa_Entity {
    
    declare @type: ClassExamination: @Entity;
    
    declare @type: ClassExamination: @Table(name = "class_examination");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CLASS_EXAMINATION_ID")
    private Integer ClassExamination.classExaminationId;
    
    public Integer ClassExamination.getClassExaminationId() {
        return this.classExaminationId;
    }
    
    public void ClassExamination.setClassExaminationId(Integer id) {
        this.classExaminationId = id;
    }
    
}