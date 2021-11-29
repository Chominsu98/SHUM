package com.cos.shumstart.domain.holder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HolderRepository extends JpaRepository<Holder, Integer> {
    Holder findById(int id);
    Holder findByUmbrellaId(int umbrellaId);

    @Modifying
    @Query("UPDATE Holder h SET h.umbrellaId = null WHERE h.id = :id")
    int updateUmbrellaIdRental(int id);

    @Modifying
    @Query("UPDATE Holder h SET h.umbrellaId = :umbrellaId WHERE h.id = :id")
    int updateUmbrellaIdReturn(int umbrellaId, int id);

    @Query("SELECT h FROM Holder h WHERE h.umbrellaId IS null")
    List<Holder> listOfEmptyHolder();
}
