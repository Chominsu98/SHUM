package com.cos.shumstart.service;

import com.cos.shumstart.web.dto.MailDto;
import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SendEmailService {

    private JavaMailSender mailSender;
    private static final String FROM_ADDRESS="shumservice123@gmail.com";

    public MailDto createMail(String userEmail,String name,String type){
        String random_str=getverifynum();
        MailDto mailDto=new MailDto();
        mailDto.setAddress(userEmail);

        if(type.equals("change_password")){//회원정보수정란에서 인증번호관련 이메일일 경우
            mailDto.setTitle(name+"님의 SHUM서비스의 인증번호 안내 이메일입니다.");
            mailDto.setMessage("안녕하세요.SHUM서비스 인증번호 안내 관련 이메일입니다.\n"+"["+name+"]"+"님의 인증번호는 "+random_str+" 입니다.");
        }
        else{//비밀번호찾기에서 임시비밀번호발급 관련 이메일 경우
            mailDto.setTitle(name+"님의 SHUM서비스의 임시비밀번호발급 안내 이메일입니다.");
            mailDto.setMessage("안녕하세요.SHUM서비스 임시비밀번호발급 안내 관련 이메일입니다.\n"+"["+name+"]"+"님의 임시비밀번호는 "+random_str+" 입니다.");
        }
        mailDto.setRandom_result(random_str);

        return mailDto;
    }

    public String getverifynum(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str="";

        int idx=0;
        for(int i=0;i<10;i++){
            idx=(int)(charSet.length*Math.random());
            str+=charSet[idx];
        }
        return  str;
    }

    public void mailSend(MailDto mailDto){
        System.out.println("이메일 전송완료");
        SimpleMailMessage message=new SimpleMailMessage();
        message.setTo(mailDto.getAddress());
        message.setFrom(SendEmailService.FROM_ADDRESS);
        message.setSubject(mailDto.getTitle());
        message.setText(mailDto.getMessage());

        mailSender.send(message);
    }

}
