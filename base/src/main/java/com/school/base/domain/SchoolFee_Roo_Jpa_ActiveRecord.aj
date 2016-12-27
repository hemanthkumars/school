// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolFee;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SchoolFee_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SchoolFee.entityManager;
    
    public static final List<String> SchoolFee.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager SchoolFee.entityManager() {
        EntityManager em = new SchoolFee().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SchoolFee.countSchoolFees() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SchoolFee o", Long.class).getSingleResult();
    }
    
    public static List<SchoolFee> SchoolFee.findAllSchoolFees() {
        return entityManager().createQuery("SELECT o FROM SchoolFee o", SchoolFee.class).getResultList();
    }
    
    public static List<SchoolFee> SchoolFee.findAllSchoolFees(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SchoolFee o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SchoolFee.class).getResultList();
    }
    
    public static SchoolFee SchoolFee.findSchoolFee(Long schoolFeeId) {
        if (schoolFeeId == null) return null;
        return entityManager().find(SchoolFee.class, schoolFeeId);
    }
    
    public static List<SchoolFee> SchoolFee.findSchoolFeeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SchoolFee o", SchoolFee.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<SchoolFee> SchoolFee.findSchoolFeeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SchoolFee o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SchoolFee.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SchoolFee.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SchoolFee.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SchoolFee attached = SchoolFee.findSchoolFee(this.schoolFeeId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SchoolFee.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SchoolFee.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SchoolFee SchoolFee.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SchoolFee merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}