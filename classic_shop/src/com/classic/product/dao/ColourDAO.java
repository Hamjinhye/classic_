package com.classic.product.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.ColourDTO;

public interface ColourDAO {
	
	public List<ColourDTO> selectColourList(int product_num) throws Exception;
	public List<ColourDTO> selectCateListColours(PagingDTO pagingDTO, int cate, int num) throws Exception;
	public List<ColourDTO> selectMiniCateListColours(int cate_num) throws Exception;
	
}
