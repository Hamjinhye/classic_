package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dao.SizuDAO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.SizuDTO;
import com.classic.util.ClassicDBConnection;

public class SizuDAOImp implements SizuDAO {
	private Connection conn=null;
	public SizuDAOImp(Connection conn) throws Exception {
		this.conn=conn;
	}
	@Override
	public List<SizuDTO> selectSizuList(int product_num) throws Exception {
		
		SizuDTO sizu = null;
		List<SizuDTO> sizuList = new ArrayList<SizuDTO>();
		String sql = "select * from sizu where product_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, product_num);
		ResultSet rs= pstmt.executeQuery();
		
		while(rs.next()) {
			sizu= new SizuDTO();
			sizu.setNum(rs.getInt("num"));
			sizu.setProduct_num(rs.getInt("product_num"));
			sizu.setSizu(rs.getString("sizu"));
			sizuList.add(sizu);
		}
		
		return sizuList;
	}

	
}
