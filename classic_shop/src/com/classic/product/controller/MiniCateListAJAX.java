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

import com.classic.product.dao.MiniCateDAO;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.dto.MiniCateDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/template/mini_cate.do") // "/product/cate.do"
public class MiniCateListAJAX extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String str_cate=req.getParameter("cate");
		List<MiniCateDTO> minCateList = new ArrayList<MiniCateDTO>();
		
		Connection conn = null;
		
		try {
			conn=ClassicDBConnection.getConnection();
			MiniCateDAO miniCateDAO = new MiniCateDAOImp(conn);
			minCateList=miniCateDAO.selectMiniCateList(Integer.parseInt(str_cate));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append(minCateList.toString());
		
	}
}
