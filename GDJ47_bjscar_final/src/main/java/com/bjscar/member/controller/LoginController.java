package com.bjscar.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	//로그인페이지
		@RequestMapping("/loginPage")
		public String loginPage() {
			return "member/loginPage";
		}
		
}
