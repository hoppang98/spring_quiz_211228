package com.marobiana.quiz.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marobiana.quiz.lesson06.bo.NewFavoriteBO;

@Controller
public class NewFavoriteController {
	
	@Autowired
	private NewFavoriteBO newFavoriteBO;
	
	@GetMapping("/lesson06/test01/add_favorite_view")
	public String test01 () {
		return "/lesson06/addFavorite";
	}
	
	@ResponseBody
	@PostMapping("/lesson06/test01/add_favorite")
	public String test02(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		int count = newFavoriteBO.addFavorite(name, url);
		
		if(count == 1) {
			return "success";
		} else {
			return "fail";
		}
		
	}
}
