package com.bjscar.board.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.board.model.vo.Board;

public interface BoardService {
	
	List<Board> selectBoardList();
	
	List<Board> selectBoardListPage(Map param);	
	
	int selectBoardCount();
	
	int insertBoard(Board b);

}
