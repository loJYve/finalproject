package com.bjscar.rental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	@RequestMapping("/rental.do")
	public String rental() {
		return "rental/rental";
	}
	
	@RequestMapping("/searchVehicle.do")
	public void searchVehicle(String vehicleGrade) {
		
	}

}
