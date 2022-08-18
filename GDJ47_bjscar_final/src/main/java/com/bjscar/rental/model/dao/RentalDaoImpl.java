package com.bjscar.rental.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.vehicle.model.vo.Vehicle;

@Repository
public class RentalDaoImpl implements RentalDao{

	@Override
	public List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, Map param) {
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		String vehicleGrade=(String)param.get("vehicleGrade");
		
		return session.selectList("rental.searchVehicleByGrade",vehicleGrade,new RowBounds((offSet-1)*limit,limit));
	}

	@Override
	public int selectSearchvehicleCount(SqlSessionTemplate session, String vehicleGrade) {
		return session.selectOne("rental.selectSearchvehicleCount",vehicleGrade);
	}

}
