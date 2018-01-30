package com.classic.banner.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.banner.dao.BannerDAO;
import com.classic.banner.dto.BannerDTO;

public class BannerDAOImp implements BannerDAO{
	private Connection conn;
	public BannerDAOImp(Connection conn) {
		this.conn = conn;
	}

	@Override
	public BannerDTO selectBanner() throws Exception {
		BannerDTO bannerDTO = null;
		String sql = "SELECT b.num, b.name, b.content, b.state"
				+ " FROM banner b, img_path i"
				+ " WHERE b.num=i.banner_num"
				+ " AND b.state=0";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bannerDTO = new BannerDTO();
			bannerDTO.setNum(rs.getInt("num"));
			bannerDTO.setName(rs.getString("name"));
			bannerDTO.setContent(rs.getString("content"));
			bannerDTO.setState(rs.getInt("state"));
		}
		return bannerDTO;
	}

}
