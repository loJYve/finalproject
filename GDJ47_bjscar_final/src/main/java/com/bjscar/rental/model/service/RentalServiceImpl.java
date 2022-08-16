package com.bjscar.rental.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bjscar.rental.model.dao.RentalDao;
import com.bjscar.vehicle.model.vo.Vehicle;

public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private RentalDao dao;

	@Override
	public List<Vehicle> searchVehicleByGrade(String vehicleGrade) {
		return dao.searchVehicleByGrade(session, vehicleGrade);
	}

}
