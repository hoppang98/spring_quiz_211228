package com.marobiana.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson03.dao.RealEstateDAO;
import com.marobiana.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstateAsRent(int rentPrice) {
		return realEstateDAO.selectRealEstateAsRent(rentPrice);
	}
	
	public List<RealEstate> getRealEstateAsAreaPrice(int area, int price) {
		return realEstateDAO.selectRealEstateAsAreaPrice(area, price);
	}
	
	//객체화해서 insert
	public int insertRealEstateAsObject(RealEstate realEstate) {
		return realEstateDAO.insertRealEstateAsObject(realEstate);
	}
	
	public int addRealEstate(int realtorId, String address, int Area, String type, int price, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId, address, Area, type, price, rentPrice);
	}
	
	public int updateRealEstate(int id, String type, int price) {
		return realEstateDAO.updateRealEstateById(id, type, price);
	}
	
	public int deleteRealEstate(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
}
