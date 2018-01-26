package com.classic.order.dao;

import com.classic.order.dto.WishDTO;

public interface CartDao {
	public WishDTO fromWishMoveCart(int mem_num, int product_num) throws Exception;
	public int MoveCartDelWish(int mem_num, int product_num) throws Exception;
}
