package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dto.ReviewDTO;
import com.classic.util.ClassicDBConnection;
import com.classic.product.dao.ReviewDAO;

public class ReviewDAOImp implements ReviewDAO{
	private Connection conn=null;
	public ReviewDAOImp(Connection conn) {
		this.conn=conn;
	}

	@Override
	public List<ReviewDTO> selectReviewList(int product_num) throws Exception {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		String sql = "select r.*, m.id from review r, member m where r.mem_num=m.num and "
					+ "paid_num in (select product_num from paid where product_num=?)";
		
		/*
		select r.content, to_char(r.indate, 'YYYY-MM-DD') indate, p.name, s.sizu, c.name from 
		review r, product p, sizu s, colour c, paid o 
		where r.paid_num=o.num and o.product_num = p.num and o.sizu_num=s.num 
		and o.colour_num = c.num and r.paid_num=o.num and o.product_num=1
		 */
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_num);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setBody_size(rs.getString("body_size"));
			reviewDTO.setContent(rs.getString("content"));
			reviewDTO.setIndate(rs.getString("indate"));
			reviewDTO.setId(rs.getString("id"));
			reviewDTO.setMem_num(rs.getInt("mem_num"));
			reviewDTO.setNum(rs.getInt("num"));
			reviewDTO.setPaid_num(rs.getInt("paid_num"));
			reviewDTO.setStar(rs.getInt("star"));
			reviewList.add(reviewDTO);
		}
		return reviewList;
	}
	public static void main(String[] args) {
		Connection conn = null;
		
		try {
			conn=ClassicDBConnection.getConnection();
			System.out.println(new ReviewDAOImp(conn).selectReviewList(1));
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}

	@Override
	public List<ReviewDTO> selectReviewListAll() throws Exception {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		return reviewList;
	}

	@Override
	public Boolean checkPaid() throws Exception {
		Boolean check = false;
		
		return check;
	}

}
