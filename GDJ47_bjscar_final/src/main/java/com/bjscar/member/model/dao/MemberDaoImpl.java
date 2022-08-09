package com.bjscar.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public Member findId(SqlSession session,Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findId",m);
	}
    @Override
    public Member findPw(SqlSession session,Map param) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.findPw",param);
    }
    @Override
    public int pwChange(SqlSession session,Map param) {
    	// TODO Auto-generated method stub
    	return session.update("member.pwChange",param);
    }
    
    @Override
    public Member idcheck(SqlSession session, Member m) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.idcheck",m);
    }
}
