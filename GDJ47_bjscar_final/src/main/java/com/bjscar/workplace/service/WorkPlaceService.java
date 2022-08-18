package com.bjscar.workplace.service;

import java.util.List;
import java.util.Map;

import com.bjscar.rentalshop.model.vo.Rentalshop;

public interface WorkPlaceService {

	List<Rentalshop> selectRentalshop();

	List<Rentalshop> selectRentalshopListPage(Map param);

	int selectRentalshopCount();
//	int selectRentalshopCount(String memberId);
	
	Rentalshop selectRentalshop(int no);
	
	int insertRentalshop(Rentalshop r);

	
	
	
}
