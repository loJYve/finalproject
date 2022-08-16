package com.bjscar.businessman.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.bjscar.businessman.model.vo.Businessman;

public interface BusinessmanDao {
   
	public int insertBusinessman(SqlSession session,Businessman man);
	
	public Businessman idCheck(SqlSession session,Businessman man);
	
	public Businessman selectMan(SqlSession session,Businessman man);
}
