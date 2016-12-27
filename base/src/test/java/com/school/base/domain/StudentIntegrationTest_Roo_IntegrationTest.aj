// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Student;
import com.school.base.domain.StudentDataOnDemand;
import com.school.base.domain.StudentIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StudentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudentIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudentIntegrationTest: @Transactional;
    
    @Autowired
    StudentDataOnDemand StudentIntegrationTest.dod;
    
    @Test
    public void StudentIntegrationTest.testCountStudents() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = Student.countStudents();
        Assert.assertTrue("Counter for 'Student' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudentIntegrationTest.testFindStudent() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Integer id = obj.getStudentId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = Student.findStudent(id);
        Assert.assertNotNull("Find method for 'Student' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Student' returned the incorrect identifier", id, obj.getStudentId());
    }
    
    @Test
    public void StudentIntegrationTest.testFindAllStudents() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = Student.countStudents();
        Assert.assertTrue("Too expensive to perform a find all test for 'Student', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Student> result = Student.findAllStudents();
        Assert.assertNotNull("Find all method for 'Student' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Student' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudentIntegrationTest.testFindStudentEntries() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = Student.countStudents();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Student> result = Student.findStudentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Student' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Student' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudentIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        Student obj = dod.getNewTransientStudent(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Student' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Student' identifier to be null", obj.getStudentId());
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
        Assert.assertNotNull("Expected 'Student' identifier to no longer be null", obj.getStudentId());
    }
    
    @Test
    public void StudentIntegrationTest.testRemove() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Integer id = obj.getStudentId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = Student.findStudent(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Student' with identifier '" + id + "'", Student.findStudent(id));
    }
    
}