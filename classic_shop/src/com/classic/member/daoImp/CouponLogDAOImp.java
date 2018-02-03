package com.classic.member.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.member.dao.CouponLogDAO;
import com.classic.member.dto.CouponLogDTO;
import com.classic.util.ClassicDBConnection;

public class CouponLogDAOImp implements CouponLogDAO{
	private Connection conn;
	public CouponLogDAOImp(Connection conn) {
		this.conn = conn;
	}

	@Override
	public List<CouponLogDTO> couponLogSelect(int mem_num) throws Exception {
		List<CouponLogDTO> couponLogList = new ArrayList<CouponLogDTO>();
		String sql = "select l.name, l.content, l.start_date as start_date, l.end_date as end_date, c.num as c_num, c.state as c_state"
				+ " from coupon c, coupon_log l, member m"
				+ " where c.mem_num=m.num and c.log_num=l.num and c.mem_num=? order by c.num desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CouponLogDTO couponlogDTO = new CouponLogDTO();
			couponlogDTO.setName(rs.getString("name"));
			couponlogDTO.setContent(rs.getString("content"));
			couponlogDTO.setStart_date(rs.getDate("start_date"));
			couponlogDTO.setEnd_date(rs.getDate("end_date"));
			couponlogDTO.setC_num(rs.getInt("c_num"));
			couponlogDTO.setC_state(rs.getInt("c_state"));			
			couponLogList.add(couponlogDTO);
		}		
		return couponLogList;
	}
	public static void main(String[] args) {
		Connection conn = null;
		List<CouponLogDTO> couponLogList = new ArrayList<CouponLogDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			CouponLogDAO couponDAO = new CouponLogDAOImp(conn);
			couponLogList=couponDAO.couponLogSelect(1);
			System.out.println(couponLogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
