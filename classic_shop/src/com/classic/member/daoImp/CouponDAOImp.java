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
	public List<CouponDTO> couponSelect() throws Exception {
		List<CouponDTO> couponList = new ArrayList<CouponDTO>();
		String sql = "select (l.total-(l.count+count(c.num))) allcount, count(c.num) as num, l.name, c.log_num"
				+ " from coupon c, coupon_log l where c.log_num=l.num"
				+ " group by c.log_num,l.name, l.total, l.count order by c.log_num";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setNum(rs.getInt("num"));
			couponDTO.setAllcount(rs.getInt("allcount"));
			couponDTO.setName(rs.getString("name"));
			couponDTO.setLog_num(rs.getInt("log_num"));
			couponList.add(couponDTO);
		}
		return couponList;
	}

	@Override
	public int couponInsert(CouponDTO couponDTO) throws Exception {
		int insert = 0;
		String sql = "INSERT INTO coupon(num,mem_num,log_num,state,indate) VALUES(coupon_seq.nextval,?,?,0,sysdate)";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, couponDTO.getMem_num());
		pstmt.setInt(2, couponDTO.getLog_num());
		insert = pstmt.executeUpdate();
		return insert;
	}
	
	@Override
	public int couponUpdate(CouponDTO couponDTO) throws Exception {
		int update = 0;
		String sql = "UPDATE SET count ";
		return update;
	}
}