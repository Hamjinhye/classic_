package com.classic.order.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dao.CartDao;
import com.classic.order.daoImp.CartDaoImp;
import com.classic.order.dto.WishDTO;
import com.classic.util.ClassicDBConnection;
///view/cart.do 원래 매핑주소
@WebServlet("/user/cart.do")
public class CartListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		int memNum = Integer.parseInt(req.getParameter("num"));
		int productNum = Integer.parseInt(req.getParameter("productNum"));
		Connection conn = null;
		Cookie pNameCookie = null;
		Cookie priceCookie = null;
		Cookie quentityCookie = null;
		
		try {
			conn = ClassicDBConnection.getConnection();
			CartDao cart = new CartDaoImp(conn);
			WishDTO product = new WishDTO();
			product = cart.fromWishMoveCart(memNum,productNum);
			priceCookie = new Cookie("classic_"+productNum+"_price",product.getPrice()+"");
			priceCookie.setMaxAge(60*60*24*7);
			pNameCookie = new Cookie("classic_"+productNum+"_name",product.getProductName()+"");
			pNameCookie.setMaxAge(60*60*24*7);
			quentityCookie = new Cookie("classic_"+productNum+"_count",product.getWishQuantity()+"");
			quentityCookie.setMaxAge(60*60*24*7);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		resp.addCookie(priceCookie);
		resp.addCookie(pNameCookie);
		resp.addCookie(quentityCookie);
		resp.sendRedirect("order/cart/list.jsp");
	}
}
