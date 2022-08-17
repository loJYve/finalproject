package com.bjscar.workplace.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bjscar.attachment.model.vo.Attachment;
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
				
				
			}
			}
		}catch (RuntimeException e) {
			throw new RuntimeException("작성실패!");
		}
//		result=dao.insertAttachment(b.getFiles().get(0));
//		result=dao.insertAttachment(b.getFiles().get(1));
		
		
		return result;
	}
}
