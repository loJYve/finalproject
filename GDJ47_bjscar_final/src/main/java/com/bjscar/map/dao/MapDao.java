package com.bjscar.map.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MapDao {
	
	List<Rentalshop> searchRentalshop(SqlSessionTemplate session);

	List<Vehicle> selectRentalshop(SqlSessionTemplate session, int no);
}
