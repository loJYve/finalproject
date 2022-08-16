package com.bjscar.plan.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.bjscar.plan.model.vo.Plan;

public interface PlanDao {
  
	int insertPlan(SqlSession session,Plan p);
}
