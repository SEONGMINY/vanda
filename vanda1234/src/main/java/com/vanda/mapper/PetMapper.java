package com.vanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.EatVO;
import com.vanda.domain.FoodVO;
import com.vanda.domain.FoodWeightVO;
import com.vanda.domain.HospitalVO;
import com.vanda.domain.KindVO;
import com.vanda.domain.PetInfoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.WeightVO;

public interface PetMapper {

   // 펫등록 (펫테이블)
   public int petInsert(PetVO petVO);
   
   // 칼로리
   public PetVO getKcal(@Param("pet_num") int pet_num);

   // 펫등록 (register테이블)
   public int petRegister(@Param("user_id") String user_id, @Param("pet_name") String pet_name);

   // 로그인시 펫정보를 불러오기위함.
   public List<PetVO> getPetInfo(String user_id);

   // 배식테이블에 등록
   public void eatRegister(int pet_num);

   // 체중 테이블 등록
   public void weightRegister(int pet_num);

   // 위도경도 정보가 들어있는 xml파일 insert
   public void actRegister(@Param("pet_num") int pet_num, @Param("act_path") String act_path,
         @Param("act_name") String act_name, @Param("total_distance") double total_distance,@Param("timer")String timer);

   // 선택한 펫 정보 읽어오기
   public PetVO changePetList(int pet_num);

   // 선택한 펫 배식 정보 읽어오기
   public EatVO eatList(int pet_num);
   
   public List<EatVO> eatListAndroid(@Param("pet_num") int pet_num);

   // 펫 번호 가져오기
   public int getPetNum(@Param("user_id") String user_id, @Param("pet_name") String pet_name);

   // 선택한 펫 체중 정보 가져오기
   public WeightVO weightList(int pet_num);
   
   public List<WeightVO> weightListAndroid(@Param("pet_num") int pet_num);

   // 선택한 펫 사료 정보 가져오기
   public FoodVO foodInfo(int food_num);

   // 선택한 펫 활동 정보 읽어오기
   public List<ActivityVO> actList(@Param("pet_num") int pet_num);

   // 품종 정보 가져오기
   public KindVO kindInfo(@Param("kind_num") int kind_num);

   public String getKindkg(int kind_num);

   public void insertDevData(@Param("device_id") String device_id, @Param("data") float data);

   public void weightUpdate(@Param("device_id") String device_id, @Param("pet_weight") float pet_weight);

   public PetInfoVO petInfo(@Param("user_id") String user_id, @Param("pet_num") int pet_num, @Param("food_num") int food_num);

   public PetInfoVO recentPetInfo(@Param("user_id") String user_id, @Param("pet_num") int pet_num, @Param("food_num") int food_num);
   
   public int lastPetNum();

   public void updatePetImg(int last_petnum);

   public void weightUpdate(@Param("rpipetnum")int rpipetnum,@Param("pet_weight")double pet_weight);
   
   public void eatUpdate(@Param("dispetnum")int dispetnum,@Param("eat_gram")float eat_gram);

   public PetInfoVO nonSelectedPet(Integer oldPetnum);

   public HospitalVO selectHospital(String hosp_name);
   
   // 안드로이드 오늘 몸무게
   public WeightVO todayWeightAndroid(@Param("pet_num") int pet_num);
   
   // 안드로이드 최근 몸무게
   public WeightVO recentlyWeightAndroid(@Param("pet_num") int pet_num);
   
   // 안드로이드 오늘 배식
   public EatVO todayEatAndroid(@Param("pet_num") int pet_num);
   
   // 안드로이드 오늘 활동량
   public ActivityVO todayActAndroid(@Param("pet_num") int pet_num);
   
   // 안드로이드 적절 배식량
   public List<FoodWeightVO> standardEat(@Param("food_num") int food_num);
}
