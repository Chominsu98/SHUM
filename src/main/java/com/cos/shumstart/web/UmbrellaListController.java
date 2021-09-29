package com.cos.shumstart.web;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.web.boothmodel.BoothDataDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RequiredArgsConstructor
@Controller
public class UmbrellaListController {

    private final BoothDataDao boothDataDao;

    @GetMapping("/main/showUmbrella/{boothId}")
    public String umbrellaList(@PathVariable int boothId, Model model) {
        Booth boothEntity = boothDataDao.부스번호(boothId);
        model.addAttribute("booth", boothEntity);
        return "/main/showUmbrella";
    }
}
