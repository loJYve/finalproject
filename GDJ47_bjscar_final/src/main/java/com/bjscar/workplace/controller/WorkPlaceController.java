package com.bjscar.workplace.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.common.PageFactory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
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

	@RequestMapping("/work/workplace.do")
	public ModelAndView selectMemberList(@RequestParam(name = "cPage", defaultValue = "1") int cPage,
			@RequestParam(name = "numPerpage", defaultValue = "5") int numPerpage, ModelAndView mv,String memberId) {
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Rentalshop> list = service.selectRentalshopListPage(param);
		mv.addObject("rentalshops", list);
//		int totalData = service.selectRentalshopCount(memberId);
		int totalData = service.selectRentalshopCount();
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, numPerpage, cPage, "/work/workplace.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("workplace/workplacePage");
		return mv;
	}
	
	

	@RequestMapping("/work/workplaceView.do")
	public ModelAndView workplaceView(int no, ModelAndView mv) {
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
				loc = "/work/workplace.do";
				
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

}
