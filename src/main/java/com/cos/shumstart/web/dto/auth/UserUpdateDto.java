package com.cos.shumstart.web.dto.auth;

import com.cos.shumstart.domain.user.User;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class UserUpdateDto {
    @Size(min = 2, max = 20)
    @NotBlank
    private String username;
    @NotBlank
    private String name;
    @NotBlank
    private String email;

    private String phone;


    public User toEntity(){
        return User.builder()
                .name(name)
                .username(username)
                .email(email)
                .phone(phone)
                .build();
    }
}
