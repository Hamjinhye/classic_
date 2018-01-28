package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dao.SearchDAO;
import com.classic.product.dto.ProductDTO;

public class SearchDAOImp implements SearchDAO{

	private Connection conn=null;
	public SearchDAOImp(Connection conn) {
		this.conn = conn;
	}
	//최신순, 인기순, 리뷰순, 높은가격, 낮은가격
	//최신순 : indate DESC
	//인기순 : 주문에서 끌어와야하나?
	//리뷰순 : 리뷰에서 끌어와야하나?
	//높은 : price DESC
	//낮은 : price 
	@Override
	public List<String> selectProductName(String name) throws Exception {
		List<String> productNameList = new ArrayList<String>();
		String sql = "SELECT DISTINCT name FROM product WHERE name like ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+name+"%");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			productNameList.add(rs.getString("name"));
		}
		return productNameList;
	}
	
}
