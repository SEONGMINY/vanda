package com.vanda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.OrderVO;
import com.vanda.domain.ProductVO;
import com.vanda.mapper.OrderMapper;

@Repository
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	 

	public void orderinfo(OrderVO orderVO) {
		 orderMapper.orderinfo(orderVO);
	}


	@Override
	public void orderlist(int ord_num, int pro_num, int ord_amount) {
		orderMapper.orderlist(ord_num, pro_num, ord_amount);	
	}

	//상품 수량 카운트
	@Override
	public void amount_discount(ProductVO productVO) {
		// TODO Auto-generated method stub
		orderMapper.amount_discount(productVO);
	}


	@Override
	public ArrayList<ProductVO> bestProduct(ProductVO productVO) {
		
		return orderMapper.bestProduct(productVO);
	}

	//인기상품
	
	
	
	
	
}
