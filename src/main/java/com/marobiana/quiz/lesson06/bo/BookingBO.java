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
	
	public List<Booking> getBookingList() {
		return bookingDAO.seleteBookingList();
	}
	
	public int deleteBooking(int id) {
		return bookingDAO.deleteBooking(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, headcount);
	}
	
	public boolean checkBooking (String name, String phoneNumber) {
		int count = bookingDAO.selectCheckBooking(name, phoneNumber);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
}
