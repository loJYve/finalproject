package com.bjscar.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.admin.model.service.AdminService;
import com.bjscar.common.PageFactory;
import com.bjscar.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired 
	private AdminService service;

	/*
	 * @RequestMapping("/admin.do") public String mainPage() { return
	 * "admin/memberList"; }
	 */
	
	@RequestMapping("/admin.do")
	public ModelAndView selectMemberList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Member> list=service.selectMemberListPage(param);
		mv.addObject("members",list);
		int totalData=service.selectMemberCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "admin.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("admin/memberList");
		return mv;
	}
				
	
}
