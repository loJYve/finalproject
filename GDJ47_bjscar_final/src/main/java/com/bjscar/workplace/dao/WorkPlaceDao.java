package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.rentalshop.model.vo.RentalshopAttachment;

public interface WorkPlaceDao {
	List<Rentalshop> selectRentalshop(SqlSessionTemplate session);
	
	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session,Map param);
	
	Rentalshop selectRentalshop(SqlSessionTemplate session,int no);
	
	int selectRentalshopCount(SqlSessionTemplate session);
//	int selectRentalshopCount(SqlSessionTemplate session,String memberId);
	
	int insertRentalshop(SqlSessionTemplate session,Rentalshop r);
	
	int insertAttachment(SqlSessionTemplate session, Attachment a);

	void insertRentalshopId(SqlSessionTemplate session);

	



//	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session, Map param, String memberId);

	
	
}
