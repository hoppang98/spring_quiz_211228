package com.marobiana.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson06.dao.NewFavoriteDAO;
import com.marobiana.quiz.lesson06.model.Favorite;

@Service
public class NewFavoriteBO {
	
	@Autowired
	private NewFavoriteDAO newFavoriteDAO;
	
	public int addFavorite(String name, String url) {
		return newFavoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList(){
		return newFavoriteDAO.selectFavoriteList();
	}
}
