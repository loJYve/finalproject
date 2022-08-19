package com.bjscar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.bjscar.admin.model.vo.Admin;
import com.bjscar.businessman.model.vo.Businessman;
import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

public interface AdminDao {
	List<Member> selectMemberList(SqlSessionTemplate session);
	
	List<Member> selectMemberListPage(SqlSessionTemplate session,Map param);
	
	int selectMemberCount(SqlSessionTemplate session);

	List<Member> getSearchList(SqlSessionTemplate session, Map param, Member m);

	int selectSearchMemberCount(SqlSessionTemplate session, Member m);
	
	//businessman
	List<Businessman> selectBusinessmanList(SqlSessionTemplate session);
	
	List<Businessman> selectBusinessmanListPage(SqlSessionTemplate session,Map param);
	
	int selectBusinessmanCount(SqlSessionTemplate session);

	List<Businessman> selectSearchBusinessman(SqlSessionTemplate session, Map param, Businessman b);
	
	int selectSearchBusinessmanCount(SqlSessionTemplate session, Businessman b);
	
	//secessionmember
	
	List<SecessionMember> selectSecessionMemberList(SqlSessionTemplate session);
	
	List<SecessionMember> selectSecessionMemberListPage(SqlSessionTemplate session,Map param);
	
	int selectSecessionMemberCount(SqlSessionTemplate session);

	List<SecessionMember> selectSearchSecessionMember(SqlSessionTemplate session, Map param, SecessionMember s);
	
	int selectSearchSecessionMemberCount(SqlSessionTemplate session, SecessionMember s);
	
	Admin selectAdmin(SqlSession session,Admin a);
	
	//permission
	
	int updateBusinessman(SqlSession session, String bmId);

	int updateBusinessman2(SqlSessionTemplate session, String bmId);
	
	
	
}
