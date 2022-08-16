package com.bjscar.map.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

@Repository
public class MapDaoImpl implements MapDao{
	
	@Override
	public List<Rentalshop> searchRentalshop(SqlSessionTemplate session){
		return session.selectList("map.searchRentalshop");
	}

	@Override
	public List<Vehicle> selectRentalshop(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("map.selectVehicle",no);
	}
}
