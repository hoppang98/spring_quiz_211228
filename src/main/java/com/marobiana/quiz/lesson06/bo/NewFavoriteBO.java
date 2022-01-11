package com.marobiana.quiz.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson06.dao.NewFavoriteDAO;

@Service
public class NewFavoriteBO {
	
	@Autowired
	private NewFavoriteDAO newFavoriteDAO;
	
	public int addFavorite(String name, String url) {
		return newFavoriteDAO.insertFavorite(name, url);
	}
}
