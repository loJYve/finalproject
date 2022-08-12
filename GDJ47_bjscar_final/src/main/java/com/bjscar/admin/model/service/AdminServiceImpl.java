package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.admin.model.dao.AdminDao;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;
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
	public List<Member> getSearchList(Map param, Member m){
		return dao.getSearchList(session, param, m);
	}
	
	@Override
	public List<SecessionMember> selectSecessionMemberList(){
		return dao.selectSecessionMemberList(session);
	}
	
	@Override
	public List<SecessionMember> selectSecessionMemberListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectSecessionMemberListPage(session, param);
	}

	@Override
	public List<SecessionMember> selectSecessionMemberListPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectSearchMemberCount(Member m) {
		// TODO Auto-generated method stub
		return dao.selectSearchMemberCount(session, m);
	}
	

	
}
