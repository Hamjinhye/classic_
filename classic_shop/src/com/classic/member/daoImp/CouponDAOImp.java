package com.classic.member.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.member.dao.CouponDAO;
import com.classic.member.dto.CouponDTO;

public class CouponDAOImp implements CouponDAO{
	private Connection conn;
	public CouponDAOImp(Connection conn) {
		this.conn = conn;
	}
	@Override
	public List<CouponDTO> couponSelect(int mem_num) throws Exception {
		List<CouponDTO> couponList = new ArrayList<CouponDTO>();
		String  sql = "select c.state from coupon c, coupon_log l, member m where c.mem_num=m.num and c.log_num=l.num and c.mem_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setNum(rs.getInt("num"));
			couponDTO.setMem_num(rs.getInt("mem_num"));
			couponDTO.setLog_num(rs.getInt("log_num"));
			couponDTO.setIndate(rs.getDate("indate"));
			couponDTO.setState(rs.getInt("state"));
			couponList.add(couponDTO);
		}
		return  couponList;
	}
	@Override
	public int couponInsert(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
