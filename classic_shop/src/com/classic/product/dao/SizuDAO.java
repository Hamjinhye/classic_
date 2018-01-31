package com.classic.product.dao;

import java.util.List;

import com.classic.product.dto.SizuDTO;

public interface SizuDAO {
	public List<SizuDTO> selectSizuList(int product_num) throws Exception;
}
