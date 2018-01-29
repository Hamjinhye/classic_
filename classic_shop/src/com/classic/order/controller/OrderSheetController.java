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
import javax.xml.ws.WebFault;

import com.classic.member.dto.CouponDTO;
import com.classic.order.dao.OrderDAO;
import com.classic.order.dao.WishListDAO;
import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.daoImp.WishListDAOImp;
import com.classic.order.dto.WishDTO;
import com.classic.util.ClassicDBConnection;
import com.sun.xml.internal.ws.api.ha.HaInfo;

@WebServlet("/user/ordersheet.do")
public class OrderSheetController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String str_num=req.getParameter("num");
		//req.getRequestDispatcher("/view/order/sheet.jsp").forward(req, resp);
		//from주연
		int num = Integer.parseInt(req.getParameter("num"));
		String[] strProductNum = (req.getParameter("productNum")).split("_");
		String[] colour =(req.getParameter("colour")!=null)?req.getParameter("colour").split("_"):null;
		String[] sizu =(req.getParameter("sizu")!=null)?req.getParameter("sizu").split("_"):null;
		String[] quantity =(req.getParameter("quantity")!=null)?req.getParameter("quantity").split("_"):null;
		String[] productName = (req.getParameter("productName")!=null)?req.getParameter("productName").split("_"):null;
		String isCookie = (req.getParameter("cookie")!=null)?req.getParameter("cookie"):"0";//productDetail에서 do접근시
		int coupon = 0;
		Connection conn = null;
		List<CouponDTO> couponList = new ArrayList<CouponDTO>();
		List<WishDTO> productList  = new ArrayList<WishDTO>();
		WishDTO wish = null;
		try {
			conn = ClassicDBConnection.getConnection();
			WishListDAO productInfo = new WishListDAOImp(conn);
			OrderDAO orderDao = new OrderDaoImp(conn);
			for(int i=0; i<strProductNum.length; i++) {
				if(isCookie.equals("f")) {
					//wish에서 do 접근시
					wish = productInfo.selectWish(num, Integer.parseInt(strProductNum[i]));
					productList.add(wish);
				}else if(isCookie.equals("t")) {
					//cart(cookie)에서 do 접근 시 
					wish = new WishDTO();
					
					productList.add(wish);
				}else {
					//productDetail에서 do 접근시 
				}
			}
			coupon = orderDao.couponCount(num);
			couponList = orderDao.selectCoupon(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("couponList", couponList);
		req.setAttribute("coupon", coupon);
		req.setAttribute("productList", productList);
		req.getRequestDispatcher("/view/order/sheet.jsp").forward(req, resp);
	}
}