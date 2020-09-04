
package com.vanda.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.EatVO;
import com.vanda.domain.FoodWeightVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.UserVO;
import com.vanda.domain.WeightVO;
import com.vanda.service.PetService;
import com.vanda.service.UserService;

@Controller

@RequestMapping("/android")
public class AndroidController {

	// import 중요!!!!! // 여기서 컨트롤러는 simple.json 을 사용해야함, map 컨트롤러는 그냥 json입니다

	@Autowired
	private UserService userService;

	@Autowired
	private PetService petService;

	@RequestMapping(value = "/login", produces = "application/json; charset=utf-8")

	@ResponseBody
	public JSONObject login(String user_id, String user_pass, String token) {

		JSONObject userObj = new JSONObject();
		JSONObject petObj = new JSONObject();
		JSONArray petListObj = new JSONArray();

		System.out.println("id:" + user_id);
		System.out.println("pw:" + user_pass);
		System.out.println("token:" + token);
		System.out.println("----------------------------");

		UserVO userInfo = userService.login(user_id, user_pass);

		if (userInfo != null) { // 로그인 성공 
			userService.tokenUpdate(user_id, token);
			List<PetVO> petList = petService.getPetInfo(user_id);
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

			for (PetVO pet : petList) { // Register 테이블에 있는 펫 리스트 Json 형태로 저장 PetInfoVO
				
				List<FoodWeightVO> foodWeightVO = petService.standardEat(pet.getFood_num());
				List<EatVO> eatList = petService.eatListAndroid(pet.getPet_num());
				List<WeightVO> weightList = petService.weightListAndroid(pet.getPet_num());
				List<ActivityVO> actList = petService.actList(pet.getPet_num());
				
				WeightVO weightVO = petService.todayWeightAndroid(pet.getPet_num());
				EatVO eatVO = petService.todayEatAndroid(pet.getPet_num());
				ActivityVO actVO = petService.todayActAndroid(pet.getPet_num());
				Double weight,distance; 
				int eat,gram = 0;
				Double standardWeight = (petService.kindInfo(pet.getKind_num()).getStd_high() + petService.kindInfo(pet.getKind_num()).getStd_low()) / 2;
		
				if(weightVO != null) {
					weight = weightVO.getPet_weight();
				} else {
					if(petService.recentlyWeightAndroid(pet.getPet_num())!=null) {
						weight = petService.recentlyWeightAndroid(pet.getPet_num()).getPet_weight();
					} else {
						weight = 0.0;
					}
				}
				
				if(eatVO != null) {
					eat = eatVO.getEat_gram();
				} else {
					eat = 0;
				}
				
				if(actVO != null) {
					distance = actVO.getTotal_distance();
				} else {
					distance = 0.0;
				}
				
				for(int i=0; i<foodWeightVO.size();i++) {
					int low = foodWeightVO.get(i).getLow_weight();
					int high = foodWeightVO.get(i).getHigh_weight();
					if(low <= weight && weight <= high) {
						gram = foodWeightVO.get(i).getGram();
						break;
					}
				}
				

				System.out.println("펫 번호:" + pet.getPet_num());
				System.out.println("펫 이름:" + pet.getPet_name());
				System.out.println("펫 나이:" + pet.getPet_age());
				System.out.println("펫 성별:" + pet.getPet_sex());
				System.out.println("펫 중성화:" + pet.getPet_check());
				System.out.println("펫 몸무게:" + weight);
				System.out.println("펫 표준 몸무게:" + standardWeight);
				System.out.println("펫 급여량:" + eat);
				System.out.println("펫 표준 급여량:" + gram);
				System.out.println("펫 산책:" + distance);
				System.out.println("체중 기록:"+weightList);
				System.out.println("배식 기록:"+eatList.get(0).getEat_time());
				System.out.println("산책 기록:"+actList);
				System.out.println("----------------------------");
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("pet_name", pet.getPet_name());
				petObj.put("pet_age", pet.getPet_age());
				petObj.put("pet_sex", pet.getPet_sex());
				petObj.put("pet_check", pet.getPet_check());
				petObj.put("pet_weight", weight);
				petObj.put("avg_weight", standardWeight);
				petObj.put("pet_eat", eat);
				petObj.put("avg_eat", gram);
				petObj.put("pet_act", distance);
				petObj.put("weight_list",weightList);
				petObj.put("eat_list",eatList);
				petObj.put("act_list",actList);
				

				petListObj.add(petObj);

				
				petObj = new JSONObject();

			}
			userObj.put("petList", petListObj);

		} else {
			userObj.put("message", "잘못된 아이디 또는 비밀번호 입니다");
		}

		return userObj;
	}

	@RequestMapping(value = "/autoLogin", produces = "application/json; charset=utf-8")

	@ResponseBody
	public JSONObject autoLogin(String user_id, String token) {

		JSONObject userObj = new JSONObject();
		JSONObject petObj = new JSONObject();
		JSONObject weightObj = new JSONObject();
		JSONObject eatObj = new JSONObject();
		JSONObject actObj = new JSONObject();
		JSONArray petListObj = new JSONArray();
		JSONArray weightListObj = new JSONArray();
		JSONArray eatListObj = new JSONArray();
		JSONArray actListObj = new JSONArray();
		
		System.out.println("id:" + user_id);
		System.out.println("token:" + token);
		System.out.println("----------------------------");

		UserVO userInfo = userService.autoLogin(user_id);

		if (userInfo != null) { // 로그인 성공 
			
			userService.tokenUpdate(user_id, token);

			List<PetVO> petList = petService.getPetInfo(user_id);
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

			for (PetVO pet : petList) { // Register 테이블에 있는 펫 리스트 Json 형태로 저장

				List<FoodWeightVO> foodWeightVO = petService.standardEat(pet.getFood_num());
				List<EatVO> eatList = petService.eatListAndroid(pet.getPet_num());
				List<WeightVO> weightList = petService.weightListAndroid(pet.getPet_num());
				List<ActivityVO> actList = petService.actList(pet.getPet_num());
				
				WeightVO weightVO = petService.todayWeightAndroid(pet.getPet_num());
				EatVO eatVO = petService.todayEatAndroid(pet.getPet_num());
				ActivityVO actVO = petService.todayActAndroid(pet.getPet_num());
				Double weight,distance; 
				int eat,gram = 0;
				Double standardWeight = (petService.kindInfo(pet.getKind_num()).getStd_high() + petService.kindInfo(pet.getKind_num()).getStd_low()) / 2;
		
				if(weightVO != null) {
					weight = weightVO.getPet_weight();
				} else {
					if(petService.recentlyWeightAndroid(pet.getPet_num())!=null) {
						weight = petService.recentlyWeightAndroid(pet.getPet_num()).getPet_weight();
					} else {
						weight = 0.0;
					}
				}
				
				if(eatVO != null) {
					eat = eatVO.getEat_gram();
				} else {
					eat = 0;
				}
				
				if(actVO != null) {
					distance = actVO.getTotal_distance();
				} else {
					distance = 0.0;
				}
				
				for(int i=0; i<foodWeightVO.size();i++) {
					int low = foodWeightVO.get(i).getLow_weight();
					int high = foodWeightVO.get(i).getHigh_weight();
					if(low <= weight && weight <= high) {
						gram = foodWeightVO.get(i).getGram();
						break;
					}
				}
				

				System.out.println("펫 번호:" + pet.getPet_num());
				System.out.println("펫 이름:" + pet.getPet_name());
				System.out.println("펫 나이:" + pet.getPet_age());
				System.out.println("펫 성별:" + pet.getPet_sex());
				System.out.println("펫 중성화:" + pet.getPet_check());
				System.out.println("펫 몸무게:" + weight);
				System.out.println("펫 표준 몸무게:" + standardWeight);
				System.out.println("펫 급여량:" + eat);
				System.out.println("펫 표준 급여량:" + gram);
				System.out.println("펫 산책:" + distance);
				System.out.println("체중 기록:"+weightList);
				System.out.println("배식 기록:"+eatList);
				System.out.println("산책 기록:"+actList);
				System.out.println("----------------------------");
				petObj.put("pet_num", pet.getPet_num());
				petObj.put("pet_name", pet.getPet_name());
				petObj.put("pet_age", pet.getPet_age());
				petObj.put("pet_sex", pet.getPet_sex());
				petObj.put("pet_check", pet.getPet_check());
				petObj.put("pet_weight", weight);
				petObj.put("avg_weight", standardWeight);
				petObj.put("pet_eat", eat);
				petObj.put("avg_eat", gram);
				petObj.put("pet_act", distance);
				petObj.put("weight_list",weightList);
				petObj.put("eat_list",eatList);
				petObj.put("act_list",actList);
				

				petListObj.add(petObj);

				
				petObj = new JSONObject();

			}
			userObj.put("petList", petListObj);
			

		} else {
			userObj.put("message", "잘못된 아이디 또는 비밀번호 입니다");
		}

		return userObj;
	}

	@RequestMapping(value = "/weightUpdate", produces = "application/json; charset=utf-8")

	@ResponseBody
	public void weightUpdate(String pet_num, String weight) {
		System.out.println("petNum:" + pet_num);
		System.out.println("weight:" + weight + "kg");
		int petNum = Integer.parseInt(pet_num);
		double weights = Double.parseDouble(weight);
		petService.weightUpdate(petNum, weights);

	}

}
