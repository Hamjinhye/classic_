package com.classic.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dao.AddrBookDAO;
import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/address/remove.do")
public class AddrBookDeleteJSON extends HttpServlet {
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = null;
		int delete = 0;
		String strMemNum = req.getParameter("mem_num");
		String strNum = req.getParameter("addr_num");

		try {
			conn=ClassicDBConnection.getConnection();
			AddrBookDAO addrDAO = new AddrBookDAOImp(conn);
			delete = addrDAO.addrBookDelete(Integer.parseInt(strNum),Integer.parseInt(strMemNum));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append("{\"delete\":\""+delete+"\"}");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strMemNum = req.getParameter("mem_num");
		String strNum = req.getParameter("addr_num");
		String[] checks = strNum.split("-");
		Connection conn=null;
		AddrBookDAO addrDAO = null;
		int delete=0;
		try {
			conn=ClassicDBConnection.getConnection();
			addrDAO = new AddrBookDAOImp(conn);
			for(int i=0; i<checks.length; i++) {
				delete += addrDAO.addrBookDelete(Integer.parseInt(checks[i]),Integer.parseInt(strMemNum));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().append("{\"delete\":\""+delete+"\"}");
	}
}
