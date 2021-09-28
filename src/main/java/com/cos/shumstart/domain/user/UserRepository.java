package com.cos.shumstart.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;

// IoC 등록 자동
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
