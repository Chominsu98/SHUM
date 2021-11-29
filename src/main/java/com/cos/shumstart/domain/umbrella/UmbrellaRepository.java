package com.cos.shumstart.domain.umbrella;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UmbrellaRepository extends JpaRepository<Umbrella, Integer> {
    Umbrella findById(int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.booth.id = null WHERE u.id = :id")
    int updateBoothIdRental(int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.booth.id = :boothId WHERE u.id = :id")
    int updateBoothIdReturn(int boothId, int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.rentalState = :rentalState WHERE u.id = :id")
    int updateRentalState(boolean rentalState, int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.brokenState = :brokenState WHERE u.id = :id")
    int updateBrokenState(boolean brokenState, int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.holderNumber = null WHERE u.id = :id")
    int updateHolderNumberRental(int id);

    @Modifying
    @Query("UPDATE Umbrella u SET u.holderNumber = :holderNumber WHERE u.id = :id")
    int updateHolderNumberReturn(int holderNumber, int id);
}
