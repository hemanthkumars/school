// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.BloodGroup;
import com.school.base.domain.BloodGroupDataOnDemand;
import com.school.base.domain.BloodGroupIntegrationTest;
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

privileged aspect BloodGroupIntegrationTest_Roo_IntegrationTest {
    
    declare @type: BloodGroupIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: BloodGroupIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: BloodGroupIntegrationTest: @Transactional;
    
    @Autowired
    BloodGroupDataOnDemand BloodGroupIntegrationTest.dod;
    
    @Test
    public void BloodGroupIntegrationTest.testCountBloodGroups() {
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", dod.getRandomBloodGroup());
        long count = BloodGroup.countBloodGroups();
        Assert.assertTrue("Counter for 'BloodGroup' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void BloodGroupIntegrationTest.testFindBloodGroup() {
        BloodGroup obj = dod.getRandomBloodGroup();
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", obj);
        Integer id = obj.getBloodGroupId();
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to provide an identifier", id);
        obj = BloodGroup.findBloodGroup(id);
        Assert.assertNotNull("Find method for 'BloodGroup' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'BloodGroup' returned the incorrect identifier", id, obj.getBloodGroupId());
    }
    
    @Test
    public void BloodGroupIntegrationTest.testFindAllBloodGroups() {
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", dod.getRandomBloodGroup());
        long count = BloodGroup.countBloodGroups();
        Assert.assertTrue("Too expensive to perform a find all test for 'BloodGroup', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<BloodGroup> result = BloodGroup.findAllBloodGroups();
        Assert.assertNotNull("Find all method for 'BloodGroup' illegally returned null", result);
        Assert.assertTrue("Find all method for 'BloodGroup' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void BloodGroupIntegrationTest.testFindBloodGroupEntries() {
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", dod.getRandomBloodGroup());
        long count = BloodGroup.countBloodGroups();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<BloodGroup> result = BloodGroup.findBloodGroupEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'BloodGroup' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'BloodGroup' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void BloodGroupIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", dod.getRandomBloodGroup());
        BloodGroup obj = dod.getNewTransientBloodGroup(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'BloodGroup' identifier to be null", obj.getBloodGroupId());
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
        Assert.assertNotNull("Expected 'BloodGroup' identifier to no longer be null", obj.getBloodGroupId());
    }
    
    @Test
    public void BloodGroupIntegrationTest.testRemove() {
        BloodGroup obj = dod.getRandomBloodGroup();
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to initialize correctly", obj);
        Integer id = obj.getBloodGroupId();
        Assert.assertNotNull("Data on demand for 'BloodGroup' failed to provide an identifier", id);
        obj = BloodGroup.findBloodGroup(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'BloodGroup' with identifier '" + id + "'", BloodGroup.findBloodGroup(id));
    }
    
}
