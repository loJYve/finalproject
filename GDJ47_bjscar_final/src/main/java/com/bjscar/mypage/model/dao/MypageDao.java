package com.bjscar.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.PurchaseDataList;
import com.bjscar.mypage.model.vo.RentalDataList;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MypageDao {

	/*
	 * RentalHistory selectRentalData(SqlSessionTemplate session, String memberId);
	 * 
	 * 
	 * Attachment selectCarImage(SqlSessionTemplate session, int vehicleId);
	 * 
	 * Vehicle selectCarData(SqlSessionTemplate session, int vehicleId);
	 * 
	 * Rentalshop selectRentalshopData(SqlSessionTemplate session, int vehicleId);
	 */

	List<RentalHistory> selectrentalHistory(SqlSessionTemplate session, Map param);

	Member selectMember(SqlSessionTemplate session, String memberId);

	void memSecessionEnd(SqlSessionTemplate session, Map param);

	List<PurchaseDataList> selectPurchaseHistory(SqlSessionTemplate session, Map param);

	int selectPHCount(SqlSessionTemplate session, String memberId);

	int selectRHCount(SqlSessionTemplate session, String memberId);

	List<RentalDataList> selectRentalDataList(SqlSessionTemplate session, String memberId);
}
