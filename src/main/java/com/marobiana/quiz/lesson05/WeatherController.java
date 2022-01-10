package com.marobiana.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marobiana.quiz.lesson05.bo.WeatherBO;
import com.marobiana.quiz.lesson05.model.Weather;

@Controller
public class WeatherController {

	@Autowired
	private WeatherBO weatherBO;
	// @Responsebody jsp에 연결할때는 빼준다.
	// 과거 날씨 List로 받아와서 model객체 형태로 jsp에 보내기, 
	@GetMapping("/lesson05/weather_history")
	public String weatherHistory(Model model) {
		List<Weather> weatherList = weatherBO.getWeatherList();
		model.addAttribute("weatherList", weatherList);
		return "/lesson05/weatherView";
	}
	
	@RequestMapping("/lesson05/addWeatherView")
	public String addWeatherView() {
		return "lesson05/addWeather";
	}
	
	
	
	// 총 3가지 방법이 있다.
	// 지금 예시는 model 형태로 받아와서 사용하는 방법(model에서 DateTimeFormet을 사용해야함)
	// 주석처리된 부분은 원래 처음에 했던 방법(@RequestParam)으로 하나하나 받아와서 사용하는 방법
	// DateTimeFormat을 컨트롤러에서 사용하는 방법, model에서 사용했던 방법
	@PostMapping("/lesson05/addWeather")
	public String addWeather(							// modelAttribute로 모델 형태로 받아오려고 했는데 String타입으로 jsp에서 받아오는거라 date객체 인식에서 오류가 있어서 
			//@DateTimeFormat(pattern="yyyy-MM-dd")		// @DateTimeFormat쓰면 Date객체로 받아서 사용 가능, 아랫줄 String date를 Date date로 사용가능
//			@RequestParam("date") String date,			// @ReqeustParam으로 하나하나씩 받아서 String형식으로 date를 변환시켜서 사용했다.
//			@RequestParam("weather") String weather,	// jsp에서 받아서 bo로 이 값들을 보낸다.
//			@RequestParam("temperatures") double temperatures,
//			@RequestParam("precipitation") double precipitation,
//			@RequestParam("microDust") String microDust,
//			@RequestParam("windSpeed") double windSpeed
			@ModelAttribute Weather weather,
			Model model
			) {
		
		//weatherBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		weatherBO.addWeatherByObject(weather);
		return "redirect:/lesson05/weather_history";
	}



}