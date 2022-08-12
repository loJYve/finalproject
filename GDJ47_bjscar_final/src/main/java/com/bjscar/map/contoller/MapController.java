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
	
	@RequestMapping("/map/searchRentalshop")
	@ResponseBody
	public List<Rentalshop> moveRentalshop(@RequestParam(defaultValue="1") int cPage,@RequestParam(name="numPerpage",
			defaultValue="5") int numPerpage, ModelAndView mv) {
		
		
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Rentalshop> rl = service.searchRentalshop();
		List<Vehicle> vl = service.selectVehicle();
		mv.addObject("rl", rl);
		// /WEB-INF/views/viewName.jsp
		int totalData=service.selectVehicleCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("vl",vl);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "boardList.do"));
		mv.setViewName("map/map");
		
		return rl;
	}
	
	@RequestMapping("/map/mapview")
	public String mapView() {
		return "map/map";
	}
	
	@RequestMapping("/map/maptest")
	public String mapTest() {
		return "map/maptest";
	}
	
	@RequestMapping("/map/maptest2")
	public String mapTest2() {
		return "map/maptest2";
	}
	
		
		

		
	
	

}
