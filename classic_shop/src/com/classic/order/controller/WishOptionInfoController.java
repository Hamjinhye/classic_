package com.classic.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dao.WishListDAO;
import com.classic.order.daoImp.WishListDAOImp;
import com.classic.order.dto.ColourDTO;
import com.classic.product.dto.SizuDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/wish/option.do")
public class WishOptionInfoController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strProdcutNum = req.getParameter("productNum");
		Connection conn = null;
		WishListDAO wish = null;
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			wish = new WishListDAOImp(conn);
			colourList = wish.selectProductColour(Integer.parseInt(strProdcutNum));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append(colourList.toString());
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strProdcutNum = req.getParameter("productNum");
		Connection conn = null;
		WishListDAO wish = null;
		List<SizuDTO> sizuList = new ArrayList<SizuDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			wish = new WishListDAOImp(conn);
			sizuList = wish.selectProductSizu(Integer.parseInt(strProdcutNum));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append(sizuList.toString());
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*colour:28
		sizu:34
		afterAuantity:1
		productNum:9
		beforeQuantity:1*/
	}
}
