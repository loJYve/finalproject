package com.bjscar.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import com.bjscar.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	/*
	 * @Autowired
	private MypageService service; */
	
	@RequestMapping("/rentaldata.do")
	/*public ModelAndView rentalData(ModelAndView mv) {
		//mv.addObject("rentalStatus", service.);
		mv.setViewName("/rentalData");
		return mv;
	}*/
	public String rentalData() {
		return "/mypage/rentalData";
	}
}
