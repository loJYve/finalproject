package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

public interface AdminService {
	List<Member> selectMemberList();
	
	List<Member> selectMemberListPage(Map param);
	
	int selectMemberCount();
	
	List<Member> getSearchList(Member m);
	
	//List<Member> searchMemberList(Member m);

	List<SecessionMember> selectSecessionMemberList();
	
	List<SecessionMember> selectSecessionMemberListPage();

	List<SecessionMember> selectSecessionMemberListPage(Map param);
	

	
	
}
