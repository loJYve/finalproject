package com.bjscar.member.controller;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.member.model.service.MemberService;
import com.bjscar.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class PwCheckController {
	@Autowired
	private MemberService service;
	
	//인증번호 넘기기 
	@RequestMapping(value = "/confirmPw.do", method = RequestMethod.POST)
	public ModelAndView confirmPw(String emailConfirm,
			                @RequestParam(value="checkNum")String checkNum,
			                @RequestParam(value="email")String email,
			                @RequestParam(value="memberId")String memberId,ModelAndView mv) {
		if(emailConfirm.equals(checkNum)) {
//			request.setAttribute("email", email);
//			return "member/changePw";
			 mv.addObject("email",email);
			 mv.addObject("memberId",memberId);
			 mv.setViewName("member/changePw");
             
		}else {
			mv.setViewName("member/searchPw");
//			return "member/searchPw";
		}
		return mv;
	}
	@RequestMapping(value = "/pwChange.do", method = RequestMethod.POST)
	public String pwChange(String password,
			               @RequestParam(value="email")String email,
			               @RequestParam(value="memberId")String memberId,
			               Member m) {
//		m.setEmail(email);
//		m.setPassword(password);
//		@RequestParam(value="email")String email,
//        HttpServletRequest request,HttpServletResponse reponse,
//		
		Map param = Map.of("email",email,"password",password,"memberId",memberId);
		int result = service.pwChange(param);
		
		if(result>0) {
		
			return "member/loginPage2";
		}else {
			System.out.println("updatePw"+ result);
			return "member/changePw";
		}
		
	}
}
