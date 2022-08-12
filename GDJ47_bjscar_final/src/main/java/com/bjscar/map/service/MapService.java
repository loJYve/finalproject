package com.bjscar.map.service;

import java.util.List;

import com.bjscar.rentalshop.model.vo.Rentalshop;

public interface MapService {

	List<Rentalshop> searchRentalshop();
	
	public int selectVehicleCount();
	
}
