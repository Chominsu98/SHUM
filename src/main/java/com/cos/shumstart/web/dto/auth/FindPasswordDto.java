package com.cos.shumstart.web.dto.auth;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class FindPasswordDto {

    @NotBlank
    private String user_name;

    @NotBlank
    private String user_id;
}
