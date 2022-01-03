package com.marobiana.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson04.dao.NewSellerDAO;
import com.marobiana.quiz.lesson04.model.NewSeller;

@Service
public class NewSellerBO {
	
	@Autowired
	private NewSellerDAO newSellerDAO;
	
	public int addUser(String nickname, String profileImageUrl, double temperature) {
		return newSellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public NewSeller getLastSeller() {
		return newSellerDAO.selectLastSeller();
	}
	public NewSeller getSeller(int id) {
		return newSellerDAO.selectSeller(id);
	}
	
}
