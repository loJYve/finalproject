package com.bjscar.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.member.model.vo.Member;
@Repository
public class AdminDaoImpl implements AdminDao {

	
	
	@Override
	public List<Member> findAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.findAll");
	}

}
