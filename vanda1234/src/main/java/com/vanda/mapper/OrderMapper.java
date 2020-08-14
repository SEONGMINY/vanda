package com.vanda.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.vanda.domain.OrderVO;
import com.vanda.domain.ProductVO;

public interface OrderMapper {

	//수령인 상세 정보 입력란
	public void orderinfo(OrderVO orderVO);
	
	//상품주문 이후 부분
	public void orderlist(@Param("ord_num")int ord_num, @Param("pro_num")int pro_num, @Param("ord_amount")int ord_amount);
	
	// 수량 업데이트(상품 주문 후 실행 되야함)
	public void amountupdate(ProductVO productVO);

	//상품 수량 카운트
	public void amount_discount(ProductVO productVO);
	
	//인기상품
	public ArrayList<ProductVO> bestProduct(ProductVO productVO);
}
