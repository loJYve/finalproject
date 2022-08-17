package com.bjscar.member.controller;



import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bjscar.member.model.service.OAuthService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/oauth2/code")
public class KaKaoController {
	@Autowired
	private OAuthService kakao;
	
	
	
	@RequestMapping(value="/kakao")
	public String kakaoCallback(@RequestParam("code")String code,HttpSession session){
		String access_Token = kakao.getAccessToken(code);
	
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("nickName", userInfo.get("nickname"));
	        session.setAttribute("profile", userInfo.get("profile"));
	        session.setAttribute("access_Token", access_Token);
	    }
		return "member/kakaoLogin";
	}
	
	@RequestMapping("/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "index";
	}
}
