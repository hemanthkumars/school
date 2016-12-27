// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.School;
import com.school.base.domain.SchoolDataOnDemand;
import com.school.base.domain.SchoolGroup;
import com.school.base.domain.SchoolGroupDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect SchoolGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SchoolGroupDataOnDemand: @Component;
    
    private Random SchoolGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<SchoolGroup> SchoolGroupDataOnDemand.data;
    
    @Autowired
    SchoolDataOnDemand SchoolGroupDataOnDemand.schoolDataOnDemand;
    
    public SchoolGroup SchoolGroupDataOnDemand.getNewTransientSchoolGroup(int index) {
        SchoolGroup obj = new SchoolGroup();
        setDescription(obj, index);
        setGroupCode(obj, index);
        setGroupName(obj, index);
        setPiurpose(obj, index);
        setSchoolId(obj, index);
        return obj;
    }
    
    public void SchoolGroupDataOnDemand.setDescription(SchoolGroup obj, int index) {
        String description = "description_" + index;
        if (description.length() > 300) {
            description = description.substring(0, 300);
        }
        obj.setDescription(description);
    }
    
    public void SchoolGroupDataOnDemand.setGroupCode(SchoolGroup obj, int index) {
        String groupCode = "groupCode_" + index;
        if (groupCode.length() > 100) {
            groupCode = groupCode.substring(0, 100);
        }
        obj.setGroupCode(groupCode);
    }
    
    public void SchoolGroupDataOnDemand.setGroupName(SchoolGroup obj, int index) {
        String groupName = "groupName_" + index;
        if (groupName.length() > 100) {
            groupName = groupName.substring(0, 100);
        }
        obj.setGroupName(groupName);
    }
    
    public void SchoolGroupDataOnDemand.setPiurpose(SchoolGroup obj, int index) {
        String piurpose = "piurpose_" + index;
        if (piurpose.length() > 200) {
            piurpose = piurpose.substring(0, 200);
        }
        obj.setPiurpose(piurpose);
    }
    
    public void SchoolGroupDataOnDemand.setSchoolId(SchoolGroup obj, int index) {
        School schoolId = schoolDataOnDemand.getRandomSchool();
        obj.setSchoolId(schoolId);
    }
    
    public SchoolGroup SchoolGroupDataOnDemand.getSpecificSchoolGroup(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SchoolGroup obj = data.get(index);
        Integer id = obj.getSchoolGroupId();
        return SchoolGroup.findSchoolGroup(id);
    }
    
    public SchoolGroup SchoolGroupDataOnDemand.getRandomSchoolGroup() {
        init();
        SchoolGroup obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getSchoolGroupId();
        return SchoolGroup.findSchoolGroup(id);
    }
    
    public boolean SchoolGroupDataOnDemand.modifySchoolGroup(SchoolGroup obj) {
        return false;
    }
    
    public void SchoolGroupDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SchoolGroup.findSchoolGroupEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SchoolGroup' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SchoolGroup>();
        for (int i = 0; i < 10; i++) {
            SchoolGroup obj = getNewTransientSchoolGroup(i);
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