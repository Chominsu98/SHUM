package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.service.AuthService;
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
public class VoucherController {

    private final AuthService authService;
    private final VoucherService voucherService;

    //지불방법페이지
    @GetMapping("/charge/payway")
    public String Payway(){return "/charge/payway";}

    //이용권종류페이지
    @GetMapping("/charge/sortofticket")
    public String SortofTicketForm(){return "/charge/sortofticket";}

    //결제페이지
    @GetMapping({"charge/payform/day", "charge/payform/subscribe", "charge/payform/areaEdition"})
    public String Payform(){return "/charge/payform";}

    @GetMapping("/charge/payresult")
    public String chargeForm() {
        return "/charge/payresult";
    }

    @GetMapping("/charge/QRcodePage")
    public String qrCodeForm(@AuthenticationPrincipal PrincipalDetails principalDetails,
                             Model model) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());
        Voucher voucherEntity = voucherService.이용권정보(principalDetails.getUser().getId());

        model.addAttribute("user", userEntity);
        model.addAttribute("voucher", voucherEntity);
        return "/charge/QRcodePage";
    }

    @PostMapping("/charge/payform")
    public String buyVoucher(@Valid String ticketType, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        voucherService.이용권구매(principalDetails.getUser().getId(), ticketType);

        return "/charge/payresult";
    }
}
