package com.bjscar.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.member.model.vo.Member;

public interface AdminDao {
	List<Member> findAll(SqlSessionTemplate session);

}
