package com.bjscar.rental.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.mypage.model.vo.RentalHistory;
import com.bjscar.rental.model.vo.OverdueHistory;
import com.bjscar.rental.model.vo.PurchaseHistory;
import com.bjscar.rental.model.vo.ReturnHistory;
import com.bjscar.vehicle.model.vo.Vehicle;

@Repository
public class RentalDaoImpl implements RentalDao{

	@Override
	public List<Vehicle> searchVehicleByGrade(SqlSessionTemplate session, Map param) {
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		String vehicleGrade=(String)param.get("vehicleGrade");
		
		return session.selectList("rental.searchVehicleByGrade",vehicleGrade,new RowBounds((offSet-1)*limit,limit));
	}

	@Override
	public int selectSearchvehicleCount(SqlSessionTemplate session, String vehicleGrade) {
		return session.selectOne("rental.selectSearchvehicleCount",vehicleGrade);
	}

	@Override
	public int insertRentalHistory(SqlSessionTemplate session, RentalHistory rh) {
		return session.insert("rental.insertRentalHistory", rh);
	}

	@Override
	public int insertPurchaseHistory(SqlSessionTemplate session, PurchaseHistory ph) {
		return session.insert("rental.insertPurchaseHistory", ph);
	}

	@Override
	public int updateVehicle(SqlSessionTemplate session, int vehicleId) {
		return session.update("rental.updateVehicle", vehicleId);
	}

	@Override
	public int insertRentalPurchaseHistory(SqlSessionTemplate session, Map param) {
		return session.insert("rental.insertRentalPurchaseHistory", param);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, Map paramM) {
		return session.update("rental.updateMember", paramM);
	}

	@Override
	public Vehicle selectSearchvehicle(SqlSessionTemplate session, int rentalId) {
		return session.selectOne("rental.selectSearchvehicle", rentalId);
	}

	@Override
	public int updateRentalHistoryReturn(SqlSessionTemplate session, RentalHistory rh) {
		return session.update("rental.updateRentalHistoryReturn", rh);
	}

	@Override
	public int insertReturnHistory(SqlSessionTemplate session, ReturnHistory returnh) {
		return session.insert("rental.insertReturnHistory", returnh);
	}

	@Override
	public int updateVehicleReturn(SqlSessionTemplate session, int vehicleId) {
		return session.update("rental.updateVehicleReturn", vehicleId);
	}

	@Override
	public int insertOverdueHistory(SqlSessionTemplate session, OverdueHistory oh) {
		return session.insert("rental.insertOverdueHistory", oh);
	}

	@Override
	public int insertReturnPurchaseHistory(SqlSessionTemplate session, Map param) {
		return session.insert("rental.insertReturnPurchaseHistory", param);
	}

}
