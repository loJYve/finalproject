package com.bjscar.rental.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.common.PageFactory;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.service.RentalService;
import com.bjscar.rental.model.vo.OverdueHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rental.model.vo.ReturnHistory;
import com.bjscar.vehicle.model.vo.Vehicle;

@Controller
@RequestMapping("/rental")
public class RentalController {


	
	@Autowired
	   private RentalService service;


	
	@RequestMapping("/rental.do")
	public String rental() {
		return "rental/rental";
	}
	
//	@RequestMapping("/searchVehicleByGrade.do")
//	@ResponseBody
//	public List<Vehicle> searchVehicleByGrade(String vehicleGrade) {
//		return service.searchVehicleByGrade(vehicleGrade);
//	}
	@RequestMapping("/searchVehicleByGrade.do")
	@ResponseBody
	public ModelAndView searchVehicleByGrade(String vehicleGrade, @RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5") int numPerpage, ModelAndView mv) throws Exception {
		Map param=Map.of("vehicleGrade",vehicleGrade, "cPage",cPage,"numPerpage",numPerpage);
		List<Vehicle> list = service.searchVehicleByGrade(param);
		mv.addObject("vehicles",list);
		int totalData=service.selectSearchvehicleCount(vehicleGrade);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "searchVehicleByGrade.do?vehicleGrade="+vehicleGrade+"&numPerpage=12"));
		mv.setViewName("rental/vehicleChoice");
		return mv;
	}
	
	@RequestMapping("/rentalEnd.do")
	public ModelAndView rentalEnd(ModelAndView mv, RentalHistory rh, @RequestParam(name="purchaseAmount") int purchaseAmount) throws Exception {
//		System.out.println(rh);
//		System.out.println(purchaseAmount);
		mv.addObject("rentalHistory",rh);
		mv.addObject("purchaseAmount",purchaseAmount);
		mv.setViewName("rental/purchase");
		return mv;
	}
	
	@RequestMapping("/purchase.do")
	@Transactional
	public ModelAndView purchase(RentalHistory rh, PurchaseHistory ph, ModelAndView mv) /* throws Exception */ {
//		System.out.println(rh);
//		System.out.println(ph);
//		System.out.println(purchaseAmount);
//		System.out.println(useMileage);
//		int resultRH = service.insertRentalHistory(rh);
//		int resultPH = service.insertPurchaseHistory(ph);
//		int resultV = service.updateVehicle(rh.getVehicleId());
		
//		if(!(resultRH>0)) {
//			throw new Exception("대여내역 저장 실패!");
//		}else if(!(resultPH>0)) {
//			throw new Exception("결제내역 저장 실패!");
//		}if(!(resultV>0)) {
//			throw new Exception("차량 대여상태 수정 실패!");
//		}else {
//			
//		}
		
		try {
			int resultRH = service.insertRentalHistory(rh);
			int resultPH = service.insertPurchaseHistory(ph);
			int resultV = service.updateVehicle(rh.getVehicleId());
			Map param=Map.of("rentalId",rh.getRentalId(), "purchaseId",ph.getPurchaseId());
			int resultRPH = service.insertRentalPurchaseHistory(param);
			Map paramM=Map.of("memberId",rh.getMemberId(), "purchaseId",ph.getPurchaseId(),"useMileage",ph.getUseMileage());
			int resultM = service.updateMember(paramM);
			
			mv.addObject("msg", "대여완료!");
			mv.addObject("loc", "/");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "대여실패!");
			mv.addObject("loc", "/rental/rental.do");
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/returnVehicle.do")
	public ModelAndView returnVehicle(ModelAndView mv, Member loginMember, RentalHistory rh) {
//		System.out.println(loginMember);
//		System.out.println(rh);
		Vehicle v = service.selectSearchvehicle(rh.getRentalId());
//		System.out.println(price);		
		mv.addObject("v", v);
		mv.addObject("loginMember", loginMember);
		mv.addObject("rh", rh);
		mv.setViewName("rental/return");
		return mv;
	}
	
	@RequestMapping("/returnVehicleEnd.do")
	@Transactional
	public ModelAndView returnVehicleEnd(ModelAndView mv, Member m, RentalHistory rh, PurchaseHistory ph, ReturnHistory returnh, OverdueHistory oh) {
		if(ph.getPurchaseAmount()>0) {
//			System.out.println(m);
//			System.out.println(rh);
//			System.out.println(ph);
//			System.out.println(returnh);
//			System.out.println(oh);
			mv.addObject("m", m);
			mv.addObject("rh", rh);
			mv.addObject("ph", ph);
			mv.addObject("returnh", returnh);
			mv.addObject("oh", oh);
			mv.setViewName("rental/returnPurchase");
		}else {
			try {
				int resultRH = service.updateRentalHistoryReturn(rh);
				int resultReturnH = service.insertReturnHistory(returnh);
				int resultV = service.updateVehicleReturn(rh.getVehicleId());
				
				mv.addObject("msg", "반납완료!");
				mv.addObject("loc", "/");
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "반납실패!");
				mv.addObject("loc", "/rental/return.do");
				
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/returnPurchaseEnd.do")
	@Transactional
	public ModelAndView returnPurchase(ModelAndView mv, Member m, RentalHistory rh, PurchaseHistory ph, ReturnHistory returnh, OverdueHistory oh) {
		try {
			int resultRH = service.updateRentalHistoryReturn(rh);
			int resultReturnH = service.insertReturnHistory(returnh);
			int resultV = service.updateVehicleReturn(rh.getVehicleId());
			oh.setReturnId(returnh.getReturnId());
			int resultOH = service.insertOverdueHistory(oh);
			int resultPH = service.insertPurchaseHistory(ph);
			Map param=Map.of("returnId",returnh.getReturnId(), "purchaseId",ph.getPurchaseId());
			int resultRPH = service.insertReturnPurchaseHistory(param);
			Map paramM=Map.of("memberId",rh.getMemberId(), "purchaseId",ph.getPurchaseId(),"useMileage",ph.getUseMileage());
			int resultM = service.updateMember(paramM);
			
			mv.addObject("msg", "반납완료!");
			mv.addObject("loc", "/");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "반납실패!");
			mv.addObject("loc", "/rental/return.do");
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		mv.setViewName("common/msg");
		return mv;
	}

}
