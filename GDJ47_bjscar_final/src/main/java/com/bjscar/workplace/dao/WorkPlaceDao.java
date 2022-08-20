package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;

public interface WorkPlaceDao {
	
	
	List<Vehicle> selectRentalshopCar(SqlSessionTemplate session,int rentalshopId);
	
	int selectRentalshopCarCount(SqlSessionTemplate session,int rentalshopId);
	
	List<Vehicle> selectRentalshopCarListPage(SqlSessionTemplate session,Map param);
	
	int insertRentalshopCar(SqlSessionTemplate session, Vehicle v);
	
	void insertRentalshopVehicleId(SqlSessionTemplate session);
	
	
	//----------------------------------------------------------------------------
	List<Rentalshop> selectRentalshop(SqlSessionTemplate session,String bmId);
	
	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session,Map param);
	
	Rentalshop selectRentalshop(SqlSessionTemplate session,int no);
	
//	int selectRentalshopCount(SqlSessionTemplate session);
	int selectRentalshopCount(SqlSessionTemplate session,String bmId);
	
	int insertRentalshop(SqlSessionTemplate session,Rentalshop r);
	
	int insertAttachment(SqlSessionTemplate session, Attachment a);

	void insertRentalshopId(SqlSessionTemplate session);

	int updateRentalshopEnd(SqlSessionTemplate session, Map param);

	

	

	



//	List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session, Map param, String memberId);

	
	
}
