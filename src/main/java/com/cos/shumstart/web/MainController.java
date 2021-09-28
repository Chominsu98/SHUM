package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {

    @GetMapping({"/", "/main/rentalstatetrue", "/main/rentalstatefalse"})
    public String main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        boolean state = principalDetails.getUser().isState();
        if(state == true) {
            return "/main/rentalstatetrue";
        }
        else {
            return "/main/rentalstatefalse";
        }
    }
}
