// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.AcademicYear;
import com.school.base.domain.AcademicYearDataOnDemand;
import com.school.base.domain.School;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolAcademicDataOnDemand;
import com.school.base.domain.SchoolDataOnDemand;
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

privileged aspect SchoolAcademicDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SchoolAcademicDataOnDemand: @Component;
    
    private Random SchoolAcademicDataOnDemand.rnd = new SecureRandom();
    
    private List<SchoolAcademic> SchoolAcademicDataOnDemand.data;
    
    @Autowired
    AcademicYearDataOnDemand SchoolAcademicDataOnDemand.academicYearDataOnDemand;
    
    @Autowired
    SchoolDataOnDemand SchoolAcademicDataOnDemand.schoolDataOnDemand;
    
    public SchoolAcademic SchoolAcademicDataOnDemand.getNewTransientSchoolAcademic(int index) {
        SchoolAcademic obj = new SchoolAcademic();
        setAcademicYearId(obj, index);
        setCurrentYearMark(obj, index);
        setEndDate(obj, index);
        setSchoolId(obj, index);
        setStartDate(obj, index);
        return obj;
    }
    
    public void SchoolAcademicDataOnDemand.setAcademicYearId(SchoolAcademic obj, int index) {
        AcademicYear academicYearId = academicYearDataOnDemand.getRandomAcademicYear();
        obj.setAcademicYearId(academicYearId);
    }
    
    public void SchoolAcademicDataOnDemand.setCurrentYearMark(SchoolAcademic obj, int index) {
        Integer currentYearMark = new Integer(index);
        obj.setCurrentYearMark(currentYearMark);
    }
    
    public void SchoolAcademicDataOnDemand.setEndDate(SchoolAcademic obj, int index) {
        Date endDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDate(endDate);
    }
    
    public void SchoolAcademicDataOnDemand.setSchoolId(SchoolAcademic obj, int index) {
        School schoolId = schoolDataOnDemand.getRandomSchool();
        obj.setSchoolId(schoolId);
    }
    
    public void SchoolAcademicDataOnDemand.setStartDate(SchoolAcademic obj, int index) {
        Date startDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDate(startDate);
    }
    
    public SchoolAcademic SchoolAcademicDataOnDemand.getSpecificSchoolAcademic(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SchoolAcademic obj = data.get(index);
        Integer id = obj.getSchoolAcademicYearId();
        return SchoolAcademic.findSchoolAcademic(id);
    }
    
    public SchoolAcademic SchoolAcademicDataOnDemand.getRandomSchoolAcademic() {
        init();
        SchoolAcademic obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getSchoolAcademicYearId();
        return SchoolAcademic.findSchoolAcademic(id);
    }
    
    public boolean SchoolAcademicDataOnDemand.modifySchoolAcademic(SchoolAcademic obj) {
        return false;
    }
    
    public void SchoolAcademicDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SchoolAcademic.findSchoolAcademicEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SchoolAcademic' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SchoolAcademic>();
        for (int i = 0; i < 10; i++) {
            SchoolAcademic obj = getNewTransientSchoolAcademic(i);
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