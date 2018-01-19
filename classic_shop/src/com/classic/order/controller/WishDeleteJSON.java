package com.classic.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dao.WishListDAO;
import com.classic.order.daoImp.WishListDAOImp;
import com.classic.util.ClassicDBConnection;

///order/delwish.do 원래 매핑주소
@WebServlet("/user/wish/remove.do")
public class WishDeleteJSON extends HttpServlet{
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum = req.getParameter("num");
		Connection conn = null;
		WishListDAO wish = null;
		int delete = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			wish  = new WishListDAOImp(conn);
			delete = wish.WishDel(Integer.parseInt(strMemNum));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		System.out.println(delete);
		resp.getWriter().append("{\"delete\":"+delete+"}");
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum = req.getParameter("num");
		String strProductNum = req.getParameter("product_num");
		Connection conn = null;
		WishListDAO wish = null;
		int delete = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			wish = new WishListDAOImp(conn);
			delete = wish.WishDel(Integer.parseInt(strMemNum),Integer.parseInt(strProductNum));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().append("{\"delete\":"+delete+"}");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum = req.getParameter("num");
		String strProductNum = req.getParameter("product_num");
		String [] productNum = strProductNum.split("_"); 
		Connection conn = null;
		WishListDAO wish = null;
		int delete = 0;
		try {
			System.out.println("앗");
			conn = ClassicDBConnection.getConnection();
			wish = new WishListDAOImp(conn);
			for(int i =0; i<productNum.length; i++) {
				delete+=wish.WishDel(Integer.parseInt(strMemNum), Integer.parseInt(productNum[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().append("{\"delete\":"+delete+"}");
	}
}
