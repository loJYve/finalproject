package com.bjscar.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bjscar.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
	
		return session.insert("member.insertMember",m);
	}
	
	@Override
	public Member selectMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember",m);
	}
	
	@Override
	public Member findByMemberId(String userId,SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectFindByMemberId",userId);
	}

}
