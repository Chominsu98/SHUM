package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.service.ChargeService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final ChargeService chargeService;

    @GetMapping("/main/map")
    public String showMap(){return "/main/mapPage";}

    @GetMapping({"/","/main", "/main/rentalstatetrue", "/main/rentalstatefalse"})
    public String main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        boolean state = principalDetails.getUser().isState();
        if(state == true) {
            return "/main/rentalstatetrue_new";
        }
        else {
            return "/main/rentalstatefalse_new";
        }
    }

    //지불방법페이지
    @GetMapping("/charge/payway")
    public String Payway(){return "/charge/payway";}

    //이용권종류페이지
    @GetMapping("/charge/sortofticket")
    public String SortofTicketForm(){return "/charge/sortofticket";}

    //결제페이지
    @GetMapping({"charge/payform/day", "charge/payform/subscribe", "charge/payform/areaEdition"})
    public String Payform(){return "/charge/payform";}

    @GetMapping("/charge/charge")
    public String chargeForm() {
        return "/charge/payresult";
    }

    @PostMapping("/charge/charge")
    public String charge(@Valid Integer chargeMoney, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        chargeService.충전하기(chargeMoney.intValue(), principalDetails.getUser().getId());
        return "/charge/charge";
    }
}
