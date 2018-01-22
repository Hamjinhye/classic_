package com.classic.order.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.order.dao.WishListDAO;
import com.classic.order.dto.ColourDTO;
import com.classic.order.dto.WishDTO;
import com.classic.util.ClassicDBConnection;

public class WishListDAOImp implements WishListDAO{
	/*test�슜
	 * public static void main(String[] args) {
		try {
			Connection conn = ClassicDBConnection.getConnection();
			List<WishDTO> wish = new ArrayList<WishDTO>();
			WishListDAO wishDao = new WishListDAOImp();
			wish = wishDao.selectWish(conn,22);
			System.out.println(wish);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	private Connection conn;
	public WishListDAOImp(Connection conn) {
		this.conn = conn;
	}
	@Override
	public List<WishDTO> selectWish(int memNum) throws Exception {
		List<WishDTO> wishList =new ArrayList<WishDTO>();
		String sql ="select p.price , p.name , w.product_num ,count(w.product_num) as count, s.sizu, c.name as colour " 
				+ "from product p, wish w ,sizu s , colour c " 
				+ "where p.num = w.product_num " 
				+ "and w.sizu_num = s.num " 
				+ "and w.colour_num = c.num "
				+ "and w.mem_num = ? "
				+ "group by p.name, w.product_num, p.num, s.sizu, c.name, p.price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			WishDTO wish = new WishDTO();
			wish.setProductName(rs.getString("name"));
			wish.setProductNum(rs.getInt("product_num"));
			wish.setWishQuantity(rs.getInt("count"));
			wish.setPrice(rs.getInt("price"));
			wish.setSizu(rs.getString("sizu"));
			wish.setColour(rs.getString("colour"));
			wishList.add(wish);
		}
		//System.out.println(wishList);
		return wishList;
	}

	@Override
	public int WishDel(int memNum) throws Exception {
	//전체삭제
		int delete = 0;
		String sql = "delete from wish where mem_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		delete = pstmt.executeUpdate();
		return delete;
	}
	
	@Override
	public int WishDel(int memNum,int productNum) throws Exception {
	//선택된 wishList만 삭제
		int delete = 0;
		String sql="delete from wish where mem_num = ? and product_num = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		pstmt.setInt(2, productNum);
		delete = pstmt.executeUpdate();
		return delete;
	}
	@Override
	public int recodeTotal(int memNum) throws Exception {
		int recode = 0;
		String sql = "select count(*) as a from (select w.product_num ,count(w.product_num) as count, s.sizu, c.name as color " 
					+"from product p, wish w ,sizu s , colour c " 
					+"where p.num = w.product_num " 
					+"and w.sizu_num = s.num " 
					+"and w.colour_num = c.num " 
					+"and w.mem_num = ? " 
					+"group by w.product_num, p.num, s.sizu, c.name) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		ResultSet rs =pstmt.executeQuery();
		if(rs.next()) {
			recode = rs.getInt("a");
		}
		return recode;
	}
	/* recode total count용 test
	 * public static void main(String[] args) {
		Connection conn = null;
		int recode = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			WishListDAO wish = new WishListDAOImp(conn);
			recode = wish.recodeTotal(4);
			System.out.println(recode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	@Override
	public ColourDTO selectProductColour(int productNum) throws Exception {
		ColourDTO colour = null;
		String sql="select num, product_num , code, name from colour where product_num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productNum);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			colour = new ColourDTO();
			colour.setNum(rs.getInt("num"));
			colour.setProductNum(rs.getInt("product_num"));
			colour.setCode(rs.getString("code"));
			colour.setName(rs.getString("name"));
		}
		return colour;
	}
	
}
