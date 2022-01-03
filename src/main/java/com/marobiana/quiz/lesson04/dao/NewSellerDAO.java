package com.marobiana.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marobiana.quiz.lesson04.model.NewSeller;

@Repository
public interface NewSellerDAO {
	
	public int insertSeller(
			@Param("nickname") String name,
			@Param("profileImageUrl") String profileImageUrl,
			@Param("temperature") double temperature
			);
	
	public NewSeller selectSeller(@Param("id") int id);
	
	public NewSeller selectLastSeller();
}
