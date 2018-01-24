package com.classic.order.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.classic.order.dao.CartDao;
import com.classic.order.dto.WishDTO;

public class CartDaoImp implements CartDao{
	private Connection conn;
	public CartDaoImp(Connection conn) {
		this.conn = conn;
	}
	@Override
	public WishDTO fromWishMoveCart(int mem_num, int product_num) throws Exception {
		WishDTO product = null; 
		String sql = "select p.price , p.name , w.product_num ,count(w.product_num) as count, s.sizu, c.name as colour " 
				+ "from product p, wish w ,sizu s , colour c " 
				+ "where p.num = w.product_num " 
				+ "and w.sizu_num = s.num " 
				+ "and w.colour_num = c.num "
				+ "and w.mem_num = ?  and w.product_num= ?"
				+ "group by p.name, w.product_num, p.num, s.sizu, c.name, p.price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setInt(2, product_num);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			product = new WishDTO();
			product.setProductName(rs.getString("name"));
			product.setProductNum(rs.getInt("product_num"));
			product.setWishQuantity(rs.getInt("count"));
			product.setPrice(rs.getInt("price"));
			product.setSizu(rs.getString("sizu"));
			product.setColour(rs.getString("colour"));
		}
		return product;
	}
	@Override
	public int MoveCartDelWish(int mem_num, int product_num) throws Exception {
		int delWish = 0;
		String sql = "DELETE FROM WISH WHERE mem_num =? and product_num =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setInt(2, product_num);
		delWish = pstmt.executeUpdate();
		return delWish;
	}

}
