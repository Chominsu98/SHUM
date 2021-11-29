package com.cos.shumstart.domain.booth;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface BoothRepository extends JpaRepository<Booth, Integer> {
    Booth findById(int id);

    @Modifying
    @Query("UPDATE Booth b SET b.leftFreeUmbrella = :leftFreeUmbrella WHERE b.id = :id")
    int updateLeftFreeUmbrella(int leftFreeUmbrella, int id);

    @Modifying
    @Query("UPDATE Booth b SET b.leftLocationUmbrella = :leftLocationUmbrella WHERE b.id = :id")
    int updateLeftLocationUmbrella(int leftLocationUmbrella, int id);
}
