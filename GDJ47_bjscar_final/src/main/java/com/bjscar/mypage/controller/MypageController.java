package com.bjscar.mypage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.common.PageFactory;
import com.bjscar.mypage.model.service.MypageService;
import com.bjscar.mypage.model.vo.RentalHistory;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService service; 
	
	
	
	@RequestMapping("/rentaldata.do")
	public ModelAndView rentalData(@RequestParam String memberId, ModelAndView mv) {
		//mv.addObject("rentalStatus", service.selectRentalData(memberId));
		
		try {
			/*
			 * RentalHistory rh=service.selectRentalData(memberId); 
			 * mv.addObject("carImage",service.selectCarImage(rh.getVehicleId())); 
			 * mv.addObject("carData",service.selectCarData(rh.getVehicleId()));
			 * mv.addObject("rentalshopData",service.selectRentalshopData(rh.getVehicleId()));
			 */
			mv.addObject("rentalDataList", service.selectRentalDataList(memberId));
		} catch (NullPointerException e) {
			
		}
	
		mv.setViewName("/mypage/rentalData");
		return mv;
	}
	
	
	@RequestMapping("/rentalhistory.do")
	public ModelAndView rentalHistory(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage, @RequestParam String memberId, ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage,"memberId",memberId);
		
		mv.addObject("rentalHistory", service.selectrentalHistory(param));
		
		int totalData=service.selectRHCount(memberId);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "rentalhistory.do?memberId="+memberId));
		
		mv.setViewName("/mypage/rentalHistory");
		
		return mv;
	}
	
	@RequestMapping("/purchasehistory.do")
	public ModelAndView purchaseHistory(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage, @RequestParam String memberId, ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage,"memberId",memberId);	
		mv.addObject("purchasehistory", service.selectPurchaseHistory(param));
		System.out.println(service.selectPurchaseHistory(param));
		int totalData=service.selectPHCount(memberId);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "purchasehistory.do?memberId="+memberId));
		
		mv.setViewName("/mypage/purchaseHistory");
		return mv;
	}
	
	@RequestMapping("/faq.do")
	public String faq() {
		return "/mypage/faq";
	}
	
	@RequestMapping("/memberdata.do")
	public ModelAndView memberData(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject("memberData", service.selectMember(memberId));
		
		mv.setViewName("/mypage/memberData");
		
		return mv;
	}
	
	@RequestMapping("/secession.do")
	public String memSecession(@RequestParam String memberId, ModelAndView mv) {
		
		return "/mypage/secession";
	}
	
	@RequestMapping("/secessionEnd.do")
	public ModelAndView memSecessionEnd(@RequestParam String memberId, @RequestParam String secessionReason,
			ModelAndView mv, SessionStatus status) {
		if(secessionReason==null||secessionReason=="") {
			secessionReason="사유없음";
		}
		Map param = Map.of("memberId",memberId,"secessionReason",secessionReason);
		
		service.memSecessionEnd(param);
		
		if(!status.isComplete()) {
			status.setComplete();//session데이터 삭제
		}
		
		mv.addObject("msg", "탈퇴 완료");
		mv.addObject("loc", "/");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/updateMember.do")
	public ModelAndView updateMember(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject("msg", "정보 수정 완료");
		mv.addObject("loc", "/");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	
	@RequestMapping("/enrolllisence.do")
	public ModelAndView enrollLisence(@RequestParam String memberId, ModelAndView mv) {
		
		mv.addObject(mv);
		
		//mv.setViewName(mv);
		
		
		return mv;
	}

}
