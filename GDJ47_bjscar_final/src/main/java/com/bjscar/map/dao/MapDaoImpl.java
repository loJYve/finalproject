package com.bjscar.map.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Vehicle> selectRentalshop(SqlSessionTemplate session, int no, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("map.selectVehicle",no,
				new RowBounds((offSet-1)*limit,limit));
	}
	@Override
	public int selectVehicleCount(int no, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("map.selectBoardCount",no);
	}
	
	@Override
	public int searchVehicleCount(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("map.searchVehicleCount",param);
	}
	
	@Override
	public List<Vehicle> searchBar(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("map.searchVehicle",param,
				new RowBounds((offSet-1)*limit,limit));
	}
	
}
