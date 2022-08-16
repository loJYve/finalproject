package com.bjscar.map.contoller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.common.PageFactory;
import com.bjscar.map.service.MapService;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Controller
public class MapController {
	
	@Autowired
	private MapService service;
	
	@RequestMapping("/map/mapRentalshop.do")
	@ResponseBody
	public List<Rentalshop> toMap( ModelAndView mv) {
		
		List<Rentalshop> rl = service.searchRentalshop();
		/*
		 * List<Rentalshop> rl = service.searchRentalshop(); for(Rentalshop r : rl) {
		 * System.out.println(r); }
		 * 
		 * mv.addObject("rl", rl); mv.setViewName("map/maptest");
		 */
		
		return rl;
	}
	/*

	*/		
			
	@RequestMapping("/map/mapview.do")
	public String mapView() {
		return "map/map";
	}
	
	@RequestMapping("/map/searchRentalshop.do")
	@ResponseBody
	public ModelAndView searchRentalshop(ModelAndView mv) {
		
		List<Rentalshop> rl = service.searchRentalshop();
		
		mv.addObject("rl", rl);
		mv.setViewName("map/searchRentalshop");
		
		
		return mv;
	}
	/*
	@RequestMapping("/map/showRentalshop.do")
	public String mapTest() {
		return "map/showRentalshop";
	}
	*/
	@RequestMapping("/map/showRentalshop.do")
	@ResponseBody
	public ModelAndView showRentalshop(ModelAndView mv,int no){
		//System.out.println(no);
		List<Vehicle> v=service.selectRentalshop(no);
		System.out.println(v);
		mv.addObject("vl",v);
		mv.setViewName("map/showRentalshop");
		
		return mv;
	}

		
	
	

}
