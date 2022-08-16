package com.bjscar.longrental.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.vehicle.model.vo.Vehicle;

@Repository
public class LongRentalDaoImpl implements LongRentalDao{

//	@Override
//	public List<Board> selectBoardList(SqlSessionTemplate session) {
//		return session.selectList("board.selectBoardList");
//		
//	}
//	
	@Override
	public List<Vehicle> LRCarSelect(SqlSessionTemplate session){
		return session.selectList("");
	}
	
}
