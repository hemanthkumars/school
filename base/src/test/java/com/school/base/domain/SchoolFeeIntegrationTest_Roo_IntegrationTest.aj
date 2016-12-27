// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolFee;
import com.school.base.domain.SchoolFeeDataOnDemand;
import com.school.base.domain.SchoolFeeIntegrationTest;
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

privileged aspect SchoolFeeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SchoolFeeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SchoolFeeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SchoolFeeIntegrationTest: @Transactional;
    
    @Autowired
    SchoolFeeDataOnDemand SchoolFeeIntegrationTest.dod;
    
    @Test
    public void SchoolFeeIntegrationTest.testCountSchoolFees() {
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", dod.getRandomSchoolFee());
        long count = SchoolFee.countSchoolFees();
        Assert.assertTrue("Counter for 'SchoolFee' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SchoolFeeIntegrationTest.testFindSchoolFee() {
        SchoolFee obj = dod.getRandomSchoolFee();
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", obj);
        Long id = obj.getSchoolFeeId();
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to provide an identifier", id);
        obj = SchoolFee.findSchoolFee(id);
        Assert.assertNotNull("Find method for 'SchoolFee' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SchoolFee' returned the incorrect identifier", id, obj.getSchoolFeeId());
    }
    
    @Test
    public void SchoolFeeIntegrationTest.testFindAllSchoolFees() {
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", dod.getRandomSchoolFee());
        long count = SchoolFee.countSchoolFees();
        Assert.assertTrue("Too expensive to perform a find all test for 'SchoolFee', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SchoolFee> result = SchoolFee.findAllSchoolFees();
        Assert.assertNotNull("Find all method for 'SchoolFee' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SchoolFee' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SchoolFeeIntegrationTest.testFindSchoolFeeEntries() {
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", dod.getRandomSchoolFee());
        long count = SchoolFee.countSchoolFees();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SchoolFee> result = SchoolFee.findSchoolFeeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SchoolFee' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SchoolFee' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SchoolFeeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", dod.getRandomSchoolFee());
        SchoolFee obj = dod.getNewTransientSchoolFee(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SchoolFee' identifier to be null", obj.getSchoolFeeId());
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
        Assert.assertNotNull("Expected 'SchoolFee' identifier to no longer be null", obj.getSchoolFeeId());
    }
    
    @Test
    public void SchoolFeeIntegrationTest.testRemove() {
        SchoolFee obj = dod.getRandomSchoolFee();
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to initialize correctly", obj);
        Long id = obj.getSchoolFeeId();
        Assert.assertNotNull("Data on demand for 'SchoolFee' failed to provide an identifier", id);
        obj = SchoolFee.findSchoolFee(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SchoolFee' with identifier '" + id + "'", SchoolFee.findSchoolFee(id));
    }
    
}
