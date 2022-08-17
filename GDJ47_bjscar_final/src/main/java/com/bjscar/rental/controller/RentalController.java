package com.bjscar.rental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjscar.rental.model.service.RentalService;
import com.bjscar.vehicle.model.vo.Vehicle;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	@Autowired(required = false)
	private RentalService service;
	
	@RequestMapping("/rental.do")
	public String rental() {
		return "rental/rental";
	}
	
	@RequestMapping("/searchVehicleByGrade.do")
	@ResponseBody
	public List<Vehicle> searchVehicleByGrade(String vehicleGrade) {
		return service.searchVehicleByGrade(vehicleGrade);
	}

}
