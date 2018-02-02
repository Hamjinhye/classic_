package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dao.ShopGuideDAO;
import com.classic.product.dto.ShopGuideDTO;
import com.classic.util.ClassicDBConnection;

public class ShopGuideDAOImp implements ShopGuideDAO{
	private Connection conn =null;
	public ShopGuideDAOImp(Connection conn) throws Exception {
		this.conn=conn;
	}

	@Override
	public ShopGuideDTO selectShopGuide(int state) throws Exception {
		
		ShopGuideDTO shopGuideDTO =null;
		String sql="select * from shop_guide where num=?"; //나중에 num을 state로 바꿔줘야 해 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, state);
		ResultSet rs =pstmt.executeQuery();
		while(rs.next()) {
			shopGuideDTO = new ShopGuideDTO();
			shopGuideDTO.setAs_info(rs.getString("as_info"));
			shopGuideDTO.setDeliv_info(rs.getString("deliv_info"));
			shopGuideDTO.setNum(rs.getInt("num"));
			shopGuideDTO.setRefund_info(rs.getString("refund_info"));
			shopGuideDTO.setState(rs.getInt("state"));
			shopGuideDTO.setSubject(rs.getInt("subject"));
			shopGuideDTO.setTrade_info(rs.getString("trade_info"));
			shopGuideDTO.setUnregi_info(rs.getString("unregi_info"));
		}
		return shopGuideDTO;
	}

	


}
