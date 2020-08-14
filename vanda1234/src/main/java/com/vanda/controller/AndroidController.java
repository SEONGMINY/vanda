package com.vanda.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vanda.domain.KindVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.UserVO;
import com.vanda.service.PetService;
import com.vanda.service.UserService;

@Controller
@RequestMapping("/android")
public class AndroidController {
	
//	import 중요!!!!!
//	여기서 컨트롤러는 simple.json 을 사용해야함, map 컨트롤러는 그냥 json입니다
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="/login",produces="application/json; charset=utf-8")
	@ResponseBody
	public JSONObject login(String user_id, String user_pass, String token) {

		JSONObject userObj = new JSONObject();
		JSONObject petObj = new JSONObject();
		JSONArray petListObj = new JSONArray();
		
		System.out.println("id:"+user_id);
		System.out.println("pw:"+user_pass);
		System.out.println("token:"+token);
		System.out.println("----------------------------");
		
		UserVO userInfo = userService.login(user_id, user_pass);
		
		if(userInfo != null) { // 로그인 성공
			userService.tokenUpdate(user_id, token);
			List<PetVO> petInfoList = petService.getPetInfo(user_id);
			System.out.println(userInfo.getUser_id());
			System.out.println(userInfo.getUser_pass());
			System.out.println(userInfo.getUser_tel());
			System.out.println(userInfo.getUser_name());
			System.out.println(userInfo.getUser_sex());
			System.out.println("----------------------------");
			
			userObj.put("message", "로그인 성공");
			userObj.put("user_id", userInfo.getUser_id());
			userObj.put("user_pass", userInfo.getUser_pass());
			userObj.put("user_tel", userInfo.getUser_tel());
			userObj.put("user_name", userInfo.getUser_name());
			userObj.put("user_sex", userInfo.getUser_sex());
			
			
			for(PetVO pet : petInfoList) { // Register 테이블에 있는 펫 리스트 Json 형태로 저장
				
				KindVO kindInfo = petService.kindInfo(pet.getKind_num());

				System.out.println("펫 번호:"+pet.getPet_num());
				System.out.println("펫 이름:"+pet.getPet_name());
				System.out.println("펫 나이:"+pet.getPet_age());
				System.out.println("펫 성별:"+pet.getPet_sex());
				System.out.println("펫 중성화:"+pet.getPet_check());
				System.out.println("펫 품종번호:"+pet.getKind_num());
				System.out.println("펫 품종이:"+kindInfo.getKind_name());
				System.out.println("펫 표준체중(최고):"+kindInfo.getStd_high());
				System.out.println("펫 표준체중(최저):"+kindInfo.getStd_low());
				System.out.println("펫 사료:"+pet.getPet_check());
				System.out.println("----------------------------");
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("pet_name", pet.getPet_name());
				petObj.put("pet_age", pet.getPet_age());
				petObj.put("pet_sex", pet.getPet_sex());
				petObj.put("pet_check", pet.getPet_check());
				petObj.put("kind_num", pet.getKind_num());				
				petObj.put("kind_name", kindInfo.getKind_name());
				petObj.put("std_high", kindInfo.getStd_high());
				petObj.put("std_low", kindInfo.getStd_low());
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("food_num", pet.getFood_num());
				
				
				petListObj.add(petObj);
				petObj = new JSONObject();
				
			}
			userObj.put("petList",petListObj);
			
		} else {
			userObj.put("message", "잘못된 아이디 또는 비밀번호 입니다");
		}
		
		return userObj;
	}
	
	@RequestMapping(value="/autoLogin",produces="application/json; charset=utf-8")
	@ResponseBody
	public JSONObject autoLogin(String user_id,String token) {

		JSONObject userObj = new JSONObject();
		JSONObject petObj = new JSONObject();
		JSONArray petListObj = new JSONArray();
		
		System.out.println("id:"+user_id);
		System.out.println("token:"+token);
		System.out.println("----------------------------");
		
		UserVO userInfo = userService.autoLogin(user_id);
		
		if(userInfo != null) { // 로그인 성공
			userService.tokenUpdate(user_id, token);
			
			List<PetVO> petInfoList = petService.getPetInfo(user_id);
			System.out.println(userInfo.getUser_id());
			System.out.println(userInfo.getUser_pass());
			System.out.println(userInfo.getUser_tel());
			System.out.println(userInfo.getUser_name());
			System.out.println(userInfo.getUser_sex());
			System.out.println("----------------------------");
			
			userObj.put("message", "로그인 성공");
			userObj.put("user_id", userInfo.getUser_id());
			userObj.put("user_pass", userInfo.getUser_pass());
			userObj.put("user_tel", userInfo.getUser_tel());
			userObj.put("user_name", userInfo.getUser_name());
			userObj.put("user_sex", userInfo.getUser_sex());
			
			
			for(PetVO pet : petInfoList) { // Register 테이블에 있는 펫 리스트 Json 형태로 저장
				
				KindVO kindInfo = petService.kindInfo(pet.getKind_num());

				System.out.println("펫 번호:"+pet.getPet_num());
				System.out.println("펫 이름:"+pet.getPet_name());
				System.out.println("펫 나이:"+pet.getPet_age());
				System.out.println("펫 성별:"+pet.getPet_sex());
				System.out.println("펫 중성화:"+pet.getPet_check());
				System.out.println("펫 품종번호:"+pet.getKind_num());
				System.out.println("펫 품종이:"+kindInfo.getKind_name());
				System.out.println("펫 표준체중(최고):"+kindInfo.getStd_high());
				System.out.println("펫 표준체중(최저):"+kindInfo.getStd_low());
				System.out.println("펫 사료:"+pet.getPet_check());
				System.out.println("----------------------------");
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("pet_name", pet.getPet_name());
				petObj.put("pet_age", pet.getPet_age());
				petObj.put("pet_sex", pet.getPet_sex());
				petObj.put("pet_check", pet.getPet_check());
				petObj.put("kind_num", pet.getKind_num());				
				petObj.put("kind_name", kindInfo.getKind_name());
				petObj.put("std_high", kindInfo.getStd_high());
				petObj.put("std_low", kindInfo.getStd_low());
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("food_num", pet.getFood_num());
				
				
				petListObj.add(petObj);
				petObj = new JSONObject();
				
			}
			userObj.put("petList",petListObj);
			
		} else {
			userObj.put("message", "잘못된 아이디 또는 비밀번호 입니다");
		}
		
		return userObj;
	}
	
	@RequestMapping(value="/weightUpdate",produces="application/json; charset=utf-8")
	   @ResponseBody
	   public void weightUpdate(String pet_num, String weight) {
	      System.out.println("petNum:"+pet_num);
	      System.out.println("weight:"+weight+"kg");
	      int rpet_num = Integer.parseInt(pet_num);
	      double rweight =  Double.parseDouble(weight);
	      petService.weightUpdate(rpet_num, rweight);
	   
	   }

}
