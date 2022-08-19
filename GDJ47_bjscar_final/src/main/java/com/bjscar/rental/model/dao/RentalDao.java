package com.bjscar.rental.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalDao {

	List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, Map param);

	int selectSearchvehicleCount(SqlSessionTemplate session, String vehicleGrade);

	int insertRentalHistory(SqlSessionTemplate session, RentalHistory rh);

	int insertPurchaseHistory(SqlSessionTemplate session, PurchaseHistory ph);

	int updateVehicle(SqlSessionTemplate session, int vehicleId);

	int insertRentalPurchaseHistory(SqlSessionTemplate session, Map param);

}
