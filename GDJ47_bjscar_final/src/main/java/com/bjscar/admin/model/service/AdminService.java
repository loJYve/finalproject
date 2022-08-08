package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.member.model.vo.Member;

public interface AdminService {
	List<Member> selectMemberList();
	
	List<Member> selectMemberListPage(Map param);
	
	int selectMemberCount();
	
//	List<Member> getSearchList(Member m);
	
	//List<Member> searchMemberList(Member m);

	

	

	
	
}
