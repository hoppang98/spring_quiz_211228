package com.marobiana.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marobiana.quiz.lesson03.bo.RealEstateBO;
import com.marobiana.quiz.lesson03.model.RealEstate;

@RestController
public class RealEstateController {
	
	@Autowired
	private RealEstateBO RealEstateBO;
	
	@RequestMapping("/lesson03/test01/1")
	public RealEstate test01_1(@RequestParam("id") int id) { // requestparam에 있는 id를 int id에 저장 -> BO에 보낸다
		return RealEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/lesson03/test01/2")
	public List<RealEstate> test01_2(@RequestParam("rent") int rentPrice) { // requestparam에 있는 rent를 int rent에 저장 -> BO에 보낸다
		return RealEstateBO.getRealEstateAsRent(rentPrice);
	}
	
	//http://localhost/lesson03/test01/3?area=90&price=130000
	@RequestMapping("/lesson03/test01/3")
	public List<RealEstate> test01_3(
			@RequestParam("area") int area, 
			@RequestParam("price") int price) {
		
		return RealEstateBO.getRealEstateAsAreaPrice(area,price);
	}
	
	//객체로 insert
	@RequestMapping("/lesson03/test02/1")
	public String test02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = RealEstateBO.insertRealEstateAsObject(realEstate);
		
		return "입력결과 = " + count;
	}
	
	@RequestMapping("/lesson03/test02/2") 
		public String test02_2(
				@RequestParam("realtorId") int realtorId) {
			int count = RealEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
			return "입력결과 = " + count;
		}
	
	//update
	@RequestMapping("/lesson03/test03")
		public String test03() {
			int count = RealEstateBO.updateRealEstate(24, "전세", 70000);
			return "수정성공 = " + count;
	}
	
	//delete
	@RequestMapping("lesson03/test04")
		public String test04(
				@RequestParam(value = "id") int id) {
			int count = RealEstateBO.deleteRealEstate(id);
			return "삭제성공 = " + count;
	}
	
	
}

