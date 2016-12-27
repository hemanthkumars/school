// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.StudentGroup;
import com.school.base.domain.StudentGroupDataOnDemand;
import com.school.base.domain.StudentGroupIntegrationTest;
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

privileged aspect StudentGroupIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudentGroupIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudentGroupIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudentGroupIntegrationTest: @Transactional;
    
    @Autowired
    StudentGroupDataOnDemand StudentGroupIntegrationTest.dod;
    
    @Test
    public void StudentGroupIntegrationTest.testCountStudentGroups() {
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", dod.getRandomStudentGroup());
        long count = StudentGroup.countStudentGroups();
        Assert.assertTrue("Counter for 'StudentGroup' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudentGroupIntegrationTest.testFindStudentGroup() {
        StudentGroup obj = dod.getRandomStudentGroup();
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", obj);
        Integer id = obj.getStudentGroupId();
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to provide an identifier", id);
        obj = StudentGroup.findStudentGroup(id);
        Assert.assertNotNull("Find method for 'StudentGroup' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'StudentGroup' returned the incorrect identifier", id, obj.getStudentGroupId());
    }
    
    @Test
    public void StudentGroupIntegrationTest.testFindAllStudentGroups() {
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", dod.getRandomStudentGroup());
        long count = StudentGroup.countStudentGroups();
        Assert.assertTrue("Too expensive to perform a find all test for 'StudentGroup', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<StudentGroup> result = StudentGroup.findAllStudentGroups();
        Assert.assertNotNull("Find all method for 'StudentGroup' illegally returned null", result);
        Assert.assertTrue("Find all method for 'StudentGroup' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudentGroupIntegrationTest.testFindStudentGroupEntries() {
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", dod.getRandomStudentGroup());
        long count = StudentGroup.countStudentGroups();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<StudentGroup> result = StudentGroup.findStudentGroupEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'StudentGroup' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'StudentGroup' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudentGroupIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", dod.getRandomStudentGroup());
        StudentGroup obj = dod.getNewTransientStudentGroup(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'StudentGroup' identifier to be null", obj.getStudentGroupId());
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
        Assert.assertNotNull("Expected 'StudentGroup' identifier to no longer be null", obj.getStudentGroupId());
    }
    
    @Test
    public void StudentGroupIntegrationTest.testRemove() {
        StudentGroup obj = dod.getRandomStudentGroup();
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to initialize correctly", obj);
        Integer id = obj.getStudentGroupId();
        Assert.assertNotNull("Data on demand for 'StudentGroup' failed to provide an identifier", id);
        obj = StudentGroup.findStudentGroup(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'StudentGroup' with identifier '" + id + "'", StudentGroup.findStudentGroup(id));
    }
    
}
