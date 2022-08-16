package com.bjscar.plan.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.plan.model.dao.PlanDao;
import com.bjscar.plan.model.vo.Plan;

@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanDao dao;
    
    @Autowired
    SqlSession session;
	
	@Override
	public int insertPlan(Plan p) {
		
		return dao.insertPlan(session,p);
	}

}
