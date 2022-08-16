package com.bjscar.longrental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjscar.longrental.service.LongRentalService;
import com.bjscar.vehicle.model.vo.Vehicle;

@Controller
@RequestMapping("/longRental")
public class LongRentalController {

	@Autowired
	private LongRentalService service;
	
		@RequestMapping("/LRCarList.do")
		public String LRCarList() {
			
			
			return "longRental/LRCarList";
		}
		
		@RequestMapping("/LRCarSelect.do")
		public List<Vehicle> LRCarSelect(){
			
			List<Vehicle> vl = service.LRCarSelect();
			
			
			return vl;
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
	
