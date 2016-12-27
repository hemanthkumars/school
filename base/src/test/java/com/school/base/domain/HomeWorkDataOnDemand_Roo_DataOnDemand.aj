// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.HomeWork;
import com.school.base.domain.HomeWorkDataOnDemand;
import com.school.base.domain.HomeWorkType;
import com.school.base.domain.HomeWorkTypeDataOnDemand;
import com.school.base.domain.PriorityDataOnDemand;
import com.school.base.domain.SchoolAcademicDataOnDemand;
import com.school.base.domain.SchoolClassSection;
import com.school.base.domain.SchoolClassSectionDataOnDemand;
import com.school.base.domain.StaffDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect HomeWorkDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HomeWorkDataOnDemand: @Component;
    
    private Random HomeWorkDataOnDemand.rnd = new SecureRandom();
    
    private List<HomeWork> HomeWorkDataOnDemand.data;
    
    @Autowired
    HomeWorkTypeDataOnDemand HomeWorkDataOnDemand.homeWorkTypeDataOnDemand;
    
    @Autowired
    PriorityDataOnDemand HomeWorkDataOnDemand.priorityDataOnDemand;
    
    @Autowired
    SchoolAcademicDataOnDemand HomeWorkDataOnDemand.schoolAcademicDataOnDemand;
    
    @Autowired
    SchoolClassSectionDataOnDemand HomeWorkDataOnDemand.schoolClassSectionDataOnDemand;
    
    @Autowired
    StaffDataOnDemand HomeWorkDataOnDemand.staffDataOnDemand;
    
    public HomeWork HomeWorkDataOnDemand.getNewTransientHomeWork(int index) {
        HomeWork obj = new HomeWork();
        setDescription(obj, index);
        setDueDate(obj, index);
        setHomeWorkTypeId(obj, index);
        setSchoolClassSectionId(obj, index);
        return obj;
    }
    
    public void HomeWorkDataOnDemand.setDescription(HomeWork obj, int index) {
        String description = "description_" + index;
        if (description.length() > 500) {
            description = description.substring(0, 500);
        }
        obj.setDescription(description);
    }
    
    public void HomeWorkDataOnDemand.setDueDate(HomeWork obj, int index) {
        Date dueDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDueDate(dueDate);
    }
    
    public void HomeWorkDataOnDemand.setHomeWorkTypeId(HomeWork obj, int index) {
        HomeWorkType homeWorkTypeId = homeWorkTypeDataOnDemand.getRandomHomeWorkType();
        obj.setHomeWorkTypeId(homeWorkTypeId);
    }
    
    public void HomeWorkDataOnDemand.setSchoolClassSectionId(HomeWork obj, int index) {
        SchoolClassSection schoolClassSectionId = schoolClassSectionDataOnDemand.getRandomSchoolClassSection();
        obj.setSchoolClassSectionId(schoolClassSectionId);
    }
    
    public HomeWork HomeWorkDataOnDemand.getSpecificHomeWork(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        HomeWork obj = data.get(index);
        Integer id = obj.getHomeWorkId();
        return HomeWork.findHomeWork(id);
    }
    
    public HomeWork HomeWorkDataOnDemand.getRandomHomeWork() {
        init();
        HomeWork obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getHomeWorkId();
        return HomeWork.findHomeWork(id);
    }
    
    public boolean HomeWorkDataOnDemand.modifyHomeWork(HomeWork obj) {
        return false;
    }
    
    public void HomeWorkDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = HomeWork.findHomeWorkEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'HomeWork' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<HomeWork>();
        for (int i = 0; i < 10; i++) {
            HomeWork obj = getNewTransientHomeWork(i);
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