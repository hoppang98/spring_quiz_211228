package com.marobiana.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marobiana.quiz.lesson05.bo.WeatherBO;
import com.marobiana.quiz.lesson05.model.Weather;

@Controller
public class WeatherController {

	@Autowired
	private WeatherBO weatherBO;
	
	// 과거 날씨 List로 받아와서 model객체 형태로 보내기
	@RequestMapping("/lesson05/weather")
	public String weatherHistory(Model model) {
		List<Weather> weatherList = weatherBO.getWeatherList();
		model.addAttribute("weatherList", weatherList);
		return "/lesson05/weatherView";
	}
	
	@RequestMapping("lesson05/addWeatherView")
	public String addWeatherView() {
		return "lesson05/addWeather";
	}
	
	@PostMapping("lesson05/addWeather")
	public String addWeather(
			@ModelAttribute Weather weather,
			Model model
			) {
		
		weatherBO.addWeather(weather);
		model.addAttribute("weather", weather);
		
		return "redirect:/lesson05/weatherView";
	}
	
}
