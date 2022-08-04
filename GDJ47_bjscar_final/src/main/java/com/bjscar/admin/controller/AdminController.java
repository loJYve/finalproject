package com.bjscar.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
public class AdminController {

	@RequestMapping("/admin.do")
	public String mainPage() {
		return "admin/memberList";
	}
}
