package com.bjscar.longrental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjscar.longrental.service.LongRentalService;

@Controller
@RequestMapping("/longRental")
public class LongRentalController {

	@Autowired
	private LongRentalService service;
	
		@RequestMapping("/LRCarList.do")
		public String LRCarList() {
			
			
			return "longRental/LRCarList";
		}
		
		@RequestMapping("/LRCarDetail.do")
		public String LRCarDetail() {
			
			return "longRental/LRCarDetail";
		}
		
		@RequestMapping("/LRContractCondition.do")
		public String LRContractCondition() {
			
			return "longRental/LRContractCondition";
		}
		
		@RequestMapping("/LRFinish.do")
		public String LRFinish() {
			
			return "longRental/LRFinish";
		}
}
	
