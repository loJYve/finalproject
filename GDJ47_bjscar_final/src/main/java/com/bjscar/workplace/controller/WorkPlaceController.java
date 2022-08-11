package com.bjscar.workplace.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.common.PageFactory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.workplace.service.WorkPlaceService;

@Controller
public class WorkPlaceController {
	
	@Autowired
	private WorkPlaceService service;
	
	/*
	 * @RequestMapping("/work/workplace.do") public String buisnessman() { return
	 * "workplace/workplacePage"; }
	 */
	

	@RequestMapping("/work/workplace.do")
	public ModelAndView selectMemberList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Rentalshop> list=service.selectRentalshopListPage(param);
		mv.addObject("rentalshops",list);
		int totalData=service.selectRentalshopCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "/work/workplace.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("workplace/workplacePage");
		return mv;
	}
	
	@RequestMapping("/work/workplaceView.do")
	public ModelAndView workplaceView(int no,ModelAndView mv) {
		mv.addObject("rentalshop",service.selectRentalshop(no));
		mv.setViewName("workplace/workView");
		
		return mv;
	}
	
}
