package com.bjscar.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bjscar.plan.model.service.PlanService;
import com.bjscar.plan.model.vo.Plan;

@Controller
@SessionAttributes({"plan"})
public class SuggestController {
    @Autowired
    private PlanService service;
	
	
	@RequestMapping("/suggest.do")
	public String suggest() {
		return "suggest/firstPlan2";
	}
	
	@RequestMapping("/suggest2.do")
	public String suggest2() {
		return "suggest/firstPlan";
	}
	
	@RequestMapping("/suggestEnd.do")
	public String insertPlan(Plan p,Model model) {
		
		int plan = service.insertPlan(p);
		System.out.println(plan);
		String msg="";
		String loc="";
		model.addAttribute("plans",plan);
		if(plan>0) {
			//성공
			msg="감사합니다. BJSCAR 관리자 입니다. "
					+ " 문의 주신 귀하의 번호로 1~3일 사이에 연락 드리겠습니다. ";
			loc="/";
			
		}else {
			//실패
			msg="입력실패";
			loc="/suggest.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	//지도창 
	@RequestMapping("/suggestMap.do")
	public String map() {
		return "suggest/map";
	}
	//로드뷰
	@RequestMapping("/suggestlodView.do")
	public String lodView() {
		return "suggest/lodView";
	}
	//테스트
	@RequestMapping("/suggestTest.do")
	public String test() {
		return "suggest/test";
	}
}
