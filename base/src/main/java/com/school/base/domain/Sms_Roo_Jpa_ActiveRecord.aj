// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Sms;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Sms_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Sms.entityManager;
    
    public static final List<String> Sms.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager Sms.entityManager() {
        EntityManager em = new Sms().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Sms.countSmses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Sms o", Long.class).getSingleResult();
    }
    
    public static List<Sms> Sms.findAllSmses() {
        return entityManager().createQuery("SELECT o FROM Sms o", Sms.class).getResultList();
    }
    
    public static List<Sms> Sms.findAllSmses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Sms o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Sms.class).getResultList();
    }
    
    public static Sms Sms.findSms(Long smsId) {
        if (smsId == null) return null;
        return entityManager().find(Sms.class, smsId);
    }
    
    public static List<Sms> Sms.findSmsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Sms o", Sms.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Sms> Sms.findSmsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Sms o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Sms.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Sms.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Sms.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Sms attached = Sms.findSms(this.smsId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Sms.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Sms.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Sms Sms.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Sms merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
