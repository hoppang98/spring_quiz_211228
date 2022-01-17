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
	
	// 예약 리스트를 List형식으로 데이터 받아오고 model에 담아서 view로 연결 
	@GetMapping("/lesson06/test03/bookingList_view")
	public String bookingList(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);	
		return "/lesson06/bookingList";
	}
	
	@ResponseBody	
	@GetMapping("/lesson06/test03/delete_booking")
	public Map<String, String> deleteBooking(					//결과는 String말고 규격화된 map형태로 보내는게 좋다
			@RequestParam("id") int id
			) {
		Map<String, String> result = new HashMap<>(); 
		
		int count = bookingBO.deleteBooking(id);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/lesson06/test03/add_booking_view")
	public String addBookingView() {
		return "/lesson06/addBooking";
	}
	
	@ResponseBody
	@GetMapping("/lesson06/test03/add_booking")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		Map<String, String> result = new HashMap<>();
		
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	// 예약 홈페이지 jsp로 이동
	@RequestMapping("/lesson06/test03/bookingHompage")
	public String addFavoriteView () {
		return "/lesson06/bookingHomepage";
	}
	
	// 예약 내역 확인
	@ResponseBody
	@GetMapping("/lesson06/test03/check_booking")
	public Booking checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		Booking booking = bookingBO.checkBooking(name, phoneNumber);			// 결과가 하나일때는 List로 받아오는게 아닌 그 객체(booking)를 통채로 가져온다
		
		return booking;
	}
}
