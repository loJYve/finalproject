package com.bjscar.board.controller;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.board.model.service.BoardService;
import com.bjscar.board.model.vo.Board;
import com.bjscar.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
		
	@Autowired
	private BoardService service;

	@RequestMapping("/boardList.do")
	public ModelAndView selectBoardList(@RequestParam(name="cPage",defaultValue="1") int cPage,
			@RequestParam(name="numPerpage",defaultValue="5")int numPerpage,ModelAndView mv) {
		Map param=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Board> list=service.selectBoardListPage(param);
		mv.addObject("boards",list);
		int totalData=service.selectBoardCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, numPerpage, cPage, "boardList.do"));
		// /WEB-INF/views/viewName.jsp
		mv.setViewName("ibBoard/boardList");
		System.out.println(list);
		return mv;
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "ibBoard/boardWrite";
	}
	
	@RequestMapping("/boardWriteEnd.do")
	public String insertBoard(Board b,MultipartFile[] upFile,Model m,HttpServletRequest rs) {		
		//저장경로를 가져오기
		String path=rs.getServletContext().getRealPath("/resources/upload/board/");
		File uploadDir=new File(path);
		//폴더가 없으면 만들어주기
		if(!uploadDir.exists()) uploadDir.mkdirs();
		

		
		//다중파일 업로드
		List<Attachment> files=new ArrayList();
		if(upFile!=null) {
			for(MultipartFile f : upFile) {
				if(!f.isEmpty()) {
					//리네임드처리하기
					String originalFilename=f.getOriginalFilename();
					String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
					//리네임 명칭을 정할 값 설정
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rndNum=(int)(Math.random()*10000);
					String rename=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
					
					//업로드처리하기
					try{
						f.transferTo(new File(path+rename));
						//생성된 파일 list에 저장하기
						files.add(Attachment.builder().originalFilename(originalFilename).renamedFilename(rename).attachmentTitle(originalFilename).build());
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		//DB에 파일 저장하기
//		service.insert
		b.setFiles(files);
		String msg="";
		String loc="";
		try {
			service.insertBoard(b);
			msg="게시글입력성공";	
			loc="/boardList.do";
		}catch(RuntimeException e) {
			msg="게시글입력실패";
			loc="/boardWrite.do";
			for(Attachment a : b.getFiles()) {
				File deleteFile=new File(path+a.getRenamedFilename());
				if(deleteFile.exists()) deleteFile.delete();
			}
		}
		System.out.println(b.getFiles());
		System.out.println(b);
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/boardView.do")
	public ModelAndView getBoard(int no,ModelAndView mv) {
		
		mv.addObject("board",service.selectBoard(no));
		mv.setViewName("ibBoard/boardView");

		return mv;
	}
	
	@RequestMapping("/filedownload.do")
	public void filedownload(String oriname,String rename,HttpServletResponse res,
			HttpServletRequest req,@RequestHeader("User-agent") String header)  {
		String path=req.getServletContext().getRealPath("/resources/upload/board/");
		File saveFile=new File(path+rename);
		try(BufferedInputStream bis=new BufferedInputStream(new FileInputStream(saveFile));
				ServletOutputStream sos=res.getOutputStream();){
			
			boolean isMS=header.contains("Trident")||header.contains("MSIE");
			String encodeFilename="";
			if(isMS) {
				encodeFilename=URLEncoder.encode(oriname,"UTF-8");
				encodeFilename=encodeFilename.replaceAll("\\+","%20");
			}else {
				encodeFilename=new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			res.setContentType("application/octet-stream;charset=utf-8");
			res.setHeader("Content-Disposition", "attachment;filename=\""+encodeFilename+"\"");
			int read=-1;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
}

