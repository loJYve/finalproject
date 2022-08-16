package com.bjscar.plan.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bjscar.plan.model.vo.Plan;

@Repository
public class PlanDaoImpl implements PlanDao {

	@Override
	public int insertPlan(SqlSession session, Plan p) {
		
		return session.insert("plan.insertPlan",p);
	}

}
