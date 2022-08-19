package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bjscar.admin.model.vo.Admin;
import com.bjscar.businessman.model.vo.Businessman;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

public interface AdminService {
	List<Member> selectMemberList();
	
	List<Member> selectMemberListPage(Map param);
	
	int selectMemberCount();
	
	List<Member> getSearchList(Map param);
	
	int selectSearchMemberCount(Map param);
	
	//businessman
	List<Businessman> selectBusinessmanList();
	
	List<Businessman> selectBusinessmanListPage(Map param);
	
	int selectBusinessmanCount();
	
	List<Businessman> selectSearchBusinessman(Map param, Businessman b);
	
	int selectSearchBusinessmanCount(Businessman b);
	
	
	//secessionmember
	List<SecessionMember> selectSecessionMemberList();
	
	List<SecessionMember> selectSecessionMemberListPage(Map param);
	
	int selectSecessionMemberCount();
	
	List<SecessionMember> selectSearchSecessionMember(Map param, SecessionMember s);
	
	int selectSearchSecessionMemberCount(SecessionMember s);

	Admin selectAdmin(Admin a);
	

	int updateBusinessman(String bmId);
	
	int updateBusinessman2(String bmId);
	
	
}
