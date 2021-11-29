package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.RentalService;
import com.cos.shumstart.service.VoucherService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class VoucherController {

    private final AuthService authService;
    private final VoucherService voucherService;
    private final RentalService rentalService;

    //지불방법페이지
    @GetMapping("/charge/payway")
    public String Payway(){return "/charge/payway";}

    //이용권종류페이지-현재 안 쓸 예정
    @GetMapping("/charge/sortofticket")
    public String SortofTicketForm(){return "/charge/sortofticket";}

    //결제완료후 보여주는 결제내역페이지
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

    //연체료 발생시 결제되는 상황후 디비에서 연체료 삭제할려는 상황
    @PostMapping("/charge/QRcodePage")
    public Map<String,Boolean> paying_latefee_info(@AuthenticationPrincipal PrincipalDetails principalDetails,String finish_paying){
        boolean check;
        Map<String,Boolean> json=new HashMap<>();
        try{
            voucherService.연체료삭제(principalDetails.getUser().getId());
            check=true;
        }catch (Exception e){
            e.printStackTrace();
            check=false;
        }
        json.put("check",check);

        return json;
    }

    //결제페이지 GET 매핑
    @GetMapping("/charge/payform")
    public String Payform(@AuthenticationPrincipal PrincipalDetails principalDetails,Model model){
        User user=principalDetails.getUser();
        model.addAttribute("user",user);
        return "/charge/payform";
    }

    //결제페이지 POST매핑
    @PostMapping("/charge/payform")
    public String buyVoucher(@Valid String ticketType, @AuthenticationPrincipal PrincipalDetails principalDetails,Model model) {
        //혹시나 이미 티켓이 있는데 또 구매를 할 수도 있으니 막는다
        if(principalDetails.getUser().isHaveTicket()){
            return "redirect:/";
        }
        voucherService.이용권구매(principalDetails.getUser().getId(), ticketType);

        //결제날짜에 대한 정보를 전달해주기 위해
        SimpleDateFormat date_format=new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");

        Date time=new Date();

        String paying_date=date_format.format(time);

        //티켓타입별로 결제가격을 알려주기 위해서
        //가격변동시 수정
        int price;
        if(ticketType.equals("프리Edition일일권")){
            price=2000;
        }
        else{
            price=1500;
        }
        model.addAttribute("ticketType",ticketType);
        model.addAttribute("ticket_price",price);
        model.addAttribute("paying_date",paying_date);
        return "/charge/payresult";
    }


}
