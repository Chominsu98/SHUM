package com.cos.shumstart.web;

import com.cos.shumstart.service.BoothService;
import com.cos.shumstart.web.dto.BoothDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class MapControlller {

    @Autowired
    private BoothService boothService;

    @GetMapping("/map/samplemap")
    public ModelAndView sampleMapForm() {

        ArrayList<BoothDto> list = boothService.부스목록();

        return new ModelAndView("/map/samplemap", "boothList", list);
    }

    @GetMapping("/map/nearBoothPage")
    public ModelAndView nearBoothForm() {
        ArrayList<BoothDto> list = boothService.부스목록();

        return new ModelAndView("/map/nearBoothPage", "boothList", list);
    }

}
