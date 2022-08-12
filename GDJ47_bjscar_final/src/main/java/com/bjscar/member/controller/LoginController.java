package com.bjscar.member.controller;


import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.member.model.service.MemberService;
import com.bjscar.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class LoginController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	//로그인페이지
		@RequestMapping("/memberPage.do")
		public String loginPage() {
			return "member/loginPage2";
		}
		
	@RequestMapping("/login.do")
	public String login(@RequestParam(value="saveId", required = false)String saveId,
			            @RequestParam(value="memberId")String memberId,
			            HttpServletResponse response,Member m,Model model) {
		
		
		if(saveId!=null) {
			Cookie idCookie = new Cookie("saveId", memberId);
				idCookie.setMaxAge(60*60*24*7);
		    response.addCookie(idCookie);
		}else {
			Cookie idCookie = new Cookie("saveId",memberId);
			idCookie.setMaxAge(0);
			response.addCookie(idCookie);
		}
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
	
	//로그아웃
	@RequestMapping("/logout")
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
	
//	//에러페이지
//	@RequestMapping("/error.do")
//	
	//아이디찾기페이지
	@RequestMapping("/searchId.do")
	public String searchIdPage() {
		return "member/searchId";
	}
	
	//비밀번호찾기페이지
	@RequestMapping("/searchpw.do")
	public String searchPwPage() {
		return "member/searchPw";
	}
	
	/*
	 * //아이디찾기,method = RequestMethod.POST
	 * 
	 * @RequestMapping(value = "/searchIdEnd.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public Member findId(Member m) { // @RequestParam("name")
	 * String name,@RequestParam("email") String email // Map param =
	 * Map.of("name",name,"email",email);
	 * 
	 * Member result = service.findId(m); System.out.println(result); return result;
	 * 
	 * }
	 */
	//아이디찾기 FORM
	@RequestMapping("/searchIdEnd.do")
	public ModelAndView findId(Member m,ModelAndView mv) {
		Member id = service.findId(m);
//		System.out.println(id);
	
		mv.addObject("id",id);
		mv.setViewName("/member/searchIdEnd");
		
		return mv;
	}
	
	
	//비밀번호찾기 FROM
	@RequestMapping(value = "/searchPwEnd.do", method = RequestMethod.POST)
	public ModelAndView findPw(@RequestParam(value="memberId") String memberId,
			                   @RequestParam(value="email") String email,ModelAndView mv) {
		Map param = Map.of("id",memberId,"email",email);
	
		Member pw = service.findPw(param);
		System.out.println(pw);
		
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

	    
		if(pw!=null) {
//			mv.addObject("email",pw.getEmail()); throws IOException
			
			/* 이메일 보내기 */
	        String setFrom = "dydtjdeowkd@naver.com";
	        String toMail = email;
	        String title = "BJSCAR 비밀번호변경 인증 이메일 입니다.";
	        String content = 
	                "BJSCAR 홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "비밀번호 변경인증 번호는 " + checkNum + "입니다." + 
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
	        mv.setViewName("member/checkPwMail");
	        mv.addObject("checkNum",checkNum);
	        mv.addObject("email", email);
	        mv.addObject("memberId",memberId);
	        return mv;
	     
	     }else {
			mv.setViewName("member/searchPw");
			return mv;
		}
	  }
//	//인증번호 넘기기 
//	@RequestMapping(value = "/confirmPw.do", method = RequestMethod.POST)
//	public String confirmPw(@RequestParam(value="emailConfirm")String emailConfirm,
//			                @RequestParam(value="checkNum")String checkNum) {
//		if(emailConfirm.equals(checkNum)) {
//			
//			return "member/changePw";
////			 mv.setViewName("member/changePw");
////             
////             mv.addObject("email",email);
//		}else {
////			mv.setViewName("member/searchPw");
//			return "member/searchPw";
//		}
////		return mv;
//	}
	//새비밀번호설정
	
//	@RequestMapping(value = "/pwChange.do", method = RequestMethod.POST)
//	public String pwChange(Member m,HttpSession session) {
//		
//		
//		int result = service.pwChange(m);
//		
//		if(result==1) {
//		
//			return "member/loginPage2";
//		}else {
//			System.out.println("updatePw"+ result);
//			return "member/changePw";
//		}
//		
//	}
}
