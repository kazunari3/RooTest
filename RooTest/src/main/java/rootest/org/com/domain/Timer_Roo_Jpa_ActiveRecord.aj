// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package rootest.org.com.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import rootest.org.com.domain.Timer;

privileged aspect Timer_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Timer.entityManager;
    
    public static final List<String> Timer.fieldNames4OrderClauseFilter = java.util.Arrays.asList("message");
    
    public static final EntityManager Timer.entityManager() {
        EntityManager em = new Timer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Timer.countTimers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Timer o", Long.class).getSingleResult();
    }
    
    public static List<Timer> Timer.findAllTimers() {
        return entityManager().createQuery("SELECT o FROM Timer o", Timer.class).getResultList();
    }
    
    public static List<Timer> Timer.findAllTimers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Timer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Timer.class).getResultList();
    }
    
    public static Timer Timer.findTimer(Long id) {
        if (id == null) return null;
        return entityManager().find(Timer.class, id);
    }
    
    public static List<Timer> Timer.findTimerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Timer o", Timer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Timer> Timer.findTimerEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Timer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Timer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Timer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Timer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Timer attached = Timer.findTimer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Timer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Timer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Timer Timer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Timer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
