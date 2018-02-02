package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dao.ProductDataDAO;
import com.classic.product.dto.ProductDTO;
import com.classic.product.dto.ProductDataDTO;
import com.classic.util.ClassicDBConnection;

public class ProductDataDAOImp implements ProductDataDAO{
	
	private Connection conn = null;
	
	public ProductDataDAOImp(Connection conn) throws Exception {
		this.conn=conn;
	}

	@Override
	public List<ProductDataDTO> selectProductDataList() throws Exception {
		List<ProductDataDTO> productDataList = new ArrayList<ProductDataDTO>();
		String sql="select * from product_data";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductDataDTO productDataDTO = new ProductDataDTO();
			productDataDTO.setAs_person(rs.getString("as_person"));
			productDataDTO.setAs_phone(rs.getString("as_phone"));
			productDataDTO.setColour(rs.getString("colour"));
			productDataDTO.setInfo(rs.getString("info"));
			productDataDTO.setMake_date(rs.getString("make_date"));
			productDataDTO.setMaker(rs.getString("maker"));
			productDataDTO.setMaterial(rs.getString("material"));
			productDataDTO.setNation(rs.getString("nation"));
			productDataDTO.setNum(rs.getInt("num"));
			productDataDTO.setQ_standard(rs.getString("q_standard"));
			productDataDTO.setSizu(rs.getString("sizu"));
			productDataDTO.setSupply(rs.getString("supply"));
			productDataDTO.setWash(rs.getString("wash"));
			productDataDTO.setWeight(rs.getString("weight"));
			productDataList.add(productDataDTO);
		}
		return productDataList;
	}

	@Override
	public ProductDataDTO selectProductData(int num) throws Exception {
		ProductDataDTO productDataDTO = null;
		String sql="select * from product_data where num=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			productDataDTO = new ProductDataDTO();
			productDataDTO.setAs_person(rs.getString("as_person"));
			productDataDTO.setAs_phone(rs.getString("as_phone"));
			productDataDTO.setColour(rs.getString("colour"));
			productDataDTO.setInfo(rs.getString("info"));
			productDataDTO.setMake_date(rs.getString("make_date"));
			productDataDTO.setMaker(rs.getString("maker"));
			productDataDTO.setMaterial(rs.getString("material"));
			productDataDTO.setNation(rs.getString("nation"));
			productDataDTO.setNum(rs.getInt("num"));
			productDataDTO.setQ_standard(rs.getString("q_standard"));
			productDataDTO.setSizu(rs.getString("sizu"));
			productDataDTO.setSupply(rs.getString("supply"));
			productDataDTO.setWash(rs.getString("wash"));
			productDataDTO.setWeight(rs.getString("weight"));
		}
		
		return productDataDTO;
	}
	

}
