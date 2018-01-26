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
		int memNum =(req.getParameter("num")!=null)?Integer.parseInt(req.getParameter("num")):0;
		String strProductNum = (req.getParameter("productNum")!=null)? req.getParameter("productNum"): "0";
		String[] productNum =strProductNum.split("_");
		Connection conn = null;
		Cookie pNameCookie = null;
		Cookie priceCookie = null;
		Cookie quentityCookie = null;
		Cookie sizuCookie = null;
		Cookie colourCookie = null;
		int delWish = 0;
		Cookie[] cookies = req.getCookies();
		for(int i = 0;i<productNum.length; i++) {
			int pNum = Integer.parseInt(productNum[i]);
			if(memNum!=0 ||pNum != 0) {
				try {
					conn = ClassicDBConnection.getConnection();
					CartDao cart = new CartDaoImp(conn);
					WishDTO product = new WishDTO();
					product = cart.fromWishMoveCart(memNum,pNum);
					priceCookie = new Cookie("classic_"+pNum+"_price",product.getPrice()+"");
					priceCookie.setMaxAge(60*60*24*7);
					priceCookie.setPath(req.getContextPath());
					pNameCookie = new Cookie("classic_"+pNum+"_name",product.getProductName()+"");
					pNameCookie.setMaxAge(60*60*24*7);
					pNameCookie.setPath(req.getContextPath());
					quentityCookie = new Cookie("classic_"+pNum+"_count",product.getWishQuantity()+"");
					quentityCookie.setMaxAge(60*60*24*7);
					quentityCookie.setPath(req.getContextPath());
					sizuCookie = new Cookie("classic_"+pNum+"_sizu",product.getSizu()+"");
					sizuCookie.setMaxAge(60*60*24*7);
					sizuCookie.setPath(req.getContextPath());
					colourCookie =new Cookie("classic_"+pNum+"_colour",product.getColour()+"");
					colourCookie.setMaxAge(60*60*24*7);
					colourCookie.setPath(req.getContextPath());
					delWish += cart.MoveCartDelWish(memNum, pNum);
					/*for(int z = 0; i<cookies.length; i++) {
						if(cookies[z].getName().equals("classic_"+pNum+"_"+product.getWishQuantity())) {
							quentityCookie = new Cookie("classic_"+pNum+"_count",(product.getWishQuantity()+Integer.parseInt(cookies[z].getValue()))+"");
							quentityCookie.setMaxAge(60*60*24*7);
							quentityCookie.setPath(req.getContextPath());
						}
					}*/
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ClassicDBConnection.close(conn);
				}
				resp.addCookie(priceCookie);
				resp.addCookie(pNameCookie);
				resp.addCookie(quentityCookie);
				resp.addCookie(sizuCookie);
				resp.addCookie(colourCookie);
			}
		}
		req.setAttribute("delWish",delWish);
		req.getRequestDispatcher("/view/order/cart/list.jsp").forward(req, resp);
	}
}
