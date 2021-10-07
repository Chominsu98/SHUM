package com.cos.shumstart.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

// IoC 등록 자동
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
    User findById(int id);

    @Modifying
    @Query("UPDATE User u SET u.state = :state WHERE u.id = :id")
    int updateState(boolean state, int id);

    @Modifying
    @Query("UPDATE User u SET u.money = :money WHERE u.id = :id")
    int updateMoney(int money, int id);

    @Modifying
    @Query("UPDATE User u SET u.haveTicket = :haveTicket WHERE u.id = :id")
    int updateHaveTicket(boolean haveTicket, int id);
}
