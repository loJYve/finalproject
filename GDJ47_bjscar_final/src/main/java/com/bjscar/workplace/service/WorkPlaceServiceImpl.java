package com.bjscar.workplace.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;
import com.bjscar.workplace.dao.WorkPlaceDao;
@Service
public class WorkPlaceServiceImpl implements WorkPlaceService {

	@Autowired
	private WorkPlaceDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	
	@Override
	public List<Vehicle> selectRentalshopCar(int rentalshopId){
		return dao.selectRentalshopCar(session, rentalshopId);
	}
	
	@Override
	public int selectRentalshopCarCount(int rentalshopId) {
		// TODO Auto-generated method stub
		return dao.selectRentalshopCarCount(session,rentalshopId);
	}
	
	@Override
	public List<Vehicle> selectRentalshopCarListPage(Map param) {
		// TODO Auto-generated method stub
		
		return dao.selectRentalshopCarListPage(session, param);
	}
	
	
	//---------------------------------------------------------
	@Override
	public List<Rentalshop> selectRentalshop(String bmId) {
		// TODO Auto-generated method stub
		return dao.selectRentalshop(session,bmId);
	}

	@Override
	public List<Rentalshop> selectRentalshopListPage(Map param) {
		// TODO Auto-generated method stub
		
		return dao.selectRentalshopListPage(session, param);
	}

//	@Override
//	public int selectRentalshopCount() {
//		// TODO Auto-generated method stub
//		return dao.selectRentalshopCount(session);
//	}

	@Override
	public int selectRentalshopCount(String bmId) {
		// TODO Auto-generated method stub
		return dao.selectRentalshopCount(session,bmId);
	}

	
	@Override
	public Rentalshop selectRentalshop(int no) {
		return dao.selectRentalshop(session, no);
	}
	
	@Override
	@Transactional
	public int insertRentalshop(Rentalshop r) throws RuntimeException{
		int result=0;
		try {
		
		result = dao.insertRentalshop(session,r);
		//log.debug("boardNo : {}",r.getRentalshopId());
		if(result>0&&r.getFiles()!=null) {
			for(Attachment a : r.getFiles()) {
				a.setAttachmentId(r.getRentalshopId());
				result=dao.insertAttachment(session,a);
//				if(result==0) throw new RuntimeException();
				dao.insertRentalshopId(session);
				
			}
			}
		
		}catch (RuntimeException e) {
			e.printStackTrace();
			throw new RuntimeException("작성실패!");
			
		}
//		result=dao.insertAttachment(b.getFiles().get(0));
//		result=dao.insertAttachment(b.getFiles().get(1));
		
		
		return result;
	}
	
	@Override
	public int updateRentalshopEnd(Map param) {
		
		
		return dao.updateRentalshopEnd(session, param);
	}

}

	