package com.vanda.service;

import java.util.ArrayList;

import com.vanda.domain.OrderVO;
import com.vanda.domain.ProductVO;

public interface OrderService {

	public void orderinfo(OrderVO orderVO);
	
	//상품주문 이후 부분
	public void orderlist(int ord_num,int pro_num,int ord_amount);

	//상품 수량 카운트
	public void amount_discount(ProductVO productVO);
	
	//인기상품
	public ArrayList<ProductVO> bestProduct(ProductVO productVO);
}
