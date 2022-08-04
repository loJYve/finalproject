package com.bjscar.admin.model.dao;

import java.util.List;

import com.bjscar.member.model.vo.Member;

public interface AdminDao {
	List<Member> findAll();

}
