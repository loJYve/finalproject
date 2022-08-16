package com.bjscar.businessman.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bjscar.businessman.model.vo.Businessman;

@Repository
public class BusinessmanDaoImpl implements BusinessmanDao {

	@Override
	public int insertBusinessman(SqlSession session, Businessman man) {
        //.인데 ,으로해서
		return session.insert("businessman.insertBusinessman",man);
	}
   
	
	@Override
	public Businessman idCheck(SqlSession session, Businessman man) {
		// TODO Auto-generated method stub
		return session.selectOne("businessman.idCheck",man);
	}
	
	@Override
	public Businessman selectMan(SqlSession session, Businessman man) {
		// TODO Auto-generated method stub
		return session.selectOne("businessman.selectMan",man);
	}
}
