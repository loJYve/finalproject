package com.bjscar.longrental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjscar.longrental.dao.LongRentalDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LongRentalServiceImpl implements LongRentalService{

	@Autowired
	private LongRentalDao dao;
	
	
}
