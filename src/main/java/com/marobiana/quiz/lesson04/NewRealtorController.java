package com.marobiana.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marobiana.quiz.lesson04.bo.NewRealtorBO;
import com.marobiana.quiz.lesson04.model.NewRealtor;

@Controller
public class NewRealtorController {
	
	@Autowired
	private NewRealtorBO newRealtorBO;
	
	@RequestMapping("/lesson04/test02/1")
	public String addRealtorView() {
		return "/lesson04/addRealtor";
	}
	
	
	@PostMapping("/lesson04/test02/add_realtor")
	public String addRealtor(
			@ModelAttribute NewRealtor realtor,
			Model model
		) {
		
		newRealtorBO.addRealtor(realtor);
		
		model.addAttribute("result", realtor);
		
		return "lesson04/realtorInfo";
	}
}
