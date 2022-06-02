package pl.coderslab.charity.dao;

import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Donation;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class DonationDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void saveDonation(Donation donation) {
        entityManager.persist(donation);
    }

    public void updateDonation(Donation donation) {
        entityManager.merge(donation);
    }

    public Donation findDonation(long id) {
        return entityManager.find(Donation.class, id);
    }

    public void deleteDonation(Donation donation) {
        entityManager.remove(entityManager.contains(donation) ? donation : entityManager.merge(donation));
    }
    public List<Donation> findAll() {
        return entityManager.createQuery("SELECT d FROM Donation d").getResultList();
    }
    public Object sumBags(){
        return entityManager.createQuery("SELECT SUM (quantity) FROM Donation").getSingleResult();
    }
    public Object numberOfDonations() {
        return entityManager.createQuery("SELECT COUNT (id) FROM Donation ").getSingleResult();
    }


}
