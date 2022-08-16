package com.bjscar.rental.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.vehicle.model.vo.Vehicle;

public class RentalDaoImpl implements RentalDao{

	@Override
	public List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, String vehicleGrade) {
		return null;
	}

}
