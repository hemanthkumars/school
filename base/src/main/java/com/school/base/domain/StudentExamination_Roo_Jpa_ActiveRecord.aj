// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.StudentExamination;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StudentExamination_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager StudentExamination.entityManager;
    
    public static final List<String> StudentExamination.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager StudentExamination.entityManager() {
        EntityManager em = new StudentExamination().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StudentExamination.countStudentExaminations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StudentExamination o", Long.class).getSingleResult();
    }
    
    public static List<StudentExamination> StudentExamination.findAllStudentExaminations() {
        return entityManager().createQuery("SELECT o FROM StudentExamination o", StudentExamination.class).getResultList();
    }
    
    public static List<StudentExamination> StudentExamination.findAllStudentExaminations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StudentExamination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StudentExamination.class).getResultList();
    }
    
    public static StudentExamination StudentExamination.findStudentExamination(Integer studentExaminationId) {
        if (studentExaminationId == null) return null;
        return entityManager().find(StudentExamination.class, studentExaminationId);
    }
    
    public static List<StudentExamination> StudentExamination.findStudentExaminationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StudentExamination o", StudentExamination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<StudentExamination> StudentExamination.findStudentExaminationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StudentExamination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StudentExamination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void StudentExamination.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StudentExamination.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StudentExamination attached = StudentExamination.findStudentExamination(this.studentExaminationId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StudentExamination.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void StudentExamination.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public StudentExamination StudentExamination.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StudentExamination merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
