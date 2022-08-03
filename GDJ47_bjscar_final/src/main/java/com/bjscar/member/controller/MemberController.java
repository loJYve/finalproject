package com.bjscar.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjscar.member.model.service.MemberService;
import com.bjscar.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
     
	@Autowired
	private MemberService service;
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/memberEnroll.do")
	   public String enrollLoginPage() {
		   return "member/memberEnroll2";
	   }
	
			
	@RequestMapping("/enrollMemberEnd.do")
	public String enroll(Member m,Model mv) {
		int result = service.insertMember(m);
		System.out.println(m);
		mv.addAttribute("members",result);
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입 성공";
			loc="/";
		}else {
			msg="회원가입 실패";
			loc="member/memberEnroll.do";
		}
		mv.addAttribute("msg",msg);
		mv.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	//아이디체크
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public Member idCheck(Member m) {
		return service.selectMember(m);
	}
	
	
	
}
