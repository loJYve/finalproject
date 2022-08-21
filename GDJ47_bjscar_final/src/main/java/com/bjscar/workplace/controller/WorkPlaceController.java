package com.bjscar.workplace.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.common.PageFactory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;
import com.bjscar.workplace.service.WorkPlaceService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkPlaceController {

	
	@Autowired
	private WorkPlaceService service;

	/*
	 * @RequestMapping("/work/workplace.do") public String buisnessman() { return
	 * "workplace/workplacePage"; }
	 */

	@RequestMapping("/car/carview.do")
	public ModelAndView selectCarList(@RequestParam(name = "cPage", defaultValue = "1") int cPage,
			@RequestParam(name = "numPerpage", defaultValue = "5") int numPerpage, ModelAndView mv,@RequestParam int rentalshopId) {
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage,"rentalshopId",rentalshopId);
		List<Vehicle> list = service.selectRentalshopCarListPage(param);
		mv.addObject("vehicles", list);
		int totalData = service.selectRentalshopCarCount(rentalshopId);
//		int totalData = service.selectRentalshopCount();
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, numPerpage, cPage, "/car/carview.do?rentalshopId="+rentalshopId));
		// /WEB-INF/views/viewName.jsp
//		System.out.println(bmId);
		mv.setViewName("workplace/rentalshopCarview");
		return mv;
	}
	
	// 작성하는 페이지로 가는
		@RequestMapping("/car/insertRentalshopCar.do")
		public String insertRentalshopCarPage() {
			return "workplace/insertRentalshopCar";
		}
		
		
		@RequestMapping("/insertworkplaceCarEnd.do")
		public String insertRentalshopCar(Vehicle v, MultipartFile[] upFile, Model m, HttpServletRequest rs) {
			// int result = service.insertRentalshop(r);
			String path = rs.getServletContext().getRealPath("resources/upload/rentalshopCarImg/");
			File uploadDir = new File(path);
			// 폴더가 없으면 만들어주기
			if (!uploadDir.exists())
				uploadDir.mkdirs();

			// 다중파일 업로드
			List<Attachment> files = new ArrayList();
			if (upFile != null) {
				for (MultipartFile f : upFile) {
					if (!f.isEmpty()) {

						// 리네임드처리하기
						String originalFilename = f.getOriginalFilename();
						String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
						// 리네임 명칭을 정할값 설정
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
						int rndNum = (int) (Math.random() * 10000);
						String rename = sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;
						
						// 업로드처리하기
						try {
							f.transferTo(new File(path + rename));
							files.add(Attachment.builder().originalFilename(originalFilename).renamedFilename(rename).attachmentTitle(originalFilename)
									.build());
							
						} catch (IOException e) {
							e.printStackTrace();
						}
					}

				}

				v.setFiles(files);
				String msg = "";
				String loc = "";
				try {
					service.insertRentalshopCar(v);
					msg = "자동차등록완료!";
					loc = "/car/carview.do?rentalshopId="+v.getRentalshopId();
					
				} catch (RuntimeException e) {
					e.printStackTrace();
					msg = "등록실패!";
					loc = "/car/insertRentalshopCar.do";
					for (Attachment a : v.getFiles()) {
						File deleteFile = new File(path + a.getRenamedFilename());
						if (deleteFile.exists())
							deleteFile.delete();
					}
				}

				m.addAttribute("msg", msg);
				m.addAttribute("loc", loc);

			}
			System.out.println(v.getFiles());
			System.out.println(v);
			return "common/msg";

		}
		
		
		
	//-------------------------------------------------------------------------
	
	//랜탈샵등록
	//페이징
	@RequestMapping("/work/workplace.do")
	public ModelAndView selectMemberList(@RequestParam(name = "cPage", defaultValue = "1") int cPage,
			@RequestParam(name = "numPerpage", defaultValue = "5") int numPerpage, ModelAndView mv,@RequestParam String bmId) {
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage,"bmId",bmId);
		List<Rentalshop> list = service.selectRentalshopListPage(param);
		mv.addObject("rentalshops", list);
		int totalData = service.selectRentalshopCount(bmId);
//		int totalData = service.selectRentalshopCount();
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, numPerpage, cPage, "/work/workplace.do?bmId="+bmId));
		// /WEB-INF/views/viewName.jsp
//		System.out.println(bmId);
		mv.setViewName("workplace/workplacePage");
		return mv;
	}
	//자동차 상세보기  페이지
			@RequestMapping("/car/workplaceCarView.do")
			public ModelAndView workplaceCarView(@RequestParam int no, ModelAndView mv) {
				mv.addObject("vehicle", service.selectVehicleId(no));
				mv.setViewName("workplace/cardetial"); 
				
				System.out.println(no);
				System.out.println(service.selectVehicleId(no));
				return mv;
			}
	
	//렌탈샵 상세보기 페이지

	@RequestMapping("/work/workplaceView.do")
	public ModelAndView workplaceView(@RequestParam int no, ModelAndView mv) {
		mv.addObject("rentalshop", service.selectRentalshop(no));
		mv.setViewName("workplace/workView");
		
	    
	   
		System.out.println(no);
		System.out.println(service.selectRentalshop(no));
		return mv;
	}

	// 작성하는 페이지로 가는
	@RequestMapping("/work/insertRentalshop.do")
	public String insertRentalshopPage() {
		return "workplace/insertRentalshop";
	}

	@RequestMapping("/insertworkplaceEnd.do")
	public String insertRentalshop(Rentalshop r, MultipartFile[] upFile, Model m, HttpServletRequest rs) {
		// int result = service.insertRentalshop(r);
		String path = rs.getServletContext().getRealPath("resources/upload/rentalshopImg/");
		File uploadDir = new File(path);
		// 폴더가 없으면 만들어주기
		if (!uploadDir.exists())
			uploadDir.mkdirs();

		// 다중파일 업로드
		List<Attachment> files = new ArrayList();
		if (upFile != null) {
			for (MultipartFile f : upFile) {
				if (!f.isEmpty()) {

					// 리네임드처리하기
					String originalFilename = f.getOriginalFilename();
					String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
					// 리네임 명칭을 정할값 설정
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rndNum = (int) (Math.random() * 10000);
					String rename = sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;
					
					// 업로드처리하기
					try {
						f.transferTo(new File(path + rename));
						files.add(Attachment.builder().originalFilename(originalFilename).renamedFilename(rename).attachmentTitle(originalFilename)
								.build());
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}

			r.setFiles(files);
			String msg = "";
			String loc = "";
			try {
				service.insertRentalshop(r);
				msg = "렌탈샵등록!";
				loc = "/work/workplace.do?bmId="+r.getBmMember();
				
			} catch (RuntimeException e) {
				e.printStackTrace();
				msg = "등록실패!";
				loc = "/work/insertRentalshop.do";
				for (Attachment a : r.getFiles()) {
					File deleteFile = new File(path + a.getRenamedFilename());
					if (deleteFile.exists())
						deleteFile.delete();
				}
			}

			m.addAttribute("msg", msg);
			m.addAttribute("loc", loc);

		}
		System.out.println(r.getFiles());
		System.out.println(r);
		return "common/msg";

	}
	
	@RequestMapping("/work/updateRentalshop.do")
	public ModelAndView updateView(int no, ModelAndView mv) {
		
	
			mv.addObject("rentalshop", service.selectRentalshop(no));
			mv.setViewName("workplace/updateRentalshop");
		
		
		
		
		return mv;
	}
	
	@RequestMapping("/work/updateEndRentalshop.do")
	public String updateEndRentalshop (Model m,
			@RequestParam(name="rentalshopName")String rentalshopName,
			@RequestParam(name="rentalshopId")int rentalshopId,
			@RequestParam(name="rentalshopAddr")String rentalshopAddr,
			@RequestParam(name="latitude")String latitude,
			@RequestParam(name="longitude")String longitude,
			@RequestParam String bmId
			) {
		Map param=Map.of("rentalshopName",rentalshopName,
				"rentalshopId",rentalshopId,
				"rentalshopAddr",rentalshopAddr,
				"latitude",latitude,
				"longitude",longitude,
				"bmId",bmId);
		
		String msg = "";
		String loc = "";
		try {
			service.updateRentalshopEnd(param);
			msg="수정완료";
			loc="/work/workplace.do?bmId="+bmId;
			
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			msg = "등록실패!";
			loc = "/work/updateRentalshop.do";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);

		
		
		 return "common/msg";
	}
	
	
	
	
	
	
	

}
