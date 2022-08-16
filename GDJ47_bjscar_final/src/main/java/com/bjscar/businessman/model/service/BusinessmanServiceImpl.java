package com.bjscar.businessman.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.businessman.model.dao.BusinessmanDao;
import com.bjscar.businessman.model.vo.Businessman;
@Service
public class BusinessmanServiceImpl implements BusinessmanService {
    @Autowired
    private BusinessmanDao dao;
    
    @Autowired
    SqlSession session;
	
	@Override
	public int insertBusinessman(Businessman man) {
		
		return dao.insertBusinessman(session,man);
	}
    
	@Override
	public Businessman idCheck(Businessman man) {
		// TODO Auto-generated method stub
		return dao.idCheck(session,man);
	}
	
	@Override
	public Businessman selectMan(Businessman man) {
		// TODO Auto-generated method stub
		return dao.selectMan(session,man);
	}
}
