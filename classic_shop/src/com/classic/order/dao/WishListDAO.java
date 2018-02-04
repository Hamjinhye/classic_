package com.classic.order.dao;

import java.sql.Connection;
import java.util.List;

import com.classic.order.dto.ColourDTO;
import com.classic.order.dto.WishDTO;
import com.classic.product.dto.SizuDTO;

public interface WishListDAO {
	public List<WishDTO> selectWish (int memNum) throws Exception;
	public WishDTO selectWish (int memNum, int productNum) throws Exception;
	public int WishDel (int memNum) throws Exception;
	public int WishDel (int memNum,int productNum) throws Exception;
	public int recodeTotal(int memNum) throws Exception;
	public List<ColourDTO> selectProductColour (int productNum) throws Exception;
	public List<SizuDTO> selectProductSizu (int productNum) throws Exception;
}
