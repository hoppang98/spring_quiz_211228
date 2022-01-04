package com.marobiana.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marobiana.quiz.lesson04.dao.NewRealtorDAO;
import com.marobiana.quiz.lesson04.model.NewRealtor;

@Service
public class NewRealtorBO {

	@Autowired 
	private NewRealtorDAO newRealtorDAO;
	
	public int addRealtor(NewRealtor realtor) {
		return newRealtorDAO.insertRealtor(realtor);
	}
}
