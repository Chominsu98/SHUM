package com.cos.shumstart.service;

import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service // 1. IoC 2. 트랜잭션 관리
public class AuthService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public User 유저정보(int id) {
        User userEntity = userRepository.findById(id);

        return userEntity;
    }

    @Transactional
    public User 회원가입(User user) {
        String rawPassword = user.getPassword();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        user.setPassword(encPassword);
        user.setRole("ROLE_USER");
        User userEntity = userRepository.save(user);
        return userEntity;
    }
}
