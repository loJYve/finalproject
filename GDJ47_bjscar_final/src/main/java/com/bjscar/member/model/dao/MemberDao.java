package com.bjscar.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.bjscar.member.model.vo.Member;

public interface MemberDao {
   
	
	public int insertMember(SqlSession session,Member m);
	
	 Member selectMember(SqlSession session,Member m);
	
	Member findByMemberId(String userId,SqlSession session);
}
