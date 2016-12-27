// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SchoolAcademic;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SchoolAcademic_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SchoolAcademic.entityManager;
    
    public static final List<String> SchoolAcademic.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager SchoolAcademic.entityManager() {
        EntityManager em = new SchoolAcademic().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SchoolAcademic.countSchoolAcademics() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SchoolAcademic o", Long.class).getSingleResult();
    }
    
    public static List<SchoolAcademic> SchoolAcademic.findAllSchoolAcademics() {
        return entityManager().createQuery("SELECT o FROM SchoolAcademic o", SchoolAcademic.class).getResultList();
    }
    
    public static List<SchoolAcademic> SchoolAcademic.findAllSchoolAcademics(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SchoolAcademic o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SchoolAcademic.class).getResultList();
    }
    
    public static SchoolAcademic SchoolAcademic.findSchoolAcademic(Integer schoolAcademicYearId) {
        if (schoolAcademicYearId == null) return null;
        return entityManager().find(SchoolAcademic.class, schoolAcademicYearId);
    }
    
    public static List<SchoolAcademic> SchoolAcademic.findSchoolAcademicEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SchoolAcademic o", SchoolAcademic.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<SchoolAcademic> SchoolAcademic.findSchoolAcademicEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SchoolAcademic o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SchoolAcademic.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SchoolAcademic.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SchoolAcademic.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SchoolAcademic attached = SchoolAcademic.findSchoolAcademic(this.schoolAcademicYearId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SchoolAcademic.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SchoolAcademic.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SchoolAcademic SchoolAcademic.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SchoolAcademic merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
