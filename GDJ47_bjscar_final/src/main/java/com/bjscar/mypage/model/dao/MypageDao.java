package com.bjscar.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MypageDao {

	RentalHistory selectRentalData(SqlSessionTemplate session, String memberId);

	Attachment selectCarImage(SqlSessionTemplate session, int vehicleId);

	Vehicle selectCarData(SqlSessionTemplate session, int vehicleId);

	Rentalshop selectRentalshopData(SqlSessionTemplate session, int vehicleId);

	List<RentalHistory> selectrentalHistory(SqlSessionTemplate session, String memberId);

	Member selectMember(SqlSessionTemplate session, String memberId);
}
