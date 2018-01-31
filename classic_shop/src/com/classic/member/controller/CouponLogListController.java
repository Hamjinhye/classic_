package com.classic.member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dao.CouponLogDAO;
import com.classic.member.daoImp.CouponLogDAOImp;
import com.classic.member.dto.CouponLogDTO;
import com.classic.util.ClassicDBConnection;
@WebServlet("/user/coupon.do")
public class CouponLogListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memNum = req.getParameter("num");
		Connection conn = null;
		List<CouponLogDTO> couponList = new ArrayList<CouponLogDTO>();
		try {
			conn= ClassicDBConnection.getConnection();
			CouponLogDAO couponDAO = new CouponLogDAOImp(conn);
			couponList = couponDAO.couponLogSelect(Integer.parseInt(memNum));
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		req.setAttribute("couponList", couponList);
		req.getRequestDispatcher("/view/member/mypage/coupon.jsp").forward(req, resp);
	}
}
