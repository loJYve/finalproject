package com.bjscar.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.dao.MypageDao;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MypageDao dao;
	
	@Override
	public RentalHistory selectRentalData(String memberId) {
		return dao.selectRentalData(session, memberId);
	}

	@Override
	public Attachment selectCarImage(int vehicleId) {
		return dao.selectCarImage(session, vehicleId);
	}
	
	@Override
	public Vehicle selectCarData(int vehicleId) {
		return dao.selectCarData(session, vehicleId);
	}
	
	@Override
	public Rentalshop selectRentalshopData(int vehicleId) {
		return dao.selectRentalshopData(session, vehicleId);
	}
	
	@Override
	public List<RentalHistory> selectrentalHistory(String memberId) {
		return dao.selectrentalHistory(session, memberId);
	}
	
	@Override
	public Member selectMember(String memberId) {
		return dao.selectMember(session, memberId);
	}
	
	@Override
	public void memSecessionEnd(Map param)  {
		dao.memSecessionEnd(session, param);
	}
}
