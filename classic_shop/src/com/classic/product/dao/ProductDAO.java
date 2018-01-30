package com.classic.product.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.ProductDTO;

public interface ProductDAO {

	public List<ProductDTO> selectProductList(PagingDTO pagingDTO, int cate, int num) throws Exception;
	public List<ProductDTO> selectMiniCateProductList(int cate_num) throws Exception;
	//public List<ProductDTO> selectProductList(pagingDTO p) throws Exception;
	public ProductDTO selectProduct(int num) throws Exception;
	public int  productTotalRecord(int num, int cate) throws Exception;
	
}
