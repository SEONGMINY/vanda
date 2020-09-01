package com.vanda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.EatVO;
import com.vanda.domain.FoodVO;
import com.vanda.domain.HospitalVO;
import com.vanda.domain.KindVO;
import com.vanda.domain.PetImgVO;
import com.vanda.domain.PetInfoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.WeightVO;
import com.vanda.mapper.PetImgMapper;
import com.vanda.mapper.PetMapper;

@Repository
public class PetServiceImpl implements PetService {

   @Autowired
   private PetMapper petMapper;

   @Autowired
   private PetImgMapper imgMapper;
   
   // 펫등록
   @Override
   public void petInsert(PetVO petVO) {
      petMapper.petInsert(petVO);
      
      
   }
   
   @Override
   public void petImgInsert(PetVO petVO) {
   
      if (petVO.getImgList() == null || petVO.getImgList().size() <= 0)
      {
         System.out.println("이미지 없음");
         return;
      }

      petVO.getImgList().forEach(img -> {

         img.setPetNum(petVO.getPet_num());
         imgMapper.insert(img);
         System.out.println("펫브이오의 펫넘 : " + petVO.getPet_num());
      });
   }

   // register테이블에 등록
   public int petRegister(String user_id, String pet_name) {
      return petMapper.petRegister(user_id, pet_name);
   }

   // 배식테이블에 등록
   public void eatRegister(int pet_num) {
      petMapper.eatRegister(pet_num);
   }

   // 체중 테이블 등록
   public void weightRegister(int pet_num) {
      petMapper.weightRegister(pet_num);
   }

   // 펫 번호 가져오기
   public int getPetNum(String user_id, String pet_name) {
      return petMapper.getPetNum(user_id, pet_name);
   }

   // 로그인한 유저의 펫 목록 가져오기
   public List<PetVO> getPetInfo(String user_id) {
      return petMapper.getPetInfo(user_id);
   }

   // 선택한 펫정보 가져오기
   public PetVO changePetList(int pet_num) {

      return petMapper.changePetList(pet_num);
   }

   // 선택한 펫 배식 정보 가져오기
   public EatVO eatList(int pet_num) {
      return petMapper.eatList(pet_num);
   }

   // 선택한 펫 체중 정보 가져오기
   public WeightVO weightList(int pet_num) {
      return petMapper.weightList(pet_num);
   }

   // 선택한 펫 사료 정보 가져오기
   public FoodVO foodInfo(int food_num) {
      return petMapper.foodInfo(food_num);
   }



   @Override
   public void weightUpdate(int rpipetnum,double pet_weight) {
      petMapper.weightUpdate(rpipetnum,pet_weight);
      
   }
   
   @Override
   public void eatUpdate(int rpipetnum,float eat_gram) {
      petMapper.eatUpdate(rpipetnum,eat_gram);
      
   }

   @Override
   public PetInfoVO petInfo(String user_id, int pet_num, int food_num) {
      // TODO Auto-generated method stub
      return petMapper.petInfo(user_id,pet_num, food_num);
   }
   
   @Override
  	public PetInfoVO recentPetInfo(String user_id, int pet_num, int food_num) {
  		// TODO Auto-generated method stub
  		return petMapper.recentPetInfo(user_id,pet_num, food_num);
  	}

   @Override
   public List<PetImgVO> getImgList(int petNum) {
      return imgMapper.findBypostNum(petNum);
   }

   @Override
   public void actRegister(int pet_num, String act_path, String act_name, double total_distance, String timer) {
      // TODO Auto-generated method stub
      petMapper.actRegister(pet_num, act_path, act_name, total_distance, timer);
   }

   public List<ActivityVO> actList(int pet_num) {
      return petMapper.actList(pet_num);
   }

   @Override
   public KindVO kindInfo(int kind_num) {
      // TODO Auto-generated method stub
      return petMapper.kindInfo(kind_num);
   }

   @Override
   public PetInfoVO nonSelectedPet(Integer oldPetnum) {
      return petMapper.nonSelectedPet(oldPetnum);
      
   }

@Override
public HospitalVO selectHospital(String hosp_name) {
	// TODO Auto-generated method stub
	return petMapper.selectHospital(hosp_name);
	
}
}