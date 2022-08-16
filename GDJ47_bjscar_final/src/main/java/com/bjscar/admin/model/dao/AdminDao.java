package com.bjscar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.member.model.vo.Member;
import com.bjscar.member.model.vo.SecessionMember;

public interface AdminDao {
	List<Member> selectMemberList(SqlSessionTemplate session);
	
	List<Member> selectMemberListPage(SqlSessionTemplate session,Map param);
	
	int selectMemberCount(SqlSessionTemplate session);

	List<Member> getSearchList(SqlSessionTemplate session, Map param, Member m);
	
	List<SecessionMember> selectSecessionMemberList(SqlSessionTemplate session);
	
	List<SecessionMember> selectSecessionMemberListPage(SqlSessionTemplate session,Map param);

	int selectSearchMemberCount(SqlSessionTemplate session, Member m);
	
	
}
