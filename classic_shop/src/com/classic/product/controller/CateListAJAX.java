package com.classic.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.product.dao.CateDAO;
import com.classic.product.dao.MiniCateDAO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/template/cate.do") 
public class CateListAJAX extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		List<CateDTO> cateList = new ArrayList<CateDTO>();
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
	
		Connection conn =null;
		try {
			conn=ClassicDBConnection.getConnection();
			CateDAO cateDAO = new CateDAIOImp(conn);
			cateList = cateDAO.selectCateList();
			MiniCateDAO miniCateDAO = new MiniCateDAOImp(conn);
			miniCateList = miniCateDAO.selectMiniCateListAll();
		} catch (Exception e) {
			ClassicDBConnection.close(conn);
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{");
		resp.getWriter().append("\"cate\":"+cateList.toString());
		resp.getWriter().append(", \"miniCate\":"+miniCateList.toString());
		resp.getWriter().append("}");
	}
}
