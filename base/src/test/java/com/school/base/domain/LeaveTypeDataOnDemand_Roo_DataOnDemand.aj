// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.LeaveType;
import com.school.base.domain.LeaveTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect LeaveTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LeaveTypeDataOnDemand: @Component;
    
    private Random LeaveTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<LeaveType> LeaveTypeDataOnDemand.data;
    
    public LeaveType LeaveTypeDataOnDemand.getNewTransientLeaveType(int index) {
        LeaveType obj = new LeaveType();
        setLeaveType(obj, index);
        return obj;
    }
    
    public void LeaveTypeDataOnDemand.setLeaveType(LeaveType obj, int index) {
        String leaveType = "leaveType_" + index;
        if (leaveType.length() > 255) {
            leaveType = leaveType.substring(0, 255);
        }
        obj.setLeaveType(leaveType);
    }
    
    public LeaveType LeaveTypeDataOnDemand.getSpecificLeaveType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LeaveType obj = data.get(index);
        Integer id = obj.getLeaveTypeId();
        return LeaveType.findLeaveType(id);
    }
    
    public LeaveType LeaveTypeDataOnDemand.getRandomLeaveType() {
        init();
        LeaveType obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getLeaveTypeId();
        return LeaveType.findLeaveType(id);
    }
    
    public boolean LeaveTypeDataOnDemand.modifyLeaveType(LeaveType obj) {
        return false;
    }
    
    public void LeaveTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LeaveType.findLeaveTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LeaveType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LeaveType>();
        for (int i = 0; i < 10; i++) {
            LeaveType obj = getNewTransientLeaveType(i);
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