package com.marobiana.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class finalTest {
	
	@RequestMapping("/lesson06/test02/finalTest")
	public String addFavoriteView () {
		return "/lesson06/finalTest";
	}
}
