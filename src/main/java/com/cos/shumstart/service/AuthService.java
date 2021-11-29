package com.cos.shumstart.service;

import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import com.cos.shumstart.web.dto.auth.FindPasswordDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service // 1. IoC 2. 트랜잭션 관리
public class AuthService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Transactional
    public User 유저정보(int id) {
        User userEntity = userRepository.findById(id);

        return userEntity;
    }

    @Transactional
    public User 유저정보_유저네임으로_찾기(String userName){
        User userEntity=userRepository.findByUsername(userName);

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

    @Transactional
    public boolean 비밀번호찾기확인(FindPasswordDto findPasswordDto){
        User user=userRepository.findByUsername(findPasswordDto.getUser_id());//사용자 아이디로 찾는다

        if(user!=null && findPasswordDto.getUser_name().equals(user.getName())){
            //실제 이름까지 같은지 확인
            return true;
        }
        return false;

    }
}
