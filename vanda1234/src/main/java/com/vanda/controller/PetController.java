package com.vanda.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vanda.common.Criteria;
import com.vanda.domain.ActivityVO;
import com.vanda.domain.FoodVO;
import com.vanda.domain.FoodVOList;
import com.vanda.domain.PetImgVO;
import com.vanda.domain.PetInfoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.PostImgVO;
import com.vanda.domain.UserVO;
import com.vanda.domain.WalksVO;
import com.vanda.mapper.PetMapper;
import com.vanda.service.FoodService;
import com.vanda.service.KindService;
import com.vanda.service.PetService;

@Controller
@RequestMapping("/pet/*")
public class PetController {

	@Autowired
	private FoodService foodservice;
	
	@Autowired
	private PetService petService;

	@Autowired
	private PetMapper petMapper;
	
	@Autowired
	private KindService kindService;
	

	// 센서값 리스트(받아온 값이 string형일때)
	ArrayList<Float> list = new ArrayList<Float>();
	int i = 0;

	// 비만매니지먼트 화면
	@RequestMapping(value = "/main")
	public String petMain(HttpSession session, Model model) {
		System.out.println("비만매니지먼트화면");

		UserVO loginUser = (UserVO) session.getAttribute("check");
		if (loginUser == null) {
			System.out.println("로그인된 유저 없음");

			return "pet/main";
		}

		else {/*
				 * String user_id = loginUser.getUser_id(); //로그인한 유저의 펫정보를 받아옴. List<PetVO>
				 * petUser = petService.getPetInfo(user_id);
				 * 
				 * 
				 * //model.addAttribute("pet2", petUser); session.setAttribute("pet", petUser);
				 * System.out.println("pet정보 : " + petUser);
				 */
			return "pet/main";
		}
		// return "pet/main";
	}
	
	@GetMapping({ "/pet"})
	public void get(@RequestParam("petNum") int petNum,Model model) {

		model.addAttribute("post", petService.getpetNum(petNum));
	}

	// 펫 등록 화면
	@RequestMapping(value = "/petRegister")
	public String petRegisterForm(HttpSession session) {
		System.out.println("펫등록 화면");
		UserVO loginUser = (UserVO) session.getAttribute("check");
		if (loginUser == null) {
			System.out.println("로그인된 유저 없음 로그인화면 이동");

			return "redirect:/user/login";
		} else {
			//견종 세션 및 견종에 해당하는 사료종류세션
			session.setAttribute("kindList", kindService.kindList()); 
			session.setAttribute("defaultFood", kindService.foodList(1));
			return "pet/petRegister";
		}

	}
	//사료리스트 list로 받기
	@ResponseBody
	@RequestMapping(value ="/petFood", method = RequestMethod.POST)
	public String petFoodList(int kind_num,PetVO petVO) {
		
		ArrayList<FoodVO> list = kindService.foodList(kind_num);
		System.out.println(list.size() + "개");
		FoodVOList voLists = new FoodVOList();
		voLists.lists = list;
		
		
		return voLists.toJson();
	}

	// 펫 등록 처리
	@RequestMapping(value = "/petRegister", method = RequestMethod.POST)
	public String petRegister(PetVO petVO, HttpSession session) {
		System.out.println("펫등록화면");
		UserVO loginUser = (UserVO) session.getAttribute("check");
		String user_id = loginUser.getUser_id();
		System.out.println("로그인 유저 아이디 : " + user_id);

		/* String user_id = loginUser.getUser_id(); */
	
		System.out.println("등록완료");
		System.out.println(petVO.toString());

		if (petVO.getImgList() != null) {
			System.out.println("pet컨트롤러 이미지가 널이아닐때");
			petVO.getImgList().forEach((img) -> img.toString());
			System.out.println("petVO.getImglist : " + petVO.getImgList());
		}
		// 펫테이블에 등록
		petService.petInsert(petVO);

		// register 테이블에 등록
		String pet_name = petVO.getPet_name();
		petService.petRegister(user_id, pet_name);

		int pet_num = petService.getPetNum(user_id, pet_name);
		System.out.println("등록된 펫의 펫 넘바 : " + pet_num);
		petService.eatRegister(pet_num); // 배식테이블에 insert
		petService.weightRegister(pet_num);
		petVO.setPet_num(pet_num);
		 petService.petImgInsert(petVO); 
        List<PetVO> petUser = petService.getPetInfo(user_id);
        
        
        session.setAttribute("pet",petUser);
		return "home";

	}

	// 선택한 펫의 목록보여줌
	// ajax사용시 쓸거임
	
	@GetMapping(value = "/getImgList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
		public ResponseEntity<List<PetImgVO>> getImgList(int petNum){
		System.out.println("펫컨트롤러 겟이미지리스트");
			return new ResponseEntity<>(petService.getImgList(petNum), HttpStatus.OK);
		}

	@ResponseBody
	@RequestMapping(value = "/selectedPet", method = RequestMethod.POST)
	public PetInfoVO changePetList(int pet_num, HttpSession session, Model model) {
		System.out.println(pet_num);

		UserVO userVO = (UserVO) session.getAttribute("check");
		String user_id = userVO.getUser_id();
		int food_num = Integer.parseInt(foodservice.getfood(pet_num));
		PetInfoVO petinfoVO = petService.petInfo(user_id, pet_num,food_num);
		
		if(petinfoVO == null) {
			petinfoVO = petService.recentPetInfo(user_id, pet_num, food_num);
			
		}

		return petinfoVO;

	}
	
	@ResponseBody
	   @RequestMapping(value = "/walksList", method = RequestMethod.POST)
	   public List<WalksVO> walkList(int pet_num, HttpSession session, Model model) {
	      System.out.println("펫 산책선택:"+pet_num);

	      // 산책 리스트
	      List<ActivityVO> actList = petService.actList(pet_num);
	      List<WalksVO> walksList = new ArrayList<>();

	      // 산책 리스트 xml 파일을 변환
	      // LAT,LON XML파일 데이터로 변환

	      for (int i = 0; i < actList.size(); i++) {
	         String path = actList.get(i).getAct_path();
	         String fileName = actList.get(i).getAct_name();

	         try {
	            
	            System.out.println("test:"+path+"/"+fileName+".xml");
	            JAXBContext jaxbContext = JAXBContext.newInstance(WalksVO.class);
	            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

	            // We had written this file in marshalling example
	            WalksVO walks = (WalksVO) jaxbUnmarshaller.unmarshal(new File(path+"/"+fileName+".xml"));

	            walksList.add(walks);
	            System.out.println("test:"+walksList.get(i).getWalks());

	         } catch (Exception e) {
	            // TODO: handle exception
	        	 System.out.println(e);
	         }

	      }
	      
	      return walksList;
	   }
	

	//배식
	@PostMapping("/DIS")
	@ResponseBody
	public void DIS(HttpServletRequest httpServletRequest, HttpSession session) throws IOException {

		// 받아온 센서값이 string형
		String test = httpServletRequest.getParameter("result");

		// 받아온 센서값 int형 변환.
		 //int test = Integer.parseInt(httpServletRequest.getParameter("result"));

		//JSON 변환
		JSONObject test1 = new JSONObject(test);
		String device_id = (String) test1.get("device_id");
		float data = test1.getFloat("data");
	
		int device_type = test1.getInt("device_type");

		System.out.println("----------------------------------------------");
		System.out.println("----------디바이스 아이디 값 : " + device_id + "\r데이터 값 : " + data + "\r장치 타입 : " + device_type);
		System.out.println("\r현재 배열 : " + list.toString());
		System.out.println("----------------------------------------------");
	
			petService.eatUpdate(101,data);
			list.clear();
		

}
	@PostMapping(value="/weightUpdate")
	   @ResponseBody
	   public void weightUpdate(HttpServletRequest httpServletRequest) {
		
	
		String test = httpServletRequest.getParameter("result");
		
		JSONObject test1 = new JSONObject(test);


		float data = test1.getFloat("data");
	     
	      petService.weightUpdate(101, data);
	  	System.out.println(data);
	   
	   }
	
	@ResponseBody
	@RequestMapping(value = "/recommandKcal", method = RequestMethod.POST)
	public String recommandKcal(int pet_num,HttpSession session) {
		System.out.println("추천 칼로"+pet_num);

		PetVO petVO = petService.getKcal(pet_num);
		ActivityVO actVO = petService.todayActAndroid(pet_num);
		
		if (actVO!=null) {
			int kind = petVO.getKind_num();
			System.out.println("견종"+kind);
			int age = Integer.parseInt(petVO.getPet_age());
			System.out.println("나이"+age);
			String timer = actVO.getTimer();
			String mm = timer.substring(0,2);

			if(kind == 1 || kind == 2) { // 30분
				System.out.println("1");
				if(0 <= age && age < 2) { // 애기
					System.out.println(mm+":"+"15");
					return mm+":"+"15";
				} else if (2 <= age && age < 7) { // 청년
					System.out.println(mm+":"+"30");
					return mm+":"+"30";
				} else if (7 <= age) { // 노인
					System.out.println(mm+":"+"노인");
					return mm+":"+"15";
				}
			} else if (kind == 3 || kind == 4) { // 1시간
				System.out.println("2");
				if(0 <= age && age < 2) { // 애기
					System.out.println(mm+":"+"1시간 애기");
					return mm+":"+"30";
				} else if (2 <= age && age < 7) { // 청년
					System.out.println(mm+":"+"1시간 청년");
					return mm+":"+"60";
				} else if (7 <= age) { // 노인
					System.out.println(mm+":"+"1시간 노인");
					return mm+":"+"45";
				}
			}
		} else {
			return "";
		}

		

		return "";

	}




}