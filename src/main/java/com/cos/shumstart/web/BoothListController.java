package com.cos.shumstart.web;

import java.util.ArrayList;

import com.cos.shumstart.web.boothmodel.BoothDto;
import com.cos.shumstart.web.boothmodel.BoothDataDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoothListController {

    @Autowired
    private BoothDataDao boothDataDao;

    @GetMapping("/main/showBooth")
    public ModelAndView boothList() {
        ArrayList<BoothDto> list = boothDataDao.getDataAll();

        return new ModelAndView("/main/showBooth", "booth", list);
    }
}