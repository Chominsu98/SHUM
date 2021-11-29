package com.cos.shumstart.web.dto.auth;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class PwchangeDto {

    @NotBlank
    private String old_password;
    @NotBlank
    private String new_password;
    @NotBlank
    private String new_password_check;


}
