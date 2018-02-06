package com.classic.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String strMemNum = req.getParameter("memNum");
		int productNum = Integer.parseInt(strProdcutNum);
		int memNum = Integer.parseInt(strMemNum);
		Connection conn = null;
		WishListDAO wish = null;
		String optionList = "";
		try {
			conn = ClassicDBConnection.getConnection();
			wish = new WishListDAOImp(conn);
			optionList +="{\"colour\":";
			optionList +=wish.selectProductColour(productNum).toString();
			optionList +=",\"sizu\":";
			optionList +=wish.selectProductSizu(productNum).toString();
			optionList +=",\"quantity\":";
			optionList +=wish.wishQuantity(memNum, productNum)+"}";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append(optionList.toString());
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
