package com.bjscar.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.member.model.vo.Member;

public interface AdminService {
	List<Member> selectMemberList();
	
	List<Member> selectMemberListPage(Map param);
	
	int selectMemberCount();
}
