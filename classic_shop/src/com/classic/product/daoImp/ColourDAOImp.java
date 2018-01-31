package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dao.ColourDAO;
import com.classic.product.dto.ColourDTO;
import com.classic.util.ClassicDBConnection;

public class ColourDAOImp implements ColourDAO {

	
	private Connection conn = null;
	public ColourDAOImp(Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public List<ColourDTO> selectColourList(int product_num) throws Exception {
		ColourDTO colour = null;
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		String sql = "select * from colour where product_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, product_num);
		ResultSet rs= pstmt.executeQuery();
		
		while(rs.next()) {
			colour= new ColourDTO();
			colour.setCode(rs.getString("code"));
			colour.setName(rs.getString("name"));
			colour.setNum(rs.getInt("num"));
			colour.setProduct_num(rs.getInt("product_num"));
			colourList.add(colour);
		}
		
		return colourList;
	}
	@Override
	public List<ColourDTO> selectCateListColours(PagingDTO pagingDTO, int cate, int num) throws Exception {
		List<ColourDTO> coloursList = new ArrayList<ColourDTO>();
		String sql="";
		if(cate==0) {
			sql="select * from colour "
					+ "where product_num in(select num from product "
					+ "where cate_num in (select m.num from mini_cate m, cate c where m.cate_num=c.num and c.num=? and m.state=1)) "
					+ "order by product_num";
		}else if(cate==1) {
			sql="select * from colour where product_num in (select num from product where cate_num=?)";
		}
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ColourDTO colourDTO = new ColourDTO();
			colourDTO.setCode(rs.getString("code"));
			colourDTO.setName(rs.getString("name"));
			colourDTO.setNum(rs.getInt("num"));
			colourDTO.setProduct_num(rs.getInt("product_num"));
			coloursList.add(colourDTO);
		}		
		return coloursList;
	}


	@Override
	public List<ColourDTO> selectMiniCateListColours(int cate_num) throws Exception {
		List<ColourDTO> coloursList = new ArrayList<ColourDTO>();
		String sql="select * from colour where product_num in (select num from product where cate_num=?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cate_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ColourDTO colourDTO = new ColourDTO();
			colourDTO.setCode(rs.getString("code"));
			colourDTO.setName(rs.getString("name"));
			colourDTO.setNum(rs.getInt("num"));
			colourDTO.setProduct_num(rs.getInt("product_num"));
			coloursList.add(colourDTO);
		}		
		return coloursList;
	}
}
