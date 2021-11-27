package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.handler.ex.CustomValidationException;
import com.cos.shumstart.service.AuthService;
import com.cos.shumstart.service.SendEmailService;
import com.cos.shumstart.service.UserService;
import com.cos.shumstart.web.dto.MailDto;
import com.cos.shumstart.web.dto.auth.FindPasswordDto;
import com.cos.shumstart.web.dto.auth.SignupDto;
import lombok.RequiredArgsConstructor;
import net.bytebuddy.implementation.bind.annotation.BindingPriority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.text.StyledEditorKit;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller // 1.IoC 2. 파일을 리턴하는 컨트롤러
public class AuthController {

    private final AuthService authService;
    private final SendEmailService sendEmailService;
    private final UserService userService;


    //로그인실패에 대한 처리를 위한 params처리
    @GetMapping("/auth/signin")
    public String signinForm(@RequestParam(value="error",required = false)String error,
                             @RequestParam(value ="exception",required = false)String exception,
                             Model model)
    {
        model.addAttribute("error",error);
        System.out.println(exception);
        return "/auth/signin";
    }

    @GetMapping("/auth/signup")
    public String signupForm() {
        return "/auth/signup";
    }

    // 회원가입버튼 -> /auth/signup -> /auth/signin
    @PostMapping("/auth/signup")
    public String signup(@Valid SignupDto signupDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = new HashMap<>();

            for (FieldError error : bindingResult.getFieldErrors()) {
                errorMap.put(error.getField(), error.getDefaultMessage());
            }
            throw new CustomValidationException("유효성 검사 실패함", errorMap);

        } else {
            User user = signupDto.toEntity();
            User userEntity = authService.회원가입(user);
            return "/auth/signin";
        }
    }

    //비밀번호찾기 페이지 get매핑
    @GetMapping("/auth/find_password")
    public String FindPassword(){
        return "/auth/findpassword";
    }

    //실제 유저의 아이디와 이름 데이터가 넘어와 체크하는 컨트롤러
    @PostMapping("/auth/find_password")
    @ResponseBody
    public Map<String,Boolean> Check_account(FindPasswordDto findPasswordDto){

        System.out.println("유저정보체크중...");
        Map<String,Boolean> check_result=new HashMap<>();
        boolean result= authService.비밀번호찾기확인(findPasswordDto);

        check_result.put("check",result);

        return check_result;


    }

    //임시비밀번호를 이메일통해 보내는 기능
    @GetMapping("/auth/find_password/send_email")
    @ResponseBody
    public Map<String,Boolean>Send_tmp_password(String userId){

        boolean check_send;
        System.out.println("임시비밀번호발급 이메일 전송중..");
        Map<String,Boolean> json=new HashMap<>();

        User userEntity=authService.유저정보_유저네임으로_찾기(userId);
        MailDto mailDto=sendEmailService.createMail(userEntity.getEmail(),userEntity.getName(),"tmp_password");



        try{
            sendEmailService.mailSend(mailDto);
            userService.비번수정(userEntity.getUsername(),mailDto.getRandom_result());
            check_send=true;
        }catch(Exception e){
            e.printStackTrace();
            check_send=false;
        }
        json.put("check",check_send);

        return json;

    }

    @GetMapping("/instruction/history")//회사취지 설명 페이지보여줌
    public String show_instruction(){
        return "auth/instructionPage";
    }

    @GetMapping("/instruction/service")//회사취지 설명 페이지보여줌
    public String show_instruction_service(){
        return "auth/instructionPage_todolist";
    }
}
