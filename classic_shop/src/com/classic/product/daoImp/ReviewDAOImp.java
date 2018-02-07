package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.product.dto.ReviewDTO;
import com.classic.common.dto.PagingDTO;
import com.classic.product.dao.ReviewDAO;

public class ReviewDAOImp implements ReviewDAO{
	private Connection conn=null;
	public ReviewDAOImp(Connection conn) {
		this.conn=conn;
	}

	@Override
	public List<ReviewDTO> selectReviewList(int product_num, PagingDTO pagingDTO) throws Exception {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		
		String sql= "SELECT * FROM "
						+"(SELECT ROWNUM row_num, review.* FROM "
							+"(select r.content, to_char(r.indate, 'YYYY-MM-DD') indate, r.body_size, p.name product_name, "
							+"s.sizu product_size, c.name colour_name, m.id, r.star, "
							+"(select name from img_path where review_num=r.num) img_path from " 
							+"review r, product p, sizu s, colour c, paid o, member m " 
							+"where r.paid_num=o.num and o.product_num = p.num and o.sizu_num=s.num " 
							+"and o.colour_num = c.num and r.paid_num=o.num and m.num=r.mem_num and o.product_num=?) review "
						+"WHERE ROWNUM <=?) "
					+"WHERE row_num >=?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, pagingDTO.getEndRecord());
			pstmt.setInt(3, pagingDTO.getStartRecord());
			System.out.println(pagingDTO.getEndRecord()+","+pagingDTO.getStartRecord());
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setBody_size(rs.getString("body_size"));
			reviewDTO.setContent(rs.getString("content"));
			reviewDTO.setIndate(rs.getString("indate"));
			reviewDTO.setId(rs.getString("id"));
			reviewDTO.setStar(rs.getInt("star"));
			reviewDTO.setColour_name(rs.getString("colour_name"));
			reviewDTO.setProduct_name(rs.getString("product_name"));
			reviewDTO.setProduct_size(rs.getString("product_size"));
			
			
			reviewList.add(reviewDTO);
		}
		return reviewList;
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

	@Override
	public int selectReviewCount(int product_num) throws Exception {
		int count=0;
		String sql = "select count(*) as count from review r, paid p where p.num=r.paid_num and p.product_num=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, product_num);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			count=rs.getInt("count");
		}
		return count;
	}

}
