package com.bjscar.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.admin.model.service.AdminService;
import com.bjscar.common.PageFactory;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

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
	@GetMapping("/getSearchList")
	@ResponseBody
	private List<Member> getSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword,Model model) throws Exception{
		Member m = new Member();
		m.setType(type);
		m.setKeyword(keyword);
		return service.getSearchList(m);
	}	
	
	@RequestMapping("/business.do")
	public ModelAndView selectMemberList2(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Member> list=service.selectMemberListPage(param);
		mv.addObject("members",list);
		int totalData=service.selectMemberCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "business.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("admin/businessList");
		return mv;
	}
	
	@RequestMapping("/secession.do")
	public ModelAndView selectSecessionMemberList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<SecessionMember> list=service.selectSecessionMemberListPage(param);
		mv.addObject("secessionmembers",list);
		int totalData=service.selectMemberCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "secession.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("admin/secessionList");
		return mv;
	}
	
}
