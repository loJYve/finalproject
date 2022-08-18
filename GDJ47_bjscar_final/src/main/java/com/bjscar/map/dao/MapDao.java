package com.bjscar.map.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface MapDao {
	
	List<Rentalshop> searchRentalshop(SqlSessionTemplate session);
	List<Vehicle> selectRentalshop(SqlSessionTemplate session, int no, Map param);
	int selectVehicleCount(int no, SqlSessionTemplate session);
	List<Vehicle> searchBar(SqlSessionTemplate session, Map param);
	int searchVehicleCount(SqlSessionTemplate session,Map param);
}
