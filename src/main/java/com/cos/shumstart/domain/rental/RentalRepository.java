package com.cos.shumstart.domain.rental;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface RentalRepository extends JpaRepository<Rental, Integer> {
    List<Rental> findByUserId(int userId);
    List<Rental> findByUmbrellaId(int umbrellaId);

    @Modifying
    @Query("DELETE FROM Rental WHERE user.id = :userId AND umbrella.id = :umbrellaId")
    int rentalDelete(int userId, int umbrellaId);

    @Modifying
    @Query("UPDATE Rental r SET r.returnDate = :returnDate WHERE r.id = :id")
    int updateReturnDate(LocalDateTime returnDate, int id);

    @Modifying
    @Query("UPDATE Rental r SET r.activation = :activation WHERE r.id = :id")
    int updateActivation(boolean activation, int id);
}
