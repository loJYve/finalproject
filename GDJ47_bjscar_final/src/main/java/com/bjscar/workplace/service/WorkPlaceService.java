package com.bjscar.workplace.service;

import java.util.List;
import java.util.Map;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface WorkPlaceService {
	
	Vehicle selectVehicleId(int no);
	
	List<Vehicle> selectRentalshopCarListPage(Map param);

	int selectRentalshopCarCount(int rentalshopId);

	int insertRentalshopCar(Vehicle v);
	
	//-----------------------------------------------------------------------------------------
	List<Rentalshop> selectRentalshop(String bmId);

	List<Rentalshop> selectRentalshopListPage(Map param);

//	int selectRentalshopCount();
	int selectRentalshopCount(String bmId);
	
	Rentalshop selectRentalshop(int no);
	
	int insertRentalshop(Rentalshop r);

	int updateRentalshopEnd(Map param);

	

	


	
	
	
	
}
