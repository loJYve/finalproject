package com.bjscar.map.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.map.dao.MapDao;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Rentalshop> searchRentalshop(){
		return dao.searchRentalshop(session);
	}
	
	@Override
	public int selectVehicleCount(int no) {
		// TODO Auto-generated method stub
		return dao.selectVehicleCount(no, session);
	}
	
	
	@Override
	public int searchVehicleCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchVehicleCount(session, param);
	}
	@Override
	public List<Vehicle> selectRentalshop(Map param, int no) {
		// TODO Auto-generated method stub
		return dao.selectRentalshop(session, no, param);
	}
	
	@Override
	public List<Vehicle> searchBar(Map param) {
		// TODO Auto-generated method stub
		return dao.searchBar(session, param);
	}
	
	
	@Override
	public List<Vehicle> searchSearchRentalShop(Map param) {
		// TODO Auto-generated method stub
		return dao.searchSearchRentalShop(session, param);
	}
	@Override
	public int searchSearchRentalShopCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchSearchRentalShopCount(session, param);
	}
}
