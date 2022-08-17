package com.bjscar.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.PurchaseHistory;
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
	public List<RentalHistory> selectrentalHistory(SqlSessionTemplate session, Map param) {
		
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("mypage.selectrentalHistory",param,
				new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public Member selectMember(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectMember", memberId);
	}
	
	@Override
	public void memSecessionEnd(SqlSessionTemplate session, Map param) {
		session.insert("mypage.memSecessionEnd", param);
		session.update("mypage.secessionMemData", param);
	}
	
	@Override
	public List<PurchaseHistory> selectPurchaseHistory(SqlSessionTemplate session, Map param) {
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("mypage.selectPurchaseHistory",param,
				new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int selectPHCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectPHCount", memberId);
	}
	
	@Override
	public int selectRHCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectRHCount", memberId);
	}
	
	
	
	
}
