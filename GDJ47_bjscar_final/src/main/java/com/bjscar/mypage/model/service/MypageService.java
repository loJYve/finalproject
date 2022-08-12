package com.bjscar.mypage.model.service;

import java.util.List;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;


public interface MypageService {

	RentalHistory selectRentalData(String memberId);

	Attachment selectCarImage(int vehicleId);

	Vehicle selectCarData(int vehicleId);

	Rentalshop selectRentalshopData(int vehicleId);

	List<RentalHistory> selectrentalHistory(String memberId);

	
}
