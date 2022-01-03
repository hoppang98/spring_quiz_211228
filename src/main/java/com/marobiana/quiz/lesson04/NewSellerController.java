package com.marobiana.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marobiana.quiz.lesson04.bo.NewSellerBO;
import com.marobiana.quiz.lesson04.model.NewSeller;

@Controller
public class NewSellerController {
	
	@Autowired
	private NewSellerBO newSellerBO;
	
	@RequestMapping("/lesson04/test01/1")
	public String addSellerView() {
		return "lesson04/addSeller"; // addSeller.jsp링크로 이동
	}
	
	@ResponseBody
	@RequestMapping("/lesson04/test01/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		int count = newSellerBO.addUser(nickname, profileImageUrl, temperature);
		
		return "입력 성공" + count + "개";
	}
	
	@RequestMapping("/lesson04/test01/seller_info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id // int는 비필수 파라미터인지 확인을 위해서 required여부를 판단할때 null을 줄 수 없다 따라서 Integer을 사용
			, Model model) {
		
		NewSeller newSeller = null;
		if (id == null) {
			newSeller = newSellerBO.getLastSeller();
		} else {
			newSeller = newSellerBO.getSeller(id);
		}
		model.addAttribute("result", newSeller);
		model.addAttribute("subject", "판매자정보");
		
		return "lesson04/sellerInfo";
	}
	
}
