// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ClassExamination;
import com.school.base.domain.ClassExaminationDataOnDemand;
import com.school.base.domain.SchoolGradeDataOnDemand;
import com.school.base.domain.StaffDataOnDemand;
import com.school.base.domain.Student;
import com.school.base.domain.StudentDataOnDemand;
import com.school.base.domain.StudentExamination;
import com.school.base.domain.StudentExaminationDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect StudentExaminationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StudentExaminationDataOnDemand: @Component;
    
    private Random StudentExaminationDataOnDemand.rnd = new SecureRandom();
    
    private List<StudentExamination> StudentExaminationDataOnDemand.data;
    
    @Autowired
    StaffDataOnDemand StudentExaminationDataOnDemand.staffDataOnDemand;
    
    @Autowired
    ClassExaminationDataOnDemand StudentExaminationDataOnDemand.classExaminationDataOnDemand;
    
    @Autowired
    SchoolGradeDataOnDemand StudentExaminationDataOnDemand.schoolGradeDataOnDemand;
    
    @Autowired
    StudentDataOnDemand StudentExaminationDataOnDemand.studentDataOnDemand;
    
    public StudentExamination StudentExaminationDataOnDemand.getNewTransientStudentExamination(int index) {
        StudentExamination obj = new StudentExamination();
        setClassExaminationId(obj, index);
        setMarksObtained(obj, index);
        setRemarks(obj, index);
        setStudentId(obj, index);
        return obj;
    }
    
    public void StudentExaminationDataOnDemand.setClassExaminationId(StudentExamination obj, int index) {
        ClassExamination classExaminationId = classExaminationDataOnDemand.getRandomClassExamination();
        obj.setClassExaminationId(classExaminationId);
    }
    
    public void StudentExaminationDataOnDemand.setMarksObtained(StudentExamination obj, int index) {
        Integer marksObtained = new Integer(index);
        obj.setMarksObtained(marksObtained);
    }
    
    public void StudentExaminationDataOnDemand.setRemarks(StudentExamination obj, int index) {
        String remarks = "remarks_" + index;
        if (remarks.length() > 200) {
            remarks = remarks.substring(0, 200);
        }
        obj.setRemarks(remarks);
    }
    
    public void StudentExaminationDataOnDemand.setStudentId(StudentExamination obj, int index) {
        Student studentId = studentDataOnDemand.getRandomStudent();
        obj.setStudentId(studentId);
    }
    
    public StudentExamination StudentExaminationDataOnDemand.getSpecificStudentExamination(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        StudentExamination obj = data.get(index);
        Integer id = obj.getStudentExaminationId();
        return StudentExamination.findStudentExamination(id);
    }
    
    public StudentExamination StudentExaminationDataOnDemand.getRandomStudentExamination() {
        init();
        StudentExamination obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getStudentExaminationId();
        return StudentExamination.findStudentExamination(id);
    }
    
    public boolean StudentExaminationDataOnDemand.modifyStudentExamination(StudentExamination obj) {
        return false;
    }
    
    public void StudentExaminationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = StudentExamination.findStudentExaminationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'StudentExamination' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<StudentExamination>();
        for (int i = 0; i < 10; i++) {
            StudentExamination obj = getNewTransientStudentExamination(i);
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
