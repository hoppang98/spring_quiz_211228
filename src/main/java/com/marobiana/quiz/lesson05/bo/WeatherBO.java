package com.marobiana.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson05.dao.WeatherDAO;
import com.marobiana.quiz.lesson05.model.Weather;

@Service
public class WeatherBO {
	
	@Autowired
	private WeatherDAO weatherDAO;
	
	public List<Weather> getWeatherList() {
		return weatherDAO.selectWeatherList();
	}
	
	public int addWeather(Weather weather) {
		return weatherDAO.insertWeather(weather);
	}
	
}
