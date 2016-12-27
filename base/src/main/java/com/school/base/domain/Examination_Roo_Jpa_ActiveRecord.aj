// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Examination;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Examination_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Examination.entityManager;
    
    public static final List<String> Examination.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager Examination.entityManager() {
        EntityManager em = new Examination().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Examination.countExaminations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Examination o", Long.class).getSingleResult();
    }
    
    public static List<Examination> Examination.findAllExaminations() {
        return entityManager().createQuery("SELECT o FROM Examination o", Examination.class).getResultList();
    }
    
    public static List<Examination> Examination.findAllExaminations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Examination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Examination.class).getResultList();
    }
    
    public static Examination Examination.findExamination(Integer examinationId) {
        if (examinationId == null) return null;
        return entityManager().find(Examination.class, examinationId);
    }
    
    public static List<Examination> Examination.findExaminationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Examination o", Examination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Examination> Examination.findExaminationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Examination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Examination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Examination.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Examination.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Examination attached = Examination.findExamination(this.examinationId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Examination.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Examination.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Examination Examination.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Examination merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
