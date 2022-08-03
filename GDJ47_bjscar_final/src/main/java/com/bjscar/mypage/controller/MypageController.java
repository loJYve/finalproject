package com.bjscar.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@RequestMapping("/rentaldata.do")
	public String rentalData() {
		return "mypage/rentalData";
	}
}
