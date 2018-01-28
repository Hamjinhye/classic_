package com.classic.product.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.MiniCateDTO;

public interface MiniCateDAO {
	public List<MiniCateDTO> selectMiniCateList(int num) throws Exception; 
	public List<MiniCateDTO> selectMiniCateList(PagingDTO pagingDTO, int cate, int num) throws Exception; 
	public List<MiniCateDTO> selectMiniCateListAll() throws Exception;
	
	//주연
	public List<MiniCateDTO> forSearchCataList() throws Exception;

}
