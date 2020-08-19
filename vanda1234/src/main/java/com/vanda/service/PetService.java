package com.vanda.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.EatVO;
import com.vanda.domain.FoodVO;
import com.vanda.domain.FoodWeightVO;
import com.vanda.domain.KindVO;
import com.vanda.domain.PetImgVO;
import com.vanda.domain.PetInfoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.WeightVO;

public interface PetService {

   // 펫등록
   public void petInsert(PetVO petVO);

   // register테이블에 등록
   public int petRegister(String user_id, String pet_name);

   // 배식 테이블 등록
   public void eatRegister(int pet_num);

   // 체중 테이블 등록
   public void weightRegister(int pet_num);

   // 위도경도 정보가 들어있는 xml파일 insert
   public void actRegister(int pet_num, String act_path, String act_name, double total_distance, String timer);

   // 펫 번호 가져오기
   public int getPetNum(String user_id, String pet_name);

   // 펫정보 가져옴
   public List<PetVO> getPetInfo(String user_id);

   // 선택한 펫정보 가져오기
   public PetVO changePetList(int pet_num);

   // 선택한 펫 배식 정보 가져오기
   public EatVO eatList(int pet_num);

   // 선택한 펫 체중 정보 가져오기
   public WeightVO weightList(int pet_num);

   // 선택한 펫 활동 정보 읽어오기
   public List<ActivityVO> actList(int pet_num);

   // 선택한 펫 사료 정보 가져오기
   public FoodVO foodInfo(int food_num);

   // 품종 정보 가 져오기
   public KindVO kindInfo(int kind_num);
   
   // 안드로이드 오늘 몸무게
   public WeightVO recentlyWeightAndroid(int pet_num);
   
   // 안드로이드 최근 몸무게
   public WeightVO todayWeightAndroid(int pet_num);
   
   // 안드로이드 오늘 배식
   public EatVO todayEatAndroid(int pet_num);
   
   // 안드로이드 오늘 활동량
   public ActivityVO todayActAndroid(int pet_num);

   // 안드로이드 적절 배식량
   public List<FoodWeightVO> standardEat(int food_num);

   public void weightUpdate(int rpipetnum, double pet_weight);
   
   public void eatUpdate(int rpipetnum, float eat_gram);

   public PetInfoVO petInfo(String user_id, int pet_num);
   

   public List<PetImgVO> getImgList(int pet_Num);

   public void petImgInsert(PetVO petVO);

   public PetInfoVO nonSelectedPet(Integer oldPetnum);
}