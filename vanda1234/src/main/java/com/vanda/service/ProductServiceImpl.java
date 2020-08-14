package com.vanda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.ProductVO;
import com.vanda.mapper.ProductMapper;

@Repository
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public int proInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		return mapper.proInsert(vo);
	}

	@Override
	public int pro_imgInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		return mapper.pro_imgInsert(vo);
	}

	@Override
	public ArrayList<ProductVO> get_productList() {

		return mapper.get_productList();
	}

	@Override
	public int ProductDel(ProductVO vo) {
		return mapper.ProductDel(vo);
	}

	@Override
	public int ImageDel(ProductVO vo) {
		return mapper.ImageDel(vo);
	}

	@Override
	public int ProductModify(ProductVO vo) {
		return mapper.ProductModify(vo);
	}

	@Override
	public int ImageModify(ProductVO vo) {
		return mapper.ImageModify(vo);
	}

	@Override
	public ProductVO get_Product(int pro_num) {
		return mapper.get_Product(pro_num);
	}

	@Override
	public String get_ImageName(int pro_num) {
		return mapper.get_ImageName(pro_num);
	}

	@Override
	public ProductVO read(int pro_num) throws Exception {
		
		return mapper.read(pro_num);
	}

}
