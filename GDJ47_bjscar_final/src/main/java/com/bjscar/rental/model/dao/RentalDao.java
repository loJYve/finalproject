package com.bjscar.rental.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalDao {

	List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, String vehicleGrade);

}
