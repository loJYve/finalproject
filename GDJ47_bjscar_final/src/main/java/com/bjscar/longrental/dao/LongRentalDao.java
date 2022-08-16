package com.bjscar.longrental.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.vehicle.model.vo.Vehicle;

public interface LongRentalDao {

	public List<Vehicle> LRCarSelect(SqlSessionTemplate session);
}
