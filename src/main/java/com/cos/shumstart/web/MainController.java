package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.ChargeService;
import com.cos.shumstart.service.RentalService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final RentalService rentalService;
    private final AuthService authService;
    private final ChargeService chargeService;

    @GetMapping({"/","/main", "/main/mainPage","/main/rentalstatetrue", "/main/rentalstatefalse"})
    public String main() {
        return "/main/mainPage";
    }

    @GetMapping("/main/myPage")
    public String myPage(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        model.addAttribute("user", userEntity);

        if(userEntity.isState() == true) {
            Rental rentalEntity = rentalService.대여정보(userEntity.getId());

            model.addAttribute("umbrella", rentalEntity);
        }
        return "/main/myPage";
    }

    @GetMapping("/charge/charge")
    public String chargeForm() {
        return "/charge/charge";
    }

    @PostMapping("/charge/charge")
    public String charge(@Valid Integer chargeMoney, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        chargeService.충전하기(chargeMoney.intValue(), principalDetails.getUser().getId());
        return "/main/mainPage";
    }
}
