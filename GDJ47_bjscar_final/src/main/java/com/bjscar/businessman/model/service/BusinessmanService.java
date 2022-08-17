package com.bjscar.businessman.model.service;

import com.bjscar.businessman.model.vo.Businessman;

public interface BusinessmanService {
  
	int insertBusinessman(Businessman man);
	
	Businessman idCheck(Businessman man);
	
	Businessman selectMan(Businessman man);
}
