// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.ClassExamination;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClassExamination_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ClassExamination.entityManager;
    
    public static final List<String> ClassExamination.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager ClassExamination.entityManager() {
        EntityManager em = new ClassExamination().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ClassExamination.countClassExaminations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ClassExamination o", Long.class).getSingleResult();
    }
    
    public static List<ClassExamination> ClassExamination.findAllClassExaminations() {
        return entityManager().createQuery("SELECT o FROM ClassExamination o", ClassExamination.class).getResultList();
    }
    
    public static List<ClassExamination> ClassExamination.findAllClassExaminations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ClassExamination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ClassExamination.class).getResultList();
    }
    
    public static ClassExamination ClassExamination.findClassExamination(Integer classExaminationId) {
        if (classExaminationId == null) return null;
        return entityManager().find(ClassExamination.class, classExaminationId);
    }
    
    public static List<ClassExamination> ClassExamination.findClassExaminationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ClassExamination o", ClassExamination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ClassExamination> ClassExamination.findClassExaminationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ClassExamination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ClassExamination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ClassExamination.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ClassExamination.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ClassExamination attached = ClassExamination.findClassExamination(this.classExaminationId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ClassExamination.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ClassExamination.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ClassExamination ClassExamination.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ClassExamination merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
