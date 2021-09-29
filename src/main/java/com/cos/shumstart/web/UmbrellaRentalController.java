package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.RentalService;
import com.cos.shumstart.service.BoothService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@RequiredArgsConstructor
@Controller
public class UmbrellaRentalController {

    private final BoothService boothService;
    private final RentalService rentalService;
    private final AuthService authService;

    @GetMapping("/rental/umbrellaRental/{boothId}/{umbrellaId}/{userId}")
    public String umbrellaRentalForm(@PathVariable int boothId,
                                     @PathVariable int umbrellaId,
                                     @PathVariable int userId,
                                     Model model) {

        Booth boothEntity = boothService.부스정보(boothId);
        Umbrella umbrellaEntity = boothService.우산정보(umbrellaId);
        User userEntity = authService.유저정보(userId);

        model.addAttribute("booth", boothEntity);
        model.addAttribute("umbrella", umbrellaEntity);
        model.addAttribute("user", userEntity);

        return "/rental/umbrellaRental";
    }

    @PostMapping("/rental/umbrellaRental/{boothId}/{umbrellaId}")
    public String umbrellaRental(@PathVariable int boothId,
                                 @PathVariable int umbrellaId,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) {

        Rental rental = rentalService.대여하기(principalDetails.getUser().getId(),umbrellaId, boothId);

        return "/main/rentalstatetrue";
    }
}
