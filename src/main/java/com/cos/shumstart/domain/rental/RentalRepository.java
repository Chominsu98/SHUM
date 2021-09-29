package com.cos.shumstart.domain.rental;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface RentalRepository extends JpaRepository<Rental, Integer> {
    Rental findByUserId(int id);

    @Modifying
    @Query("DELETE FROM Rental WHERE user.id = :userId AND umbrella.id = :umbrellaId")
    int rentalDelete(int userId, int umbrellaId);
}
