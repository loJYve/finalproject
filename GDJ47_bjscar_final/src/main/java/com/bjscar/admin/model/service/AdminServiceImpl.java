package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bjscar.admin.model.dao.AdminDao;
import com.bjscar.admin.model.vo.Admin;
import com.bjscar.businessman.model.vo.Businessman;
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
	public int selectSearchMemberCount(Member m) {
		// TODO Auto-generated method stub
		return dao.selectSearchMemberCount(session, m);
	}
	
	
	
	
	//businessman
	@Override
	public List<Businessman> selectBusinessmanList() {
		// TODO Auto-generated method stub
		return dao.selectBusinessmanList(session);
	}
	@Override
	public List<Businessman> selectBusinessmanListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectBusinessmanListPage(session, param);
	}
	@Override
	public int selectBusinessmanCount() {
		// TODO Auto-generated method stub
		return dao.selectBusinessmanCount(session);
	}
	@Override
	public List<Businessman> selectSearchBusinessman(Map param, Businessman b) {
		// TODO Auto-generated method stub
		return dao.selectSearchBusinessman(session, param, b);
	}
	@Override
	public int selectSearchBusinessmanCount(Businessman b) {
		// TODO Auto-generated method stub
		return dao.selectSearchBusinessmanCount(session, b);
	}
	
	
	
	//secessionmember
	@Override
	public List<SecessionMember> selectSecessionMemberList() {
		// TODO Auto-generated method stub
		return dao.selectSecessionMemberList(session);
	}
	@Override
	public List<SecessionMember> selectSecessionMemberListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectSecessionMemberListPage(session, param);
	}
	@Override
	public int selectSecessionMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectSecessionMemberCount(session);
	}
	@Override
	public List<SecessionMember> selectSearchSecessionMember(Map param, SecessionMember s) {
		// TODO Auto-generated method stub
		return dao.selectSearchSecessionMember(session, param, s);
	}
	@Override
	public int selectSearchSecessionMemberCount(SecessionMember s) {
		// TODO Auto-generated method stub
		return dao.selectSearchSecessionMemberCount(session, s);
	}
	
	@Override
	public Admin selectAdmin(Admin a) {
		// TODO Auto-generated method stub
		return dao.selectAdmin(session,a);
	}
	
	
	@Override
	public int updateBusinessman(Model m) {
		return dao.updateBusinessman(session, m);
	}
	

	
}
