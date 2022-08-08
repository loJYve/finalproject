package com.bjscar.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bjscar.member.model.vo.Member;

public interface MemberDao {
   
	
	public int insertMember(SqlSession session,Member m);
	
	 Member selectMember(SqlSession session,Member m);
	
	Member findByMemberId(String userId,SqlSession session);
	
	Member findId(SqlSession session,Member m);
	
	Member findPw(SqlSession session,Map param);
}
