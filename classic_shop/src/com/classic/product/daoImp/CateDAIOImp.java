package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dao.CateDAO;
import com.classic.product.dto.CateDTO;
import com.classic.util.ClassicDBConnection;

public class CateDAIOImp implements CateDAO{
	private Connection conn = null;
	public CateDAIOImp(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public List<CateDTO> selectCateList() throws Exception{
		List<CateDTO> cateList = new ArrayList<CateDTO>();
		String sql ="select * from cate where state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CateDTO cateDTO = new CateDTO();
			cateDTO.setName(rs.getString("name"));
			cateDTO.setNum(rs.getInt("num"));
			cateDTO.setState(rs.getInt("state"));
			cateList.add(cateDTO);
			
		}
		return cateList;
	}

	@Override
	public CateDTO selectCate(int num) throws Exception {
		CateDTO cateDTO = null;
		String sql = "select * from cate where num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			cateDTO=new CateDTO();
			cateDTO.setName(rs.getString("name"));
			cateDTO.setNum(rs.getInt("num"));
			cateDTO.setState(rs.getInt("state"));
		}
		
		return cateDTO;
	}

	@Override
	public int selectCateNum(int mini_cate_num) throws Exception {
		int cate_num=0;
		String sql = "select cate_num from mini_cate where num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mini_cate_num);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			cate_num=rs.getInt("cate_num");
		}
		
		return cate_num;
	}
	

}
