// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Language;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Language_Roo_Jpa_Entity {
    
    declare @type: Language: @Entity;
    
    declare @type: Language: @Table(name = "language");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "LANGUAGE_ID")
    private Integer Language.languageId;
    
    public Integer Language.getLanguageId() {
        return this.languageId;
    }
    
    public void Language.setLanguageId(Integer id) {
        this.languageId = id;
    }
    
}
