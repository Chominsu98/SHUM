package com.cos.shumstart.config;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//로그인 실패시 발동되는 커스텀실패 핸들러로서 실패시 띄워줄 상태를 보여줌
@Component
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException{
        String message="Faile_Login";

        if(exception instanceof BadCredentialsException){

        }
        else if(exception instanceof InsufficientAuthenticationException){
            message="Bad_Request";
        }

        setDefaultFailureUrl("/auth/signin?error=true&exception="+message);

        super.onAuthenticationFailure(request,response,exception);

    }
}
