package com.marobiana.quiz.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson05.model.Weather;

@Repository
public interface WeatherDAO {
	
	public List<Weather> selectWeatherList();
	
	public int insertWeather(
			@Param("date") String date, 				//@Param으로 문자열 형태로 변환
			@Param("weather") String weather,
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation,
			@Param("microDust") String microDust,
			@Param("windSpeed") double windSpeed
			);
	
	public int addWeatherByObject(Weather weather);
}
