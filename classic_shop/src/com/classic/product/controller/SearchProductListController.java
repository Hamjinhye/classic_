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

import com.classic.product.dao.CateDAO;
import com.classic.product.dao.MiniCateDAO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.serviceImp.ProductServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/product/search.do")
public class SearchProductListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		List<CateDTO> cateList = new ArrayList<CateDTO>();
		List<MiniCateDTO> miniCateList = new ProductServiceImp().forSearchCateRead();
		Connection conn =null;
		try {
			conn=ClassicDBConnection.getConnection();
			CateDAO cateDAO = new CateDAIOImp(conn);
			cateList = cateDAO.selectCateList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		req.setAttribute("cateList", cateList);
		req.setAttribute("miniCateList", miniCateList);
		req.getRequestDispatcher("/view/product/search/searchForm.jsp").forward(req, resp);
	}

}
