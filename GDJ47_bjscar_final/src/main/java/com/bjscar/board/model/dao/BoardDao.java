package com.bjscar.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList(SqlSessionTemplate session);
	
	List<Board> selectBoardListPage(SqlSessionTemplate session,Map param);
		
	int selectBoardCount(SqlSessionTemplate session);
	
	int insertBoard(SqlSessionTemplate session,Board b);
	
	int insertAttachment(SqlSessionTemplate session,Attachment a);
	
	Board selectBoard(SqlSessionTemplate session,int no);

}
