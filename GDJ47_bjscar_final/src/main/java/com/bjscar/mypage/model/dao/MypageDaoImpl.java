package com.bjscar.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public RentalHistory selectRentalData(SqlSessionTemplate session, String memberId) {
		
		return session.selectOne("mypage.selectRentalData", memberId);
	}

	@Override
	public Attachment selectCarImage(SqlSessionTemplate session, int vehicleId) {
		return session.selectOne("mypage.selectCarImage", vehicleId);
	}
	
	@Override
	public Vehicle selectCarData(SqlSessionTemplate session, int vehicleId) {
		return session.selectOne("mypage.selectCarData", vehicleId);
	}
	
	@Override
	public Rentalshop selectRentalshopData(SqlSessionTemplate session, int vehicleId) {
		return session.selectOne("mypage.selectRentalshopData", vehicleId);
	}
	
	@Override
	public List<RentalHistory> selectrentalHistory(SqlSessionTemplate session, String memberId) {
		return session.selectList("mypage.selectrentalHistory", memberId);
	}
	
	@Override
	public Member selectMember(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectMember", memberId);
	}
}
