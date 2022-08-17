package com.bjscar.rental.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.common.PageFactory;
import com.bjscar.rental.model.service.RentalService;
import com.bjscar.vehicle.model.vo.Vehicle;

@Controller
@RequestMapping("/rental")
public class RentalController {


	
	@Autowired
	   private RentalService service;


	
	@RequestMapping("/rental.do")
	public String rental() {
		return "rental/rental";
	}
	
//	@RequestMapping("/searchVehicleByGrade.do")
//	@ResponseBody
//	public List<Vehicle> searchVehicleByGrade(String vehicleGrade) {
//		return service.searchVehicleByGrade(vehicleGrade);
//	}
	@RequestMapping("/searchVehicleByGrade.do")
	@ResponseBody
	public ModelAndView searchVehicleByGrade(String vehicleGrade, @RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5") int numPerpage, ModelAndView mv) throws Exception {
		Map param=Map.of("vehicleGrade",vehicleGrade, "cPage",cPage,"numPerpage",numPerpage);
		List<Vehicle> list = service.searchVehicleByGrade(param);
		mv.addObject("vehicles",list);
		int totalData=service.selectSearchvehicleCount(vehicleGrade);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "searchVehicleByGrade.do?vehicleGrade="+vehicleGrade+"&numPerpage=10"));
		mv.setViewName("rental/vehicleChoice");
		return mv;
	}

}
