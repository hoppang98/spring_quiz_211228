package com.marobiana.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson05.model.Weather;

@Repository
public interface WeatherDAO {
	
	public List<Weather> selectWeatherList();
	
	public int insertWeather(Weather weather);
}
