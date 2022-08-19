package com.bjscar.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.member.model.vo.Member;
import com.bjscar.mypage.model.vo.PurchaseDataList;
import com.bjscar.mypage.model.vo.RentalDataList;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MypageService {

	/*
	 * RentalHistory selectRentalData(String memberId);
	 * 
	 * 
	 * Attachment selectCarImage(int vehicleId);
	 * 
	 * Vehicle selectCarData(int vehicleId);
	 * 
	 * Rentalshop selectRentalshopData(int vehicleId);
	 */

	List<RentalHistory> selectrentalHistory(Map param);

	Member selectMember(String memberId);

	void memSecessionEnd(Map param);

	List<PurchaseDataList> selectPurchaseHistory(Map param);

	int selectPHCount(String memberId);

	int selectRHCount(String memberId);

	List<RentalDataList> selectRentalDataList(String memberId);

}
