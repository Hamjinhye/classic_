package com.classic.member.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.member.dao.CouponLogDAO;
import com.classic.member.dto.CouponLogDTO;

public class CouponLogDAOImp implements CouponLogDAO{
	private Connection conn;
	public CouponLogDAOImp(Connection conn) {
		this.conn = conn;
	}

	@Override
	public List<CouponLogDTO> couponLogSelect() throws Exception {
		List<CouponLogDTO> couponLog = new ArrayList<CouponLogDTO>();
		String sql = "select * from coupon_log";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CouponLogDTO couponDTO = new CouponLogDTO();
			couponDTO.setNum(rs.getInt("num"));
			couponDTO.setGrade(rs.getInt("grade"));
			couponDTO.setState(rs.getInt("state"));
			couponDTO.setIssue(rs.getInt("issue"));
			couponDTO.setSale(rs.getInt("num"));
			couponDTO.setCount(rs.getInt("count"));
			couponDTO.setTotal(rs.getInt("total"));
			couponDTO.setName(rs.getString("name"));
			couponDTO.setContent(rs.getString("content"));
			couponDTO.setStart_date(rs.getDate("start_date"));
			couponDTO.setEnd_date(rs.getDate("end_date"));
			couponLog.add(couponDTO);
		}		
		return couponLog;
	}

}
