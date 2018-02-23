package com.classic.order.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.order.dao.WishListDAO;
import com.classic.order.dto.ColourDTO;
import com.classic.order.dto.WishDTO;
import com.classic.product.dto.SizuDTO;
import com.classic.util.ClassicDBConnection;

public class WishListDAOImp implements WishListDAO{
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

	@Override
	public WishDTO selectWish(int memNum, int productNum) throws Exception {
		WishDTO wish =null;
		String sql ="select p.price , p.name , w.product_num ,count(w.product_num) as count, s.sizu, c.name as colour " 
				+ "from product p, wish w ,sizu s , colour c " 
				+ "where p.num = w.product_num " 
				+ "and w.sizu_num = s.num " 
				+ "and w.colour_num = c.num "
				+ "and w.mem_num = ? and w.product_num=? "
				+ "group by p.name, w.product_num, p.num, s.sizu, c.name, p.price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		pstmt.setInt(2,	productNum);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			wish = new WishDTO();
			wish.setProductName(rs.getString("name"));
			wish.setProductNum(rs.getInt("product_num"));
			wish.setWishQuantity(rs.getInt("count"));
			wish.setPrice(rs.getInt("price"));
			wish.setSizu(rs.getString("sizu"));
			wish.setColour(rs.getString("colour"));
		}
		return wish;
	}
	@Override
	public List<ColourDTO> selectProductColour(int productNum) throws Exception {
		ColourDTO colour = null;
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		String sql="select num, product_num , code, name from colour where product_num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			colour = new ColourDTO();
			colour.setNum(rs.getInt("num"));
			colour.setProductNum(rs.getInt("product_num"));
			colour.setCode(rs.getString("code"));
			colour.setName(rs.getString("name"));
			colourList.add(colour);
		}
		return colourList;
	}
	@Override
	public List<SizuDTO> selectProductSizu(int productNum) throws Exception {
		List<SizuDTO> sizuList = new ArrayList<SizuDTO>();
		SizuDTO sizu = null;
		String sql="select num, product_num , sizu from sizu where product_num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			sizu = new SizuDTO();
			sizu.setNum(rs.getInt("num"));
			sizu.setProduct_num(rs.getInt("product_num"));
			sizu.setSizu(rs.getString("sizu"));
			sizuList.add(sizu);
		}
		return sizuList;
	}
	@Override
	public int wishQuantity(int memNum, int productNum) throws Exception {
		int quantity = 0;
		String sql = "select count(*) as quantity from wish where mem_num = ? and product_num = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		pstmt.setInt(2, productNum);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			quantity = rs.getInt("quantity");
		}
		return quantity;
	}
	@Override
	public int wishOptionUpdate(WishDTO wish) throws Exception {
		int update = 0;
		String sql = "UPDATE WISH SET sizu_num =?, colour_num=? WHERER mem_num= ? and product_num= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, wish.getSizuNum());
		pstmt.setInt(2, wish.getColourNum());
		pstmt.setInt(3, wish.getMemNum());
		pstmt.setInt(4, wish.getProductNum());
		update =pstmt.executeUpdate();
		return update;
	}
	@Override
	public int wishDelete (int memNum,int productNum) throws Exception {
		int delWish = 0;
		String sql = "DELETE FROM WISH WHERE num = (SELECT MIN(num) FROM WISH WHERE mem_num=? AND product_num=?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		pstmt.setInt(2, productNum);
		delWish = pstmt.executeUpdate();
		return delWish;
	}
	@Override
	public int wishInsert(WishDTO wish) throws Exception {
		/*NUM                                       NOT NULL NUMBER(8)
		PRODUCT_NUM                                        NUMBER(8)
		MEM_NUM                                            NUMBER(8)
		INDATE                                             DATE
		SIZU_NUM                                  NOT NULL NUMBER(8)
		COLOUR_NUM                                NOT NULL NUMBER(8)*/
		int insert = 0;
		String sql = "INSERT INTO WISH (num, product_num, mem_num, indate, sizu_num , colour_num) "
					+ "value (wish_seq.nextval ,? , ?, sysdate, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, wish.getProductNum());
		pstmt.setInt(2, wish.getMemNum());
		pstmt.setInt(3, wish.getSizuNum());
		pstmt.setInt(4, wish.getColourNum());
		insert = pstmt.executeUpdate();
		return insert;
	}
}
