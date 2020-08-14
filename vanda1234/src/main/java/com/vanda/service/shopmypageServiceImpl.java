package com.vanda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.OrderListVO;
import com.vanda.domain.OrderVO;
import com.vanda.mapper.OrderMapper;
import com.vanda.mapper.ShopMypageMapper;

@Repository
public class shopmypageServiceImpl implements shopmypageService {
	
	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private ShopMypageMapper shopmypageMapper;

	public void orderinfo(OrderVO orderVO) {
		 orderMapper.orderinfo(orderVO);
	}


	public ArrayList<OrderListVO> mypage(String user_id){
		
		return shopmypageMapper.mypage(user_id);
	}
	
	
}
