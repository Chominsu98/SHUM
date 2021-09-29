package com.cos.shumstart.web.boothmodel;

import com.cos.shumstart.domain.booth.Booth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface BoothRepository extends JpaRepository<Booth, Integer> {
    Booth findById(int id);

    @Modifying
    @Query("UPDATE Booth b SET b.leftUmbrella = :leftUmbrella WHERE b.id = :id")
    int updateLeftUmbrella(int leftUmbrella, int id);
}
