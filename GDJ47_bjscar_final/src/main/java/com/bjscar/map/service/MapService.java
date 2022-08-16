package com.bjscar.map.service;

import java.util.List;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MapService {

	List<Rentalshop> searchRentalshop();
	
	List<Vehicle> selectRentalshop(int no);
	
}
