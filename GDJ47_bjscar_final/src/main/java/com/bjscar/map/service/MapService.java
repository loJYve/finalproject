package com.bjscar.map.service;

import java.util.List;
import java.util.Map;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MapService {

	List<Rentalshop> searchRentalshop();
	int selectVehicleCount(int no);
	List<Vehicle> selectRentalshop(Map param, int no);	
	List<Vehicle> searchBar(Map param);
	int searchVehicleCount(Map param);
	List<Vehicle> searchSearchRentalShop(Map param);
	int searchSearchRentalShopCount(Map param);
}
