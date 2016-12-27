// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Department;
import com.school.base.domain.DepartmentDataOnDemand;
import com.school.base.domain.DepartmentIntegrationTest;
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

privileged aspect DepartmentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DepartmentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DepartmentIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: DepartmentIntegrationTest: @Transactional;
    
    @Autowired
    DepartmentDataOnDemand DepartmentIntegrationTest.dod;
    
    @Test
    public void DepartmentIntegrationTest.testCountDepartments() {
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", dod.getRandomDepartment());
        long count = Department.countDepartments();
        Assert.assertTrue("Counter for 'Department' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DepartmentIntegrationTest.testFindDepartment() {
        Department obj = dod.getRandomDepartment();
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", obj);
        Integer id = obj.getDepartmentId();
        Assert.assertNotNull("Data on demand for 'Department' failed to provide an identifier", id);
        obj = Department.findDepartment(id);
        Assert.assertNotNull("Find method for 'Department' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Department' returned the incorrect identifier", id, obj.getDepartmentId());
    }
    
    @Test
    public void DepartmentIntegrationTest.testFindAllDepartments() {
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", dod.getRandomDepartment());
        long count = Department.countDepartments();
        Assert.assertTrue("Too expensive to perform a find all test for 'Department', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Department> result = Department.findAllDepartments();
        Assert.assertNotNull("Find all method for 'Department' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Department' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void DepartmentIntegrationTest.testFindDepartmentEntries() {
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", dod.getRandomDepartment());
        long count = Department.countDepartments();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Department> result = Department.findDepartmentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Department' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Department' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DepartmentIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", dod.getRandomDepartment());
        Department obj = dod.getNewTransientDepartment(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Department' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Department' identifier to be null", obj.getDepartmentId());
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
        Assert.assertNotNull("Expected 'Department' identifier to no longer be null", obj.getDepartmentId());
    }
    
    @Test
    public void DepartmentIntegrationTest.testRemove() {
        Department obj = dod.getRandomDepartment();
        Assert.assertNotNull("Data on demand for 'Department' failed to initialize correctly", obj);
        Integer id = obj.getDepartmentId();
        Assert.assertNotNull("Data on demand for 'Department' failed to provide an identifier", id);
        obj = Department.findDepartment(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Department' with identifier '" + id + "'", Department.findDepartment(id));
    }
    
}
