package com.bjscar.mypage.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.service.MypageService;
import com.bjscar.mypage.model.vo.RentalHistory;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService service; 
	
	
	
	@RequestMapping("/rentaldata.do")
	public ModelAndView rentalData(@RequestParam String memberId, ModelAndView mv) {
		mv.addObject("rentalStatus", service.selectRentalData(memberId));
		
		try {
			RentalHistory rh=service.selectRentalData(memberId);
			 mv.addObject("carImage", service.selectCarImage(rh.getVehicleId()));
			 mv.addObject("carData", service.selectCarData(rh.getVehicleId()));
			 mv.addObject("rentalshopData", service.selectRentalshopData(rh.getVehicleId()));
		} catch (NullPointerException e) {
			
		}
	
		mv.setViewName("/mypage/rentalData");
		return mv;
	}
	
	
	@RequestMapping("/rentalhistory.do")
	public ModelAndView rentalHistory(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject("rentalHistory", service.selectrentalHistory(memberId));
		
		mv.setViewName("/mypage/rentalHistory");
		
		return mv;
	}
	
	@RequestMapping("/purchasehistory.do")
	public ModelAndView purchaseHistory(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject("rentalHistory", service.selectrentalHistory(memberId));
		
		mv.setViewName("/mypage/purchaseHistory");
		return mv;
	}
	
	@RequestMapping("/faq.do")
	public String faq() {
		return "/mypage/faq";
	}
	
	@RequestMapping("/memberdata.do")
	public ModelAndView memberData(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject("memberData", service.selectMember(memberId));
		
		mv.setViewName("/mypage/memberData");
		
		return mv;
	}
}
