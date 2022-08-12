package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.bjscar.rentalshop.model.vo.Rentalshop;

public interface WorkPlaceDao {
	List<Rentalshop> selectRentalshop(SqlSessionTemplate session);
	
	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session,Map param);
	
	Rentalshop selectRentalshop(SqlSessionTemplate session,int no);
	
	int selectRentalshopCount(SqlSessionTemplate session);
	
	int insertRentalshop(SqlSessionTemplate session,Rentalshop r);
	
}
