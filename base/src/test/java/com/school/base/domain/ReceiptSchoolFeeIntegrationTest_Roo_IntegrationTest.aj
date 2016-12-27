// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ReceiptSchoolFee;
import com.school.base.domain.ReceiptSchoolFeeDataOnDemand;
import com.school.base.domain.ReceiptSchoolFeeIntegrationTest;
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

privileged aspect ReceiptSchoolFeeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ReceiptSchoolFeeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ReceiptSchoolFeeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ReceiptSchoolFeeIntegrationTest: @Transactional;
    
    @Autowired
    ReceiptSchoolFeeDataOnDemand ReceiptSchoolFeeIntegrationTest.dod;
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testCountReceiptSchoolFees() {
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", dod.getRandomReceiptSchoolFee());
        long count = ReceiptSchoolFee.countReceiptSchoolFees();
        Assert.assertTrue("Counter for 'ReceiptSchoolFee' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testFindReceiptSchoolFee() {
        ReceiptSchoolFee obj = dod.getRandomReceiptSchoolFee();
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", obj);
        Long id = obj.getReceiptSchoolFeeId();
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to provide an identifier", id);
        obj = ReceiptSchoolFee.findReceiptSchoolFee(id);
        Assert.assertNotNull("Find method for 'ReceiptSchoolFee' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ReceiptSchoolFee' returned the incorrect identifier", id, obj.getReceiptSchoolFeeId());
    }
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testFindAllReceiptSchoolFees() {
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", dod.getRandomReceiptSchoolFee());
        long count = ReceiptSchoolFee.countReceiptSchoolFees();
        Assert.assertTrue("Too expensive to perform a find all test for 'ReceiptSchoolFee', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ReceiptSchoolFee> result = ReceiptSchoolFee.findAllReceiptSchoolFees();
        Assert.assertNotNull("Find all method for 'ReceiptSchoolFee' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ReceiptSchoolFee' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testFindReceiptSchoolFeeEntries() {
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", dod.getRandomReceiptSchoolFee());
        long count = ReceiptSchoolFee.countReceiptSchoolFees();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ReceiptSchoolFee> result = ReceiptSchoolFee.findReceiptSchoolFeeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ReceiptSchoolFee' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ReceiptSchoolFee' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", dod.getRandomReceiptSchoolFee());
        ReceiptSchoolFee obj = dod.getNewTransientReceiptSchoolFee(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ReceiptSchoolFee' identifier to be null", obj.getReceiptSchoolFeeId());
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
        Assert.assertNotNull("Expected 'ReceiptSchoolFee' identifier to no longer be null", obj.getReceiptSchoolFeeId());
    }
    
    @Test
    public void ReceiptSchoolFeeIntegrationTest.testRemove() {
        ReceiptSchoolFee obj = dod.getRandomReceiptSchoolFee();
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to initialize correctly", obj);
        Long id = obj.getReceiptSchoolFeeId();
        Assert.assertNotNull("Data on demand for 'ReceiptSchoolFee' failed to provide an identifier", id);
        obj = ReceiptSchoolFee.findReceiptSchoolFee(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ReceiptSchoolFee' with identifier '" + id + "'", ReceiptSchoolFee.findReceiptSchoolFee(id));
    }
    
}