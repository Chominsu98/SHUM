package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.service.*;
import com.cos.shumstart.web.dto.CMRespDto;
import com.cos.shumstart.web.dto.MailDto;
import com.cos.shumstart.web.dto.auth.PwchangeDto;
import com.cos.shumstart.web.dto.auth.UserUpdateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.crypto.BadPaddingException;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final RentalService rentalService;
    private final AuthService authService;
    private final VoucherService voucherService;
    private final UserService userService;
    private final SendEmailService sendEmailService;

    private MailDto mailDto;

    @GetMapping({"/","/main", "/main/mainPage","/main/rentalStateTrue", "/main/rentalStateFalse"})
    public String main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        boolean state = userEntity.isState();

        if(state == true) {
            return "/main/rentalStateTrue";
        }
        else {
            return "/main/rentalStateFalse";
        }
    }

    //계정정보 수정을 위한 페이지
    @GetMapping("/main/myPageAccount")
    public String mypageAccount(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model){
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        model.addAttribute("user", userEntity);

        return "/main/myPageAccount";
    }

    //실질적으로 ajax로 보내지면 업데이트가 되어지는 api
    @PutMapping("/main/myPageAccount/update")
    @ResponseBody//애초에 반환타입을 jsp파일이 아닌 데이터이니까
    public CMRespDto<?> update(@AuthenticationPrincipal PrincipalDetails principalDetails, UserUpdateDto userUpdateDto){
        User userEntity=userService.회원수정(principalDetails.getUser().getId(),userUpdateDto.toEntity());

        principalDetails.setUser(userEntity);

        return new CMRespDto<User>(1,"회원수정완료",userEntity);
    }

    @GetMapping("/main/myPageAccount/sendmail")
    @ResponseBody
    public Map<String,Boolean> sendEmail(@AuthenticationPrincipal PrincipalDetails principalDetails,Boolean send){
        User userEntity=principalDetails.getUser();

        MailDto dto=sendEmailService.createMail(userEntity.getEmail(),userEntity.getName(),"change_password");

        mailDto=dto;
        Map<String,Boolean> json=new HashMap<>();
        boolean check_success=true;
        try{
            sendEmailService.mailSend(dto);
        }catch (Exception e){
            e.printStackTrace();
            check_success=false;
        }
        json.put("check",check_success);
        return json;
    }

    //고객이메일로 난수인증번호를 보내고 인증번호 체크
    @PostMapping("/main/myPageAccount/checknum")
    @ResponseBody
    public Map<String,Boolean> sendEmailandCheck(String user_input_num){



        Map<String,Boolean> json=new HashMap<>();
        boolean verifyCheck=mailDto.getRandom_result().equals(user_input_num);

        System.out.println("사용자가 입력한 번호의 비교관계:"+verifyCheck);
        json.put("check",verifyCheck);

        return json;

    }

    @PostMapping("/main/myPageAccount/changePassword")
    @ResponseBody
    public Map<String,Boolean> changePw(@AuthenticationPrincipal PrincipalDetails principalDetails, PwchangeDto pwchangeDto){
        System.out.println("비밀번호체크");
        boolean result;
        BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
        String session_pw=principalDetails.getUser().getPassword();

        if(!encoder.matches(pwchangeDto.getOld_password(),session_pw)){//현재 입력된 번호가 유저의 패스워드와 일치하지 않을 때
            result=false;//json으로 실패됐음을 보내줌
        }
        else{
            //그게 아닐경우 비번수정을 디비에 반영하고 json으로 성공여부를 보냄
            User userEntity=userService.비번수정(principalDetails.getUser().getUsername(),pwchangeDto.getNew_password());
            principalDetails.setUser(userEntity);

            result=true;

        }
        Map<String,Boolean> json=new HashMap<>();
        json.put("check",result);

        return json;
    }

    @GetMapping("/main/myPage")
    public String myPage(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
        User userEntity = authService.유저정보(principalDetails.getUser().getId());

        model.addAttribute("user", userEntity);

        if(userEntity.isState() == true) {
            Rental rentalEntity = rentalService.대여정보(userEntity.getId());

            model.addAttribute("umbrella", rentalEntity);
        }

        if(userEntity.isHaveTicket() == true) {
            Voucher voucherEntity = voucherService.이용권정보(userEntity.getId());

            model.addAttribute("voucher", voucherEntity);
        }
        return "/main/myPage";
    }


}
