package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.attachment.model.vo.Attachment;
import com.bjscar.rentalshop.model.vo.Rentalshop;
import com.bjscar.vehicle.model.vo.Vehicle;
@Repository
public class WorkPlaceDaoImpl implements WorkPlaceDao{

	@Override
	public Vehicle selectVehicleId(SqlSessionTemplate session,int no) {
		return session.selectOne("rentalshop.selectVehicleId",no);
	}
	
	@Override
	public int selectRentalshopCarCount(SqlSessionTemplate session,int rentalshopId) {
		// TODO Auto-generated method stub
		return session.selectOne("rentalshop.selectRentalshopCarCount",rentalshopId);
	}
	
	@Override
	public List<Vehicle> selectRentalshopCarListPage(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("rentalshop.selectRentalshopCarList",param,new RowBounds((offSet-1)*limit,limit));
	}
	
	@Override
	public int insertRentalshopCar(SqlSessionTemplate session,Vehicle v) {
		return session.insert("rentalshop.insertRentalshopCar",v);	
	}
	
	@Override
	public void insertRentalshopVehicleId(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		session.insert("rentalshop.rentalshopidInsertCar");	
	}	
	
	
	//---------------------------------------------------------------
	@Override
	public List<Rentalshop> selectRentalshop(SqlSessionTemplate session,String memberId) {
		// TODO Auto-generated method stub
		return session.selectList("rentalshop.selectRentalshopList",memberId);
	}

	@Override
	public List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("rentalshop.selectRentalshopList",param,new RowBounds((offSet-1)*limit,limit));
	}
	
//	@Override
//	public int selectRentalshopCount(SqlSessionTemplate session) {
//		// TODO Auto-generated method stub
//		return session.selectOne("rentalshop.selectRentalshopCount");
//	}

	@Override
	public int selectRentalshopCount(SqlSessionTemplate session,String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("rentalshop.selectRentalshopCount",memberId);
	}
	
	@Override
	public Rentalshop selectRentalshop(SqlSessionTemplate session,int no) {
		return session.selectOne("rentalshop.selectrentalshop",no);
	}

	@Override
	public int insertRentalshop(SqlSessionTemplate session,Rentalshop r) {
		 int rentalshopInsert=session.insert("rentalshop.insertRentalshop",r);	
//			session.insert("rentalshop.insertRentalshop",r);	
		// session.insert("rentalshop.rentalshopidInsert");
			return  rentalshopInsert;
//		 session.insert("rentalshop.rentalshopidInsert");
	}
	
	
	@Override
	public void insertRentalshopId(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		session.insert("rentalshop.rentalshopidInsert");	
	}	
	
	@Override
	public int insertAttachment(SqlSessionTemplate session,Attachment a ) {
		// TODO Auto-generated method stub
		
		return session.insert("rentalshop.insertAttachment",a);
	}


	@Override
	public int updateRentalshopEnd(SqlSessionTemplate session, Map param) {

		
		return session.update("rentalshop.updateEndRentalshop",param);
	}
	
}
