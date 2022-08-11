package com.bjscar.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService service; 
	@Autowired
	private HttpSession session;
	@Autowired
	private Member loginMember = (Member)session.getAttribute("loginMember"); 
	
	@RequestMapping("/rentaldata.do")
	public ModelAndView rentalData(ModelAndView mv) {
		mv.addObject("rentalStatus", service.selectRentalData());
		mv.setViewName("/rentalData");
		return mv;
	}
	
	
	@RequestMapping("/rentalhistory.do")
	public String rentalHistory() {
		return "/mypage/rentalHistory";
	}
	
	@RequestMapping("/purchasehistory.do")
	public String purchaseHistory() {
		return "/mypage/purchaseHistory";
	}
	
	@RequestMapping("/faq.do")
	public String faq() {
		return "/mypage/faq";
	}
}
