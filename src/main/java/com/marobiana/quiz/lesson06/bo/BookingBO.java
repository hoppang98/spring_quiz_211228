package com.marobiana.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson06.dao.BookingDAO;
import com.marobiana.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {	// 결과가 여러개일때는 List형식으로 가져온다
		return bookingDAO.seleteBookingList();
	}
	
	public int deleteBooking(int id) {
		return bookingDAO.deleteBooking(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, "대기중");
	}
	
	public Booking checkBooking (String name, String phoneNumber) { // 결과가 하나일때는 List로 받아오는게 아닌 그 객체(booking)를 통채로 가져온다
		return bookingDAO.selectCheckBooking(name, phoneNumber); //// 돌려받는 객체가 꼭 하나면 이런 형태로 받아도 괜찮은데 여러개일 확률이 있으면 무조건 List
	}
}
