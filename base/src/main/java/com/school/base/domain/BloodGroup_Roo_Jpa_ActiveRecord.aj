// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.BloodGroup;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BloodGroup_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager BloodGroup.entityManager;
    
    public static final List<String> BloodGroup.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager BloodGroup.entityManager() {
        EntityManager em = new BloodGroup().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BloodGroup.countBloodGroups() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BloodGroup o", Long.class).getSingleResult();
    }
    
    public static List<BloodGroup> BloodGroup.findAllBloodGroups() {
        return entityManager().createQuery("SELECT o FROM BloodGroup o", BloodGroup.class).getResultList();
    }
    
    public static List<BloodGroup> BloodGroup.findAllBloodGroups(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BloodGroup o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BloodGroup.class).getResultList();
    }
    
    public static BloodGroup BloodGroup.findBloodGroup(Integer bloodGroupId) {
        if (bloodGroupId == null) return null;
        return entityManager().find(BloodGroup.class, bloodGroupId);
    }
    
    public static List<BloodGroup> BloodGroup.findBloodGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BloodGroup o", BloodGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<BloodGroup> BloodGroup.findBloodGroupEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BloodGroup o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BloodGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void BloodGroup.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BloodGroup.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BloodGroup attached = BloodGroup.findBloodGroup(this.bloodGroupId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BloodGroup.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BloodGroup.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BloodGroup BloodGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BloodGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}