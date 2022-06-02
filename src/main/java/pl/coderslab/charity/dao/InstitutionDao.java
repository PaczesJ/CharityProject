package pl.coderslab.charity.dao;

import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Institution;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class InstitutionDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void saveInstitution(Institution institution) {
        entityManager.persist(institution);
    }

    public void updateInstitution(Institution institution) {
        entityManager.merge(institution);
    }

    public Institution findInstitution(long id) {
        return entityManager.find(Institution.class, id);
    }

    public void deleteInstitution(Institution institution) {
        entityManager.remove(entityManager.contains(institution) ? institution : entityManager.merge(institution));
    }
    public List<Institution> findAll() {
        return entityManager.createQuery("SELECT i FROM Institution i").getResultList();
    }

}
