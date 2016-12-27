// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.LeaveRegister;
import com.school.base.domain.LeaveRegisterDataOnDemand;
import com.school.base.domain.LeaveStatusDataOnDemand;
import com.school.base.domain.LeaveType;
import com.school.base.domain.LeaveTypeDataOnDemand;
import com.school.base.domain.SchoolSession;
import com.school.base.domain.SchoolSessionDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LeaveRegisterDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LeaveRegisterDataOnDemand: @Component;
    
    private Random LeaveRegisterDataOnDemand.rnd = new SecureRandom();
    
    private List<LeaveRegister> LeaveRegisterDataOnDemand.data;
    
    @Autowired
    LeaveStatusDataOnDemand LeaveRegisterDataOnDemand.leaveStatusDataOnDemand;
    
    @Autowired
    LeaveTypeDataOnDemand LeaveRegisterDataOnDemand.leaveTypeDataOnDemand;
    
    @Autowired
    SchoolSessionDataOnDemand LeaveRegisterDataOnDemand.schoolSessionDataOnDemand;
    
    public LeaveRegister LeaveRegisterDataOnDemand.getNewTransientLeaveRegister(int index) {
        LeaveRegister obj = new LeaveRegister();
        setLeaveDate(obj, index);
        setLeaveReason(obj, index);
        setLeaveTypeId(obj, index);
        setLeaveWhomId(obj, index);
        setSchoolSessionId(obj, index);
        return obj;
    }
    
    public void LeaveRegisterDataOnDemand.setLeaveDate(LeaveRegister obj, int index) {
        Integer leaveDate = new Integer(index);
        obj.setLeaveDate(leaveDate);
    }
    
    public void LeaveRegisterDataOnDemand.setLeaveReason(LeaveRegister obj, int index) {
        String leaveReason = "leaveReason_" + index;
        if (leaveReason.length() > 300) {
            leaveReason = leaveReason.substring(0, 300);
        }
        obj.setLeaveReason(leaveReason);
    }
    
    public void LeaveRegisterDataOnDemand.setLeaveTypeId(LeaveRegister obj, int index) {
        LeaveType leaveTypeId = leaveTypeDataOnDemand.getRandomLeaveType();
        obj.setLeaveTypeId(leaveTypeId);
    }
    
    public void LeaveRegisterDataOnDemand.setLeaveWhomId(LeaveRegister obj, int index) {
        Integer leaveWhomId = new Integer(index);
        obj.setLeaveWhomId(leaveWhomId);
    }
    
    public void LeaveRegisterDataOnDemand.setSchoolSessionId(LeaveRegister obj, int index) {
        SchoolSession schoolSessionId = schoolSessionDataOnDemand.getRandomSchoolSession();
        obj.setSchoolSessionId(schoolSessionId);
    }
    
    public LeaveRegister LeaveRegisterDataOnDemand.getSpecificLeaveRegister(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LeaveRegister obj = data.get(index);
        Integer id = obj.getLeaveRegisterId();
        return LeaveRegister.findLeaveRegister(id);
    }
    
    public LeaveRegister LeaveRegisterDataOnDemand.getRandomLeaveRegister() {
        init();
        LeaveRegister obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getLeaveRegisterId();
        return LeaveRegister.findLeaveRegister(id);
    }
    
    public boolean LeaveRegisterDataOnDemand.modifyLeaveRegister(LeaveRegister obj) {
        return false;
    }
    
    public void LeaveRegisterDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LeaveRegister.findLeaveRegisterEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LeaveRegister' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LeaveRegister>();
        for (int i = 0; i < 10; i++) {
            LeaveRegister obj = getNewTransientLeaveRegister(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}