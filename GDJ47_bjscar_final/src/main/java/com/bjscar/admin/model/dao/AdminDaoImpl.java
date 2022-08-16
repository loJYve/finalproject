package com.bjscar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.businessman.model.vo.Businessman;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;
@Repository
public class AdminDaoImpl implements AdminDao {

	
	
	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberList");
	}
	
	@Override
	public List<Member> selectMemberListPage(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("member.selectMemberList",null,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberCount");
	}
	
	@Override
	public List<Member> getSearchList(SqlSessionTemplate session, Map param, Member m){
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
//		return session.selectList("member.selectSearchList2",m);
		return session.selectList("member.selectSearchList2",m,new RowBounds((offSet-1)*limit,limit));
	}
	

	@Override
	public int selectSearchMemberCount(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectSearchMemberCount",m);
	}
	
	
	//businessman
	
	@Override
	public List<Businessman> selectBusinessmanList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("businessman.selectBusinessmanList");
	}
	
	@Override
	public List<Businessman> selectBusinessmanListPage(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("businessman.selectBusinessmanList",null,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectBusinessmanCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("businessman.selectBusinessmanCount");
	}
	
	@Override
	public List<Businessman> selectSearchBusinessman(SqlSessionTemplate session, Map param, Businessman b) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("businessman.selectSearchBusinessman",b,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectSearchBusinessmanCount(SqlSessionTemplate session, Businessman b) {
		// TODO Auto-generated method stub
		return session.selectOne("businessman.selectSearchBusinessmanCount",b);
	}
	
	
	//secessionmember
	@Override
	public List<SecessionMember> selectSecessionMemberList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("secessionmember.selectSecessionMemberList");
	}
	
	@Override
	public List<SecessionMember> selectSecessionMemberListPage(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("secessionmember.selectSecessionMemberList",null,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectSecessionMemberCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("secessionmember.selectSecessionMemberCount");
	}
	
	@Override
	public List<SecessionMember> selectSearchSecessionMember(SqlSessionTemplate session, Map param, SecessionMember s) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("secessionmember.selectSearchSecessionMember",s,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectSearchSecessionMemberCount(SqlSessionTemplate session, SecessionMember s) {
		// TODO Auto-generated method stub
		return session.selectOne("secessionmember.selectSearchSecessionMemberCount",s);
	}

	
	

}
