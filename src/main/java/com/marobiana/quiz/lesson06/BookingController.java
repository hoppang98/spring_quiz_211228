package com.marobiana.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marobiana.quiz.lesson06.bo.BookingBO;
import com.marobiana.quiz.lesson06.model.Booking;

@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 예약 홈페이지 jsp로 이동
	@RequestMapping("/lesson06/test03/bookingHompage")
	public String addFavoriteView () {
		return "/lesson06/bookingHomepage";
	}
	
	// 예약 리스트 model형식으로 데이터 받아오고 view로 연결 
	@GetMapping("/lesson06/test03/bookingList_view")
	public String bookingList(Model model) {
		List<Booking> booking = bookingBO.getBookingList();
		model.addAttribute("booking", booking);	
		return "/lesson06/bookingList";
	}
	
	@ResponseBody
	@GetMapping("/lesson06/test03/delete_booking")
	public String deleteBooking(
			@RequestParam("id") int id
			) {
		int count = bookingBO.deleteBooking(id);
		if(count == 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	@GetMapping("/lesson06/test03/add_booking_view")
	public String addBookingView() {
		return "/lesson06/addBooking";
	}
	
	@ResponseBody
	@PostMapping("/lesson06/test03/add_booking")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("date") String date, // 여기서 date객체를 String 타입으로 변환
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		if(count == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@GetMapping("/lesson06/test03/check_booking")
	public Map<String, String> checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		Map<String, String> result = new HashMap<>();
		
		if(bookingBO.checkBooking(name, phoneNumber)) {
			result.put("check", "true");
		} else {
			result.put("check", "false");
		}
		return result;
	}
}
