package com.cos.shumstart.web.boothmodel;

import com.cos.shumstart.domain.booth.Booth;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoothRepository extends JpaRepository<Booth, Integer> {
    Booth findById(int id);
}
