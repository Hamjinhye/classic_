package com.classic.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.common.controller.Paging;
import com.classic.common.dto.PagingDTO;
import com.classic.product.daoImp.ReviewDAOImp;
import com.classic.product.dto.ReviewDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/product/review.do")
public class ReviewList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_num = req.getParameter("num");
		String str_page = req.getParameter("page");
		PagingDTO pagingDTO =new PagingDTO();
		Connection conn=null;
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		try {
			int product_num=Integer.parseInt(str_num);
			conn = ClassicDBConnection.getConnection();
			int totalRecord = new ReviewDAOImp(conn).selectReviewCount(product_num);
			pagingDTO.setPageNum_temp(str_page);
			pagingDTO.setTotalRecord(totalRecord);
			pagingDTO.setRowNum(5);
			pagingDTO=Paging.setPaging(pagingDTO);
			reviewList=new ReviewDAOImp(conn).selectReviewList(product_num, pagingDTO);
			
			
			
		} catch (Exception e) {e.printStackTrace();}
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append("{");
		resp.getWriter().append("\"reviewList\":"+reviewList.toString());
		resp.getWriter().append(", \"p\":"+pagingDTO.toString());
		resp.getWriter().append("}");
		
	}
}
