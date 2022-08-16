package com.bjscar.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bjscar.businessman.model.service.BusinessmanService;
import com.bjscar.businessman.model.vo.Businessman;
import com.bjscar.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMan"})
public class BusinessController {
	@Autowired
	private BusinessmanService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/business/enroll.do")
	public String businessEnroll() {
		return "member/businessEnrollpage";
	}
	
	
	@RequestMapping("/business/enrollEnd.do")
	public String businessEnrollEnd(Businessman man,Model m) {
		man.setBmPassword(pwEncoder.encode(man.getBmPassword()));
		int result = service.insertBusinessman(man);
		System.out.println(man);
		m.addAttribute("businessmans",result);
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입 성공";
			loc="/";
		}else {
			msg="회원가입 실패";
			loc="business/enroll.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
		
	
	}
	//아이디체크
	@ResponseBody
	@RequestMapping("/businessman/idCheck.do")
	public Businessman idCheck(Businessman man) {
		return  service.idCheck(man);
		
		
	}
	//로그인페이지가기
	@RequestMapping("/businessman/login.do")
	public String login() {
		return "member/businessLoginPage";
	}
	
	//로그인 등록
	@RequestMapping("/businessman/loginEnd.do")
	public String loginEnd(@RequestParam(value="saveId", required = false)String saveId,
            @RequestParam(value="bmId")String bmId,
            HttpServletResponse response,Businessman man,Model model)  {
		
		
		if(saveId!=null) {
			Cookie idCookie = new Cookie("saveId", bmId);
				idCookie.setMaxAge(60*60*24*7);
		    response.addCookie(idCookie);
		}else {
			Cookie idCookie = new Cookie("saveId",bmId);
			idCookie.setMaxAge(0);
			response.addCookie(idCookie);
		}
		Businessman loginMan = service.selectMan(man);
		
		String viewName="redirect:/";
		System.out.println(loginMan);
		
		if(loginMan!=null) {
			//로그인성공
			model.addAttribute("loginMan",loginMan);
			
		}else {
			//로그인실패
			 model.addAttribute("msg","로그인실패!");
			 model.addAttribute("loc","/");
			 viewName="common/msg";
		}
		
		return viewName;
		
	
	}
	
	//로그아웃
		@RequestMapping("/businessman/logout")
		//Model에서 @SessionAttributes값으로 session을 관리할때는
		//SessionStatus객체를 이용해서 관리한다.
		//public String logout(HttpSession session) {
		public String logout(SessionStatus status) {
			if(!status.isComplete()) {
				status.setComplete();//session데이터 삭제
			}
			//session.invalidate();
			return "redirect:/";
		}
}
