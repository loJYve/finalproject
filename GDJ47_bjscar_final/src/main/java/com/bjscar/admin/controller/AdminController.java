package com.bjscar.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjscar.admin.model.service.AdminService;
import com.bjscar.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired 
	private AdminService service;

	@RequestMapping("/admin.do")
	public String mainPage() {
		return "admin/memberList";
	}
	
	@RequestMapping("/admin/all")
	@ResponseBody
	public List<Member> getStudent(){
		return service.selectMembers();
	}
}
