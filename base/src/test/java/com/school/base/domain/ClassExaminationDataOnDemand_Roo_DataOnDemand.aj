// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ClassExamination;
import com.school.base.domain.ClassExaminationDataOnDemand;
import com.school.base.domain.Examination;
import com.school.base.domain.ExaminationDataOnDemand;
import com.school.base.domain.SchoolAcademic;
import com.school.base.domain.SchoolAcademicDataOnDemand;
import com.school.base.domain.SchoolClass;
import com.school.base.domain.SchoolClassDataOnDemand;
import com.school.base.domain.SchoolSubject;
import com.school.base.domain.SchoolSubjectDataOnDemand;
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

privileged aspect ClassExaminationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ClassExaminationDataOnDemand: @Component;
    
    private Random ClassExaminationDataOnDemand.rnd = new SecureRandom();
    
    private List<ClassExamination> ClassExaminationDataOnDemand.data;
    
    @Autowired
    StaffDataOnDemand ClassExaminationDataOnDemand.staffDataOnDemand;
    
    @Autowired
    ExaminationDataOnDemand ClassExaminationDataOnDemand.examinationDataOnDemand;
    
    @Autowired
    SchoolAcademicDataOnDemand ClassExaminationDataOnDemand.schoolAcademicDataOnDemand;
    
    @Autowired
    SchoolClassDataOnDemand ClassExaminationDataOnDemand.schoolClassDataOnDemand;
    
    @Autowired
    SchoolSubjectDataOnDemand ClassExaminationDataOnDemand.schoolSubjectDataOnDemand;
    
    public ClassExamination ClassExaminationDataOnDemand.getNewTransientClassExamination(int index) {
        ClassExamination obj = new ClassExamination();
        setAuditCreatedDtTime(obj, index);
        setAuditModifiedDtTime(obj, index);
        setExamDate(obj, index);
        setExamSession(obj, index);
        setExamTimings(obj, index);
        setExaminationId(obj, index);
        setMaxMarks(obj, index);
        setMinMarks(obj, index);
        setSchoolAcademicYearId(obj, index);
        setSchoolClassId(obj, index);
        setSchoolSubjectId(obj, index);
        return obj;
    }
    
    public void ClassExaminationDataOnDemand.setAuditCreatedDtTime(ClassExamination obj, int index) {
        Integer auditCreatedDtTime = new Integer(index);
        obj.setAuditCreatedDtTime(auditCreatedDtTime);
    }
    
    public void ClassExaminationDataOnDemand.setAuditModifiedDtTime(ClassExamination obj, int index) {
        Integer auditModifiedDtTime = new Integer(index);
        obj.setAuditModifiedDtTime(auditModifiedDtTime);
    }
    
    public void ClassExaminationDataOnDemand.setExamDate(ClassExamination obj, int index) {
        Date examDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setExamDate(examDate);
    }
    
    public void ClassExaminationDataOnDemand.setExamSession(ClassExamination obj, int index) {
        String examSession = "examSession_" + index;
        if (examSession.length() > 255) {
            examSession = examSession.substring(0, 255);
        }
        obj.setExamSession(examSession);
    }
    
    public void ClassExaminationDataOnDemand.setExamTimings(ClassExamination obj, int index) {
        String examTimings = "examTimings_" + index;
        if (examTimings.length() > 255) {
            examTimings = examTimings.substring(0, 255);
        }
        obj.setExamTimings(examTimings);
    }
    
    public void ClassExaminationDataOnDemand.setExaminationId(ClassExamination obj, int index) {
        Examination examinationId = examinationDataOnDemand.getRandomExamination();
        obj.setExaminationId(examinationId);
    }
    
    public void ClassExaminationDataOnDemand.setMaxMarks(ClassExamination obj, int index) {
        Integer maxMarks = new Integer(index);
        obj.setMaxMarks(maxMarks);
    }
    
    public void ClassExaminationDataOnDemand.setMinMarks(ClassExamination obj, int index) {
        Integer minMarks = new Integer(index);
        obj.setMinMarks(minMarks);
    }
    
    public void ClassExaminationDataOnDemand.setSchoolAcademicYearId(ClassExamination obj, int index) {
        SchoolAcademic schoolAcademicYearId = schoolAcademicDataOnDemand.getRandomSchoolAcademic();
        obj.setSchoolAcademicYearId(schoolAcademicYearId);
    }
    
    public void ClassExaminationDataOnDemand.setSchoolClassId(ClassExamination obj, int index) {
        SchoolClass schoolClassId = schoolClassDataOnDemand.getRandomSchoolClass();
        obj.setSchoolClassId(schoolClassId);
    }
    
    public void ClassExaminationDataOnDemand.setSchoolSubjectId(ClassExamination obj, int index) {
        SchoolSubject schoolSubjectId = schoolSubjectDataOnDemand.getRandomSchoolSubject();
        obj.setSchoolSubjectId(schoolSubjectId);
    }
    
    public ClassExamination ClassExaminationDataOnDemand.getSpecificClassExamination(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ClassExamination obj = data.get(index);
        Integer id = obj.getClassExaminationId();
        return ClassExamination.findClassExamination(id);
    }
    
    public ClassExamination ClassExaminationDataOnDemand.getRandomClassExamination() {
        init();
        ClassExamination obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getClassExaminationId();
        return ClassExamination.findClassExamination(id);
    }
    
    public boolean ClassExaminationDataOnDemand.modifyClassExamination(ClassExamination obj) {
        return false;
    }
    
    public void ClassExaminationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ClassExamination.findClassExaminationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ClassExamination' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ClassExamination>();
        for (int i = 0; i < 10; i++) {
            ClassExamination obj = getNewTransientClassExamination(i);
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