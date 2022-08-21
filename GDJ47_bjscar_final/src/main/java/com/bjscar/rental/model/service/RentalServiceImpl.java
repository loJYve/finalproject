package com.bjscar.rental.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.dao.RentalDao;
import com.bjscar.rental.model.vo.OverdueHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rental.model.vo.ReturnHistory;
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

	@Override
	public Vehicle selectSearchvehicle(int rentalId) {
		return dao.selectSearchvehicle(session, rentalId);
	}

	@Override
	public int updateRentalHistoryReturn(RentalHistory rh) {
		return dao.updateRentalHistoryReturn(session, rh);
	}

	@Override
	public int insertReturnHistory(ReturnHistory returnh) {
		return dao.insertReturnHistory(session, returnh);
	}

	@Override
	public int updateVehicleReturn(int vehicleId) {
		return dao.updateVehicleReturn(session, vehicleId);
	}

	@Override
	public int insertOverdueHistory(OverdueHistory oh) {
		return dao.insertOverdueHistory(session, oh);
	}

	@Override
	public int insertReturnPurchaseHistory(Map param) {
		return dao.insertReturnPurchaseHistory(session, param);
	}

}
