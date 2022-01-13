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
	
	public boolean isDuplicateUrl(String url) {
		int count = newFavoriteDAO.selectCountUrl(url);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int deleteFavorite(int id) { //delete,insert,update는 다 실행한 행의 개수 return으로 int사용
		return newFavoriteDAO.deleteFavorite(id);
	}
}
