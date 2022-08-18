package com.bjscar.rental.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.rental.model.dao.RentalDao;
import com.bjscar.vehicle.model.vo.Vehicle;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private RentalDao dao;

	@Override
	public List<Vehicle> searchVehicleByGrade(Map param) {
		return dao.searchVehicleByGrade(session, param);
	}

	@Override
	public int selectSearchvehicleCount(String vehicleGrade) {
		return dao.selectSearchvehicleCount(session, vehicleGrade);
	}

}
