package com.bjscar.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.dao.MypageDao;
import com.bjscar.mypage.model.vo.PurchaseDataList;
import com.bjscar.mypage.model.vo.RentalDataList;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MypageDao dao;
	
	/*
	 * @Override public RentalHistory selectRentalData(String memberId) { return
	 * dao.selectRentalData(session, memberId); }
	 * 
	 * @Override public Attachment selectCarImage(int vehicleId) { return
	 * dao.selectCarImage(session, vehicleId); }
	 * 
	 * @Override public Vehicle selectCarData(int vehicleId) { return
	 * dao.selectCarData(session, vehicleId); }
	 * 
	 * @Override public Rentalshop selectRentalshopData(int vehicleId) { return
	 * dao.selectRentalshopData(session, vehicleId); }
	 */
	
	@Override
	public List<RentalDataList> selectRentalDataList(String memberId) {
		return dao.selectRentalDataList(session, memberId);
	}
	
	@Override
	public List<RentalHistory> selectrentalHistory(Map param) {
		return dao.selectrentalHistory(session, param);
	}
	
	@Override
	public Member selectMember(String memberId) {
		return dao.selectMember(session, memberId);
	}
	
	@Override
	public RentalHistory selectrentalHistoryDetail(String rhId) {
		return dao.selectrentalHistoryDetail(session, rhId);
	}
	
	@Override
	public void memSecessionEnd(Map param)  {
		dao.memSecessionEnd(session, param);
	}
	@Override
	public List<PurchaseDataList> selectPurchaseHistory(Map param) {
		return dao.selectPurchaseHistory(session, param);
	}
	
	@Override
	public int selectPHCount(String memberId) {
		return dao.selectPHCount(session, memberId);
	}
	
	@Override
	public int selectRHCount(String memberId) {
		return dao.selectRHCount(session, memberId);
	}
	

}
