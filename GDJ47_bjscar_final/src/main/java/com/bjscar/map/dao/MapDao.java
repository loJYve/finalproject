package com.bjscar.map.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.rentalshop.model.vo.Rentalshop;

public interface MapDao {
	
	List<Rentalshop> searchRentalshop(SqlSessionTemplate session);

}
