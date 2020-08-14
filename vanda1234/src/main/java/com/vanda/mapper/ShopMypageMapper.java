package com.vanda.mapper;

import java.util.ArrayList;

import com.vanda.domain.OrderListVO;

public interface ShopMypageMapper {

	//유저 마이페이지
	public ArrayList<OrderListVO> mypage(String user_id);

}
