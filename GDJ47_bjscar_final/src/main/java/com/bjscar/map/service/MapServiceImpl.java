package com.bjscar.map.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.map.dao.MapDao;
import com.bjscar.rentalshop.model.vo.Rentalshop;

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
	public int selectVehicle() {
		// TODO Auto-generated method stub
		return dao.selectVehicleCount(session);
	}
}
