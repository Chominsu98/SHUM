package com.cos.shumstart.web.boothmodel;

import com.cos.shumstart.domain.umbrella.Umbrella;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UmbrellaRepository extends JpaRepository<Umbrella, Integer> {
    Umbrella findById(int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.booth = null WHERE u.id = :id")
    int updateBoothIdRental(int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.booth = :boothId WHERE u.id = :id")
    int updateBoothIdReturn(int boothId, int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.rentalState = :rentalState WHERE u.id = :id")
    int updateRentalState(boolean rentalState, int id);
}
