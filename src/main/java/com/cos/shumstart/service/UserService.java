package com.cos.shumstart.service;

import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Transactional
    public User 회원수정(int id,User user){

        User userEntity=userRepository.findById(id);

        userEntity.setName(user.getName());
        userEntity.setEmail(user.getEmail());
        userEntity.setUsername(user.getUsername());
        userEntity.setPhone(user.getPhone());

        return userEntity;
    }

    @Transactional
    public User 비번수정(String username,String new_password){

        User userEntity=userRepository.findByUsername(username);

        String encPassword=bCryptPasswordEncoder.encode(new_password);//새로운 비번에대한 암호화

        userEntity.setPassword(encPassword);//user에 새 비번 삽입

        return userEntity;

    }
}
