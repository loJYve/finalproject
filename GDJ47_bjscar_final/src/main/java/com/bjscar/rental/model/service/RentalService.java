package com.bjscar.rental.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.OverdueHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rental.model.vo.ReturnHistory;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalService {

	List<Vehicle> searchVehicleByGrade(Map param);

	int selectSearchvehicleCount(String vehicleGrade);

	int insertRentalHistory(RentalHistory rh);

	int insertPurchaseHistory(PurchaseHistory ph);

	int updateVehicle(int vehicleId);

	int insertRentalPurchaseHistory(Map param);

	int updateMember(Map paramM);

	Vehicle selectSearchvehicle(int rentalId);

	int updateRentalHistoryReturn(RentalHistory rh);

	int insertReturnHistory(ReturnHistory returnh);

	int updateVehicleReturn(int vehicleId);

	int insertOverdueHistory(OverdueHistory oh);

	int insertReturnPurchaseHistory(Map param);

}
