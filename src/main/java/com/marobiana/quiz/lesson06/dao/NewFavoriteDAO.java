package com.marobiana.quiz.lesson06.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NewFavoriteDAO {

	public int insertFavorite(
			@Param("name") String name,
			@Param("url") String url
			);
}
