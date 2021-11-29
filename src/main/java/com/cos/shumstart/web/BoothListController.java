package com.cos.shumstart.web;

import java.util.ArrayList;

import com.cos.shumstart.web.dto.BoothDto;
import com.cos.shumstart.service.BoothService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoothListController {

    @Autowired
    private BoothService boothService;

    @GetMapping("/rental/rentalshowBooth")
    public ModelAndView rentalBoothList() {
        ArrayList<BoothDto> list = boothService.부스목록();

        return new ModelAndView("/rental/rentalshowBooth", "booth", list);
    }

    @GetMapping("/return/returnshowBooth")
    public ModelAndView returnBoothList() {
        ArrayList<BoothDto> list = boothService.부스목록();

        return new ModelAndView("/return/returnshowBooth", "booth", list);
    }
}