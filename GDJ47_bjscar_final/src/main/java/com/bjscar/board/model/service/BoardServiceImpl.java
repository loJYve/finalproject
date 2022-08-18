package com.bjscar.board.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.board.model.dao.BoardDao;
import com.bjscar.board.model.vo.Board;
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardDao dao;
	
	
	@Override
	public List<Board> selectBoardList() {
		return dao.selectBoardList(session);
	}

	@Override
	public List<Board> selectBoardListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectBoardListPage(session, param);
	}


	@Override
	public int selectBoardCount() {
		// TODO Auto-generated method stub
		return dao.selectBoardCount(session);
	}
	
	@Override
	//@Transactional은 트렌젝션처리할 메소드 선언부에 설정
	@Transactional
	public int insertBoard(Board b) throws RuntimeException{
		int result=0;
		try {
			result=dao.insertBoard(session,b);
			if(result>0&&b.getFiles()!=null) {
				for(Attachment a: b.getFiles()) {
					a.setAttachmentId(b.getIbPostId());
					result=dao.insertAttachment(session,a);
					dao.ibinsertboard(session);

				}
			}
		}catch(RuntimeException e) {
			throw new RuntimeException("입력실패");
		}
		return result;
	}
	
	@Override
	public Board selectBoard(int no) {
		// TODO Auto-generated method stub
		return dao.selectBoard(session,no);
	}

}
