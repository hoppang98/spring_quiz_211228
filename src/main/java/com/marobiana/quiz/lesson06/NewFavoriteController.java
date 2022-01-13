package com.marobiana.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marobiana.quiz.lesson06.bo.NewFavoriteBO;
import com.marobiana.quiz.lesson06.model.Favorite;

@Controller
public class NewFavoriteController {
	
	@Autowired
	private NewFavoriteBO newFavoriteBO;
	
	@GetMapping("/lesson06/test01/add_favorite_view")
	public String addFavoriteView () {
		return "/lesson06/addFavorite";
	}
	
	@ResponseBody // 데이터를 이용하는 경우에 Resposenbody
	@PostMapping("/lesson06/test01/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		int count = newFavoriteBO.addFavorite(name, url);
		
		if(count == 1) {
			return "success"; // jsp의 ajax를 위한 데이터
		} else {
			return "fail";
		}
	}
	
	@GetMapping("/lesson06/test01/favorite_list_view")
	public String favoriteList (Model model) {
		List<Favorite> favorite = newFavoriteBO.getFavoriteList();
		model.addAttribute("favorite", favorite);
		return "/lesson06/favoriteView";
	}
	
	
	
	@ResponseBody
	@PostMapping("/lesson06/test02/duplicate_url")
	public Map<String, String> duplicateUrl(
			@RequestParam("url") String url
			){
		Map<String, String> result = new HashMap<>();
		
		if(newFavoriteBO.isDuplicateUrl(url)) { //중복
			result.put("isDuplicate", "true");
		} else {
			result.put("isDuplicate", "false"); //사용가능
		}
		return result;
	}
	
	
	@ResponseBody
	@GetMapping("/lesson06/test02/delete_favorite")
	public String deleteFavorite(
			@RequestParam("id") int id
			) {
		int count = newFavoriteBO.deleteFavorite(id);
		if(count == 0) {
			return "fail";
		} else {
			return "success";
		}
		
	}
	

	
}
