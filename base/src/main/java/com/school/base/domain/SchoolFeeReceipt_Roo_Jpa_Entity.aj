// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolFeeReceipt;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect SchoolFeeReceipt_Roo_Jpa_Entity {
    
    declare @type: SchoolFeeReceipt: @Entity;
    
    declare @type: SchoolFeeReceipt: @Table(name = "school_fee_receipt");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SCHOOL_FEE_RECEIPT_ID")
    private Long SchoolFeeReceipt.schoolFeeReceiptId;
    
    public Long SchoolFeeReceipt.getSchoolFeeReceiptId() {
        return this.schoolFeeReceiptId;
    }
    
    public void SchoolFeeReceipt.setSchoolFeeReceiptId(Long id) {
        this.schoolFeeReceiptId = id;
    }
    
}
