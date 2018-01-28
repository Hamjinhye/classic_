package com.classic.product.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.ProductDTO;

public interface SearchDAO {
	
	//나중에 반장님이랑 합칠 것
	
	//카테고리
	//상품명
	//판매가격대
	
	//카테고리 옵션 select 먼저..하려면..카테고리 셀렉트가 필요함..
	//반장님거 훔쳐오기..
	
	public List<String> selectProductName(String name) throws Exception;
	
	
}
