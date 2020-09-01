package com.vanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.FoodVO;
import com.vanda.mapper.FoodMapper;


@Repository
public class FoodServiceImpl implements FoodService {

 
   
   @Autowired
   private FoodMapper foodMapper;
   
   // 펫등록
   @Override
   public String getfood(int pet_num)  {
      return foodMapper.getfood(pet_num);
      
      
   }
   
  
}