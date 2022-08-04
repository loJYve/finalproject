package com.bjscar.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bjscar.member.model.service.MemberService;
import com.bjscar.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class LoginController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	//로그인페이지
		@RequestMapping("/memberPage.do")
		public String loginPage() {
			return "member/loginPage";
		}
		
	@RequestMapping("/login.do")
	public String login(Member m,Model model) {
		Member loginMember = service.selectMember(m);
		String viewName="redirect:/";
		System.out.println(loginMember);
	
		if(loginMember!=null) {
			//로그인성공
			model.addAttribute("loginMember",loginMember);
		}else {
			//로그인실패
			 model.addAttribute("msg","로그인실패!");
			 model.addAttribute("loc","/");
			 viewName="common/msg";
		}
		
		return viewName;
		
	}
}
