package com.marobiana.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selectRealEstate(@Param("id") int id);
	
	public List<RealEstate> selectRealEstateAsRent(@Param("rentPrice") int rentPrice); // @Param은 xml이 사용하기 위한 것, 결과가 여러개라 List 붙인다
	
	public List<RealEstate> selectRealEstateAsAreaPrice(
			@Param("area") int area, 
			@Param("price") int price);
	
	//객체화해서 insert
	public int insertRealEstateAsObject(RealEstate realestate);
	
	public int insertRealEstate(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") int rentPrice

			);
	
	public int updateRealEstateById(
			@Param("id") int id,
			@Param("type") String type,
			@Param("price") int price
			);
	
	public int deleteRealEstateById(
			@Param("id") int id
			);
	
}
