package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.RentalService;
import com.cos.shumstart.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class ReportController {

    private final AuthService authService;
    private final RentalService rentalService;
    private final ReportService reportService;

    @GetMapping("/report/breakdownReport")
    public String reportForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {

        User userEntity = authService.유저정보(principalDetails.getUser().getId());
        Rental rentalEntity = rentalService.대여정보(userEntity.getId());

        model.addAttribute("user", userEntity);
        model.addAttribute("umbrella", rentalEntity);
        return "/report/breakdownReport";
    }

    @PostMapping("/report/breakdownReport")
    public String report(@AuthenticationPrincipal PrincipalDetails principalDetails, @Valid String message) {

        User userEntity = authService.유저정보(principalDetails.getUser().getId());
        Rental rentalEntity = rentalService.대여정보(userEntity.getId());

        System.out.println(userEntity.getId() + ", " + rentalEntity.getUmbrella().getId());

        reportService.우산고장신고(userEntity.getId(), rentalEntity.getUmbrella().getId(), message);
        return "/main/mainPage";
    }

}
