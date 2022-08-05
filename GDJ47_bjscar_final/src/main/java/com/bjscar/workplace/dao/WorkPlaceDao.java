package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.bjscar.rentalshop.model.vo.Rentalshop;

public interface WorkPlaceDao {
	List<Rentalshop> selectRentalshop(SqlSessionTemplate session);
	
	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session,Map param);
	
	int selectRentalshopCount(SqlSessionTemplate session);
}
