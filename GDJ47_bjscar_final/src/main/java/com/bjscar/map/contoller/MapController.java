package com.bjscar.map.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.map.service.MapService;
import com.bjscar.rentalshop.model.vo.Rentalshop;

@Controller
public class MapController {
	
	@Autowired
	private MapService service;
	
	@RequestMapping("/map/searchRentalshop")
	public ModelAndView searchRentalshop(ModelAndView mv) {
		
		
		List<Rentalshop> rl = service.searchRentalshop();
		
		for(Rentalshop r : rl) {
			System.out.println(r);
		}
		mv.addObject("rl", rl);
		mv.setViewName("/map/map");
		return mv;
	}
	
		//ModelAndView mv = new ModelAndView();
		
		
//		Map param=Map.of("cPage",cPage);
//		List<Rentalshop> rl = service.selectBoardListPage(param);
//		mv.addObject("rl", rl);
//		// /WEB-INF/views/viewName.jsp
//		int totalData=service.selectBoardCount();
//		mv.addObject("totalContents",totalData);
//		mv.setViewName("board/boardList");
		
	
	

}
