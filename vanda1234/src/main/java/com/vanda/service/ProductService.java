package com.vanda.service;

import java.util.ArrayList;

import com.vanda.domain.ProductVO;

public interface ProductService {

	public int proInsert(ProductVO vo);

	public int pro_imgInsert(ProductVO vo);

	public ArrayList<ProductVO> get_productList();

	public int ProductDel(ProductVO vo);

	public int ImageDel(ProductVO vo);

	public int ProductModify(ProductVO vo);

	public int ImageModify(ProductVO vo);
	
	public ProductVO get_Product(int pro_num);
	
	public String get_ImageName(int pro_num);
	
	//제품 상세화면
	public ProductVO read(int pro_num) throws Exception;
}
