package com.bjscar.rental.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalDao {

	List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, Map param);

	int selectSearchvehicleCount(SqlSessionTemplate session, String vehicleGrade);

}
