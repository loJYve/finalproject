package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.admin.model.dao.AdminDao;
import com.bjscar.member.model.vo.Member;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Member> selectMemberList() {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session);
	}
	
	@Override
	public List<Member> selectMemberListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMemberListPage(session, param);
	}
	
	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount(session);
	}
	
	@Override
	public List<Member> getSearchList(Member m){
		return dao.selectSearchList(session, m);
	}
	

	
}
