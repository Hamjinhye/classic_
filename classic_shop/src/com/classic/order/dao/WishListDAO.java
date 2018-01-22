package com.classic.order.dao;

import java.sql.Connection;
import java.util.List;

import com.classic.order.dto.ColourDTO;
import com.classic.order.dto.WishDTO;

public interface WishListDAO {
	public List<WishDTO> selectWish (int memNum) throws Exception;
	public int WishDel (int memNum) throws Exception;
	public int WishDel (int memNum,int productNum) throws Exception;
	public int recodeTotal(int memNum) throws Exception;
	public ColourDTO selectProductColour (int productNum) throws Exception;
}
