package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dao.SearchDAO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.ProductDTO;

public class SearchDAOImp implements SearchDAO{

	private Connection conn=null;
	public SearchDAOImp(Connection conn) {
		this.conn = conn;
	}

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
	
	@Override
	public List<ProductDTO> searchProduct(String name, String cate_num, int priceHigh, int priceLow, PagingDTO pagingDTO)
			throws Exception {
		List<ProductDTO> searchList = new ArrayList<ProductDTO>();
		String sql = "SELECT * FROM"
				+ " (SELECT ROWNUM row_num, product.* FROM"
				+ " (SELECT * FROM product"
				+ " WHERE cate_num like ? AND name like ? AND price <= ? AND price >= ?"
				+ " ORDER BY indate DESC) product"
				+ " WHERE ROWNUM <= ?)"
				+ " WHERE row_num >= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+cate_num+"%");
		pstmt.setString(2, "%"+name+"%");
		pstmt.setInt(3, priceLow);
		pstmt.setInt(4, priceHigh);
		pstmt.setInt(5, pagingDTO.getEndRecord());
		pstmt.setInt(6, pagingDTO.getStartRecord());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setRow_num(rs.getInt("row_num"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setName(rs.getString("name"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setOut_time(rs.getDate("out_time"));
			searchList.add(productDTO);
		}
		
		return searchList;
	}
	@Override
	public int searchCount(String name, String cate_num, int priceHigh, int priceLow) throws Exception {
		int searchCount = 0;
		String sql = "SELECT COUNT(*) as total FROM product"
				+ " WHERE cate_num like ?"
				+ " AND name like ?"
				+ " AND price <= ?"
				+ " AND price >= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+cate_num+"%");
		pstmt.setString(2, "%"+name+"%");
		pstmt.setInt(3, priceLow);
		pstmt.setInt(4, priceHigh);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			searchCount = rs.getInt("total");
		}
		return searchCount;
	}

	@Override
	public List<ColourDTO> selectColor() throws Exception {
		List<ColourDTO> colorList = new ArrayList<ColourDTO>();
		String sql = "SELECT * FROM colour c, product p WHERE p.num=c.product_num";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ColourDTO colorDTO = new ColourDTO();
			colorDTO.setNum(rs.getInt("num"));
			colorDTO.setProduct_num(rs.getInt("product_num"));
			colorDTO.setCode(rs.getString("code"));
			colorDTO.setName(rs.getString("name"));
			colorList.add(colorDTO);
		}
		return colorList;
	}
}
