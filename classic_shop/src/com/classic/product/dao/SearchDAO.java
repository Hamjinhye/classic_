package com.classic.product.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.ProductDTO;

public interface SearchDAO {
	
	public List<String> selectProductName(String name) throws Exception; //상품 검색 상품명 자동 완성
	
	
}
