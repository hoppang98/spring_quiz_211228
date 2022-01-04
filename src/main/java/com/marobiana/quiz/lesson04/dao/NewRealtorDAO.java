package com.marobiana.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson04.model.NewRealtor;

@Repository
public interface NewRealtorDAO {
	
	public int insertRealtor(NewRealtor realtor);
}
