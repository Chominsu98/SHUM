package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.service.ChargeService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final ChargeService chargeService;

    @GetMapping({"/","/main", "/main/rentalstatetrue", "/main/rentalstatefalse"})
    public String main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        boolean state = principalDetails.getUser().isState();
        if(state == true) {
            return "/main/rentalstatetrue";
        }
        else {
            return "/main/rentalstatefalse";
        }
    }

    @GetMapping("/charge/charge")
    public String chargeForm() {
        return "/charge/charge";
    }

    @PostMapping("/charge/charge")
    public String charge(@Valid Integer chargeMoney, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        chargeService.충전하기(chargeMoney.intValue(), principalDetails.getUser().getId());
        return "/charge/charge";
    }
}
