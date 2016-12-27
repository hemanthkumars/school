// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ResultType;
import com.school.base.domain.ResultTypeDataOnDemand;
import com.school.base.domain.ResultTypeIntegrationTest;
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

privileged aspect ResultTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ResultTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ResultTypeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ResultTypeIntegrationTest: @Transactional;
    
    @Autowired
    ResultTypeDataOnDemand ResultTypeIntegrationTest.dod;
    
    @Test
    public void ResultTypeIntegrationTest.testCountResultTypes() {
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", dod.getRandomResultType());
        long count = ResultType.countResultTypes();
        Assert.assertTrue("Counter for 'ResultType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ResultTypeIntegrationTest.testFindResultType() {
        ResultType obj = dod.getRandomResultType();
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", obj);
        Integer id = obj.getResultTypeId();
        Assert.assertNotNull("Data on demand for 'ResultType' failed to provide an identifier", id);
        obj = ResultType.findResultType(id);
        Assert.assertNotNull("Find method for 'ResultType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ResultType' returned the incorrect identifier", id, obj.getResultTypeId());
    }
    
    @Test
    public void ResultTypeIntegrationTest.testFindAllResultTypes() {
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", dod.getRandomResultType());
        long count = ResultType.countResultTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'ResultType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ResultType> result = ResultType.findAllResultTypes();
        Assert.assertNotNull("Find all method for 'ResultType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ResultType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ResultTypeIntegrationTest.testFindResultTypeEntries() {
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", dod.getRandomResultType());
        long count = ResultType.countResultTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ResultType> result = ResultType.findResultTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ResultType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ResultType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ResultTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", dod.getRandomResultType());
        ResultType obj = dod.getNewTransientResultType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ResultType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ResultType' identifier to be null", obj.getResultTypeId());
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
        Assert.assertNotNull("Expected 'ResultType' identifier to no longer be null", obj.getResultTypeId());
    }
    
    @Test
    public void ResultTypeIntegrationTest.testRemove() {
        ResultType obj = dod.getRandomResultType();
        Assert.assertNotNull("Data on demand for 'ResultType' failed to initialize correctly", obj);
        Integer id = obj.getResultTypeId();
        Assert.assertNotNull("Data on demand for 'ResultType' failed to provide an identifier", id);
        obj = ResultType.findResultType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ResultType' with identifier '" + id + "'", ResultType.findResultType(id));
    }
    
}
