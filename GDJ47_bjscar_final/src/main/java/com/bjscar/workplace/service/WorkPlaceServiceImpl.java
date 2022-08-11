package com.bjscar.workplace.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.workplace.dao.WorkPlaceDao;
@Service
public class WorkPlaceServiceImpl implements WorkPlaceService {

	@Autowired
	private WorkPlaceDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Rentalshop> selectRentalshop() {
		// TODO Auto-generated method stub
		return dao.selectRentalshop(session);
	}

	@Override
	public List<Rentalshop> selectRentalshopListPage(Map param) {
		// TODO Auto-generated method stub
		return dao.selectRentalshopListPage(session, param);
	}

	@Override
	public int selectRentalshopCount() {
		// TODO Auto-generated method stub
		return dao.selectRentalshopCount(session);
	}

	
	@Override
	public Rentalshop selectRentalshop(int no) {
		return dao.selectRentalshop(session, no);
	}
}
