package com.bjscar.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.admin.model.dao.AdminDao;
import com.bjscar.member.model.vo.Member;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	@Override
	public List<Member> selectMembers() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
