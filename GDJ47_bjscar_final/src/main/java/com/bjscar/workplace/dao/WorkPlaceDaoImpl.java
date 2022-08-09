package com.bjscar.workplace.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bjscar.rentalshop.model.vo.Rentalshop;
@Repository
public class WorkPlaceDaoImpl implements WorkPlaceDao{

	@Override
	public List<Rentalshop> selectRentalshop(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("rentalshop.selectRentalshopList");
	}

	@Override
	public List<Rentalshop> selectRentalshopListPage(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("rentalshop.selectRentalshopList",null,new RowBounds((offSet-1)*limit,limit));
	}

	@Override
	public int selectRentalshopCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("rentalshop.selectRentalshopCount");
	}
	
	@Override
	public Rentalshop selectRentalshop(SqlSessionTemplate session,int no) {
		return session.selectOne("rentalshop.selectrentalshop",no);
	}

}
