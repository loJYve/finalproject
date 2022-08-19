package com.bjscar.rental.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.dao.RentalDao;
import com.bjscar.rental.model.vo.PurchaseHistory;
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

	@Override
	public int insertRentalHistory(RentalHistory rh) {
		return dao.insertRentalHistory(session, rh);
	}

	@Override
	public int insertPurchaseHistory(PurchaseHistory ph) {
		return dao.insertPurchaseHistory(session, ph);
	}

	@Override
	public int updateVehicle(int vehicleId) {
		return dao.updateVehicle(session, vehicleId);
	}

	@Override
	public int insertRentalPurchaseHistory(Map param) {
		return dao.insertRentalPurchaseHistory(session, param);
	}

	@Override
	public int updateMember(Map paramM) {
		return dao.updateMember(session, paramM);
	}

}
