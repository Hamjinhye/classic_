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
import com.classic.order.dto.WishDTO;
import com.classic.product.dto.SizuDTO;
import com.classic.util.ClassicDBConnection;
import com.sun.beans.editors.IntegerEditor;

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
			optionList +=wish.wishQuantity(memNum, productNum);
			optionList += ",\"memNum\":"+memNum+"}";
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
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum = req.getParameter("memNum");
		String strProductNum = req.getParameter("productNum");
		String strColourNum = req.getParameter("colourNum");
		String strSizuNum = req.getParameter("sizuNum");
		int AfterQuantity =Integer.parseInt(req.getParameter("afterQuantity"));
		int BeforeQuantity = Integer.parseInt(req.getParameter("beforeQuantity"));
		Connection conn = null;
		int quantity = AfterQuantity-BeforeQuantity;
		int update = 0;
		int insert = 0;
		int allQuantity = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			WishListDAO wish = new WishListDAOImp(conn);
			WishDTO wishDTO = new WishDTO();
			wishDTO.setSizuNum(Integer.parseInt(strSizuNum));
			wishDTO.setProductNum(Integer.parseInt(strProductNum));
			wishDTO.setColourNum(Integer.parseInt(strColourNum));
			wishDTO.setMemNum(Integer.parseInt(strMemNum));
			conn.commit();
			conn.setAutoCommit(false);
			if(quantity>0) {
				//수 증가
				System.out.println(quantity);
				/*for(int i = 0 ; i<BeforeQuantity; i++) {
					update += wish.wishOptionUpdate(wishDTO);
				}
				for(int i=0; i<quantity; i++) {
					insert += wish.wishInsert(wishDTO);
				}
				allQuantity = update+insert;
				if(allQuantity==AfterQuantity) {
					conn.commit();
				} else {
					conn.rollback();
					allQuantity = 0;
				}
				conn.setAutoCommit(true);*/
			}else {
				//수감소 
				quantity = -quantity;
				System.out.println(quantity);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
