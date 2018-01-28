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

import com.classic.product.daoImp.SearchDAOImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/product/search/name.do")
public class SearchProductNameAJAX extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String productName = req.getParameter("name");
		Connection conn = null;
		List<String> productNameList = new ArrayList<String>();
		List<String> productNameListJSON = new ArrayList<String>();
		try {
			conn = ClassicDBConnection.getConnection();
			productNameList = new SearchDAOImp(conn).selectProductName(productName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(String name: productNameList) {
			productNameListJSON.add("\""+name+"\"");
		}
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append(productNameListJSON.toString());
	
	}
	

}
