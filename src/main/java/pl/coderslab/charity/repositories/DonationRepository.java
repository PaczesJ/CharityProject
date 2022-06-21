package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entities.Donation;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    long count();
    @Query("SELECT sum (d.quantity) FROM Donation d")
    int sumQuantity();
    @Override
    <S extends Donation> S save(S entity);
}
