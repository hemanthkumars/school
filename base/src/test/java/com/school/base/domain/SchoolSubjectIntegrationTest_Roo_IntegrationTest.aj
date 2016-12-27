// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolSubject;
import com.school.base.domain.SchoolSubjectDataOnDemand;
import com.school.base.domain.SchoolSubjectIntegrationTest;
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

privileged aspect SchoolSubjectIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SchoolSubjectIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SchoolSubjectIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SchoolSubjectIntegrationTest: @Transactional;
    
    @Autowired
    SchoolSubjectDataOnDemand SchoolSubjectIntegrationTest.dod;
    
    @Test
    public void SchoolSubjectIntegrationTest.testCountSchoolSubjects() {
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", dod.getRandomSchoolSubject());
        long count = SchoolSubject.countSchoolSubjects();
        Assert.assertTrue("Counter for 'SchoolSubject' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SchoolSubjectIntegrationTest.testFindSchoolSubject() {
        SchoolSubject obj = dod.getRandomSchoolSubject();
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", obj);
        Integer id = obj.getSchoolSubjectId();
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to provide an identifier", id);
        obj = SchoolSubject.findSchoolSubject(id);
        Assert.assertNotNull("Find method for 'SchoolSubject' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SchoolSubject' returned the incorrect identifier", id, obj.getSchoolSubjectId());
    }
    
    @Test
    public void SchoolSubjectIntegrationTest.testFindAllSchoolSubjects() {
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", dod.getRandomSchoolSubject());
        long count = SchoolSubject.countSchoolSubjects();
        Assert.assertTrue("Too expensive to perform a find all test for 'SchoolSubject', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SchoolSubject> result = SchoolSubject.findAllSchoolSubjects();
        Assert.assertNotNull("Find all method for 'SchoolSubject' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SchoolSubject' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SchoolSubjectIntegrationTest.testFindSchoolSubjectEntries() {
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", dod.getRandomSchoolSubject());
        long count = SchoolSubject.countSchoolSubjects();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SchoolSubject> result = SchoolSubject.findSchoolSubjectEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SchoolSubject' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SchoolSubject' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SchoolSubjectIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", dod.getRandomSchoolSubject());
        SchoolSubject obj = dod.getNewTransientSchoolSubject(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SchoolSubject' identifier to be null", obj.getSchoolSubjectId());
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
        Assert.assertNotNull("Expected 'SchoolSubject' identifier to no longer be null", obj.getSchoolSubjectId());
    }
    
    @Test
    public void SchoolSubjectIntegrationTest.testRemove() {
        SchoolSubject obj = dod.getRandomSchoolSubject();
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to initialize correctly", obj);
        Integer id = obj.getSchoolSubjectId();
        Assert.assertNotNull("Data on demand for 'SchoolSubject' failed to provide an identifier", id);
        obj = SchoolSubject.findSchoolSubject(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SchoolSubject' with identifier '" + id + "'", SchoolSubject.findSchoolSubject(id));
    }
    
}