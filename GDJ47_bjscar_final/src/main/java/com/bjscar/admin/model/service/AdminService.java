package com.bjscar.admin.model.service;

import java.util.List;

import com.bjscar.member.model.vo.Member;

public interface AdminService {
	List<Member> selectMembers();
}
