package com.bjscar.member.controller;




import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjscar.member.model.service.MemberService;

import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Controller
@RequestMapping("/member/")
public class CheckController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/checkPhone.do")
	@ResponseBody 
	// coolSMS 구현 로직 연결 
	public String sendSMS(@RequestParam(value="to") String to) throws CoolsmsException {  	
		return service.PhoneNumberCheck(to);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkMail.do", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

	
		/* 이메일 보내기 */
        String setFrom = "sun00314@naver.com";
        String toMail = email;
        String title = "BJSCAR 회원가입 인증 이메일 입니다.";
        String content = 
                "BJSCAR 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
	}
}
