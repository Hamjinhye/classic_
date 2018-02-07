package com.classic.member.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dao.CouponDAO;
import com.classic.member.daoImp.CouponDAOImp;
import com.classic.member.dto.CouponDTO;
import com.classic.util.ClassicDBConnection;
@WebServlet("/user/coupon/register.do")
public class CouponRegisterJSON extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum=req.getParameter("mem_num");
		String strLogNum=req.getParameter("log_num");
		Connection conn=null;
		int register=0;
		CouponDTO couponDTO=new CouponDTO();
		try {
			conn=ClassicDBConnection.getConnection();
			CouponDAO couponDAO = new CouponDAOImp(conn);
			couponDTO=new CouponDTO();
			couponDTO.setMem_num(Integer.parseInt(strMemNum));
			couponDTO.setLog_num(Integer.parseInt(strLogNum));
			
			register = couponDAO.couponInsert(couponDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"register\":\""+register+"\"}");		
	}
}
