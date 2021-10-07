package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.ChargeService;
import com.cos.shumstart.service.RentalService;
import com.cos.shumstart.service.VoucherService;
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
    private final VoucherService voucherService;

    @GetMapping({"/","/main", "/main/mainPage","/main/rentalStateTrue", "/main/rentalStateFalse"})
    public String main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        boolean state = userEntity.isState();

        if(state == true) {
            return "/main/rentalStateTrue";
        }
        else {
            return "/main/rentalStateFalse";
        }
    }

    @GetMapping("/main/myPage")
    public String myPage(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        model.addAttribute("user", userEntity);

        if(userEntity.isState() == true) {
            Rental rentalEntity = rentalService.대여정보(userEntity.getId());

            model.addAttribute("umbrella", rentalEntity);
        }

        if(userEntity.isHaveTicket() == true) {
            Voucher voucherEntity = voucherService.이용권정보(userEntity.getId());

            model.addAttribute("voucher", voucherEntity);
        }
        return "/main/myPage";
    }


}
