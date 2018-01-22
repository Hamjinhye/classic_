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
	public List<CouponLogDTO> couponLogSelect(int mem_num) throws Exception {
		List<CouponLogDTO> couponLog = new ArrayList<CouponLogDTO>();
		String sql = " select c.num, l.name, l.content, l.start_date, l.end_date, c.state "
				+ "from coupon c, coupon_log l, member m "
				+ "where c.mem_num=m.num and c.log_num=l.num and c.mem_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
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
