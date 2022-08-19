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
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.service.RentalService;
import com.bjscar.rental.model.vo.PurchaseHistory;
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
			
			mv.addObject("msg", "결제완료!");
			mv.addObject("loc", "/");
		} catch (Exception e) {
//			e.printStackTrace();
			mv.addObject("msg", "결제실패!");
			mv.addObject("loc", "/rental/rental.do");
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		mv.setViewName("common/msg");
		return mv;
	}

}
