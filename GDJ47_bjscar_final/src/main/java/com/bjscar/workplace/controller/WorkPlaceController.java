package com.bjscar.workplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkPlaceController {
	
	@RequestMapping("/work/workplace.do")
	public String buisnessman() {
		return "workplace/workplacePage";
	}
	
}
