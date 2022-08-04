package com.bjscar.map.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.rentalshop.model.vo.Rentalshop;

@Repository
public class MapDaoImpl implements MapDao{
	
	@Override
	public List<Rentalshop> searchRentalshop(SqlSessionTemplate session){
		return session.selectList("map.searchRentalshop");
	}

}
