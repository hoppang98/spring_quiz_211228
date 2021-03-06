package com.marobiana.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson06.model.Favorite;

@Repository
public interface NewFavoriteDAO {

	public int insertFavorite(
			@Param("name") String name,
			@Param("url") String url
			);
	
	public List<Favorite> selectFavoriteList();
	
	public int selectCountUrl(@Param("url") String url);
	
	public int deleteFavorite(@Param("id") int id);
}
