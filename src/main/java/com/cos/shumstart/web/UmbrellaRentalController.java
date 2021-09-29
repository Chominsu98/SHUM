package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.handler.ex.CustomValidationException;
import com.cos.shumstart.service.RentalService;
import com.cos.shumstart.web.boothmodel.BoothDataDao;
import com.cos.shumstart.web.dto.CMRespDto;
import com.cos.shumstart.web.dto.RentalDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class UmbrellaRentalController {

    private final BoothDataDao boothDataDao;
    private final RentalService rentalService;

    @GetMapping("/main/umbrellaRental/{boothId}/{umbrellaId}")
    public String umbrellaRentalForm(@PathVariable int boothId,
                                     @PathVariable int umbrellaId,
                                     @AuthenticationPrincipal PrincipalDetails principalDetails,
                                     Model model) {

        Booth boothEntity = boothDataDao.부스번호(boothId);
        Umbrella umbrellaEntity = boothDataDao.우산번호(umbrellaId);
        User userEntity = principalDetails.getUser();

        model.addAttribute("booth", boothEntity);
        model.addAttribute("umbrella", umbrellaEntity);
        model.addAttribute("user", userEntity);
        return "/main/umbrellaRental";
    }

    @PostMapping("/main/umbrellaRental/{boothId}/{umbrellaId}")
    public String umbrellaRental(@PathVariable int boothId,
                                 @PathVariable int umbrellaId,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) {

        Rental rental = rentalService.대여하기(principalDetails.getUser().getId(),umbrellaId, boothId);
        System.out.println(principalDetails.getUser().getId() + ", " + umbrellaId);
        return "/main/rentalstatetrue";
    }
}
