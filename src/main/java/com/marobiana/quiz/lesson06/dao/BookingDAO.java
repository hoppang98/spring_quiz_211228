package com.marobiana.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> seleteBookingList();
	
	public int deleteBooking(@Param("id") int id);
	
	public int insertBooking(
			@Param("name") String name,
			@Param("date") String date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber,
			@Param("state") String state
			);
	
	public Booking selectCheckBooking(		// 돌려받는 객체가 꼭 하나면 이런 형태로 받아도 괜찮은데 여러개일 확률이 있으면 무조건 List
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber
			);
	
}
