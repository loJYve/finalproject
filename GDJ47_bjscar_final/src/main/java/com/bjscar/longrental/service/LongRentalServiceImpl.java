package com.bjscar.longrental.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.longrental.dao.LongRentalDao;
import com.bjscar.vehicle.model.vo.Vehicle;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LongRentalServiceImpl implements LongRentalService{

	@Autowired
	private LongRentalDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<Vehicle> LRCarSelect(){
		return dao.LRCarSelect(session);
	}
	
	
}
