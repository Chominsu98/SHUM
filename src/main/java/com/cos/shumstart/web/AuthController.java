package com.cos.shumstart.web;

import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.handler.ex.CustomValidationException;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.web.dto.auth.SignupDto;
import lombok.RequiredArgsConstructor;
import net.bytebuddy.implementation.bind.annotation.BindingPriority;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller // 1.IoC 2. 파일을 리턴하는 컨트롤러
public class AuthController {

    private final AuthService authService;

    @GetMapping("/auth/signin")
    public String signinForm() {
        return "/auth/signin";
    }

    @GetMapping("/auth/signup")
    public String signupForm() {
        return "/auth/signup";
    }

    // 회원가입버튼 -> /auth/signup -> /auth/signin
    @PostMapping("/auth/signup")
    public String signup(@Valid SignupDto signupDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = new HashMap<>();

            for (FieldError error : bindingResult.getFieldErrors()) {
                errorMap.put(error.getField(), error.getDefaultMessage());
            }
            throw new CustomValidationException("유효성 검사 실패함", errorMap);

        } else {
            User user = signupDto.toEntity();
            User userEntity = authService.회원가입(user);
            return "/auth/signin";
        }
    }
}
