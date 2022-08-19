package com.bjscar.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.admin.model.service.AdminService;
import com.bjscar.admin.model.vo.Admin;
import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.businessman.model.vo.Businessman;
import com.bjscar.common.PageFactory;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

@Controller
@SessionAttributes({"loginAdmin"})
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
	  private ModelAndView getSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword,
			  ModelAndView mv,@RequestParam(name="cPage",defaultValue="1") int cPage, @RequestParam(name="numPerpage",defaultValue="5") int numPerpage) throws Exception { 
		  Member m = new Member();
		  Map param=Map.of("cPage",cPage,"numPerpage",numPerpage, "type",type, "keyword",keyword);
		  List<Member> list=service.getSearchList(param,m);
		  mv.addObject("members",list);
		  int totalData=service.selectSearchMemberCount(m);
		  mv.addObject("totalContents",totalData);
		  mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "getSearchList?type="+type+"&keyword="+keyword));
		  mv.setViewName("admin/getSearchList"); 
		  return mv; 
	  }
	 
	
	@RequestMapping("/business.do")
	public ModelAndView selectBusinessmanList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Businessman> list=service.selectBusinessmanListPage(param);
		mv.addObject("businessmans",list);
		int totalData=service.selectBusinessmanCount();
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
		int totalData=service.selectSecessionMemberCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "secession.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("admin/secessionList");
		return mv;
	}
	

   @RequestMapping("/admin/login.do")
	public String login() {
	   return "member/adminLoginpage";
   }
   
   @RequestMapping("/admin/loginEnd.do")
   public String loginEnd(Admin a,Model model) {
	  Admin loginAdmin = service.selectAdmin(a);
		
		String viewName="redirect:/";
		System.out.println(loginAdmin);
		
		if(loginAdmin!=null) {
			//로그인성공
			model.addAttribute("loginAdmin",loginAdmin);
			
		}else {
			//로그인실패
			 model.addAttribute("msg","로그인실패!");
			 model.addAttribute("loc","/");
			 viewName="common/msg";
		}
		
		return viewName;
		
	
   }
 //로그아웃
 		@RequestMapping("/admin/logout")
 		//Model에서 @SessionAttributes값으로 session을 관리할때는
 		//SessionStatus객체를 이용해서 관리한다.
 		//public String logout(HttpSession session) {
 		public String logout(SessionStatus status) {
 			if(!status.isComplete()) {
 				status.setComplete();//session데이터 삭제
 			}
 			//session.invalidate();
 			return "redirect:/";
 		}
 		
 		@RequestMapping("/permisson.do")
 		public String permisson(Model m) {
 			System.out.println("zz");
 			String msg="";
 			String loc="";
 			try {
 				service.updateBusinessman(m);
 				msg="승인완료";	
 				loc="/business.do";
 			}catch(RuntimeException e) {
 				msg="승인실패";
 				loc="/business.do";
 			}
 			m.addAttribute("msg",msg);
 			m.addAttribute("loc",loc);
 			
 			
 			return "common/msg";
 		}
 	    
 	    
 			
 
}
