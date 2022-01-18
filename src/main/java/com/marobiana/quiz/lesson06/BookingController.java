package com.marobiana.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public Map<String,Object> checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		Map<String, Object> response = new HashMap<>();	// jsp에 보내줄 데이터 불러오기 성공여부
		
		Booking booking = bookingBO.checkBooking(name, phoneNumber);		// 돌려받는 객체가 꼭 하나면 이런 형태(booking)로 받아도 괜찮은데 여러개일 확률이 있으면 무조건 List
		
		if(booking == null) {					// 조회된 데이터가 없으면 객체는 null이다.
			response.put("result", "fail");		//성공(success), 실패(fail) 여부는 꼭 담아주는게 좋다
		} else {
			response.put("result", "success"); // success라는 String과
			response.put("booking", booking);	// booking 객체를 둘다 response의 booking과 result라는 Key에 각각 담아서 보낸다
		}

		return response;
	}
}
