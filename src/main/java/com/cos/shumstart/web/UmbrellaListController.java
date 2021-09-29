package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.service.BoothService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RequiredArgsConstructor
@Controller
public class UmbrellaListController {

    private final BoothService boothService;

    @GetMapping("/rental/showUmbrella/{boothId}")
    public String umbrellaList(@PathVariable int boothId,
                               @AuthenticationPrincipal PrincipalDetails principalDetails,
                               Model model) {
        Booth boothEntity = boothService.부스정보(boothId);
        model.addAttribute("booth", boothEntity);
        model.addAttribute("user", principalDetails.getUser());
        return "/rental/showUmbrella";
    }
}
