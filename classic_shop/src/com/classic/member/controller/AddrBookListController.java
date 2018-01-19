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

import com.classic.member.dao.AddrBookDAO;
import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.member.dto.AddrBookDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/address.do")
//@WebServlet("/addresslist.do")
public class AddrBookListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memNum = req.getParameter("num");
		Connection conn = null;
		List<AddrBookDTO> addrList = new ArrayList<AddrBookDTO>();
		try {
			conn= ClassicDBConnection.getConnection();
			AddrBookDAO addrDAO = new AddrBookDAOImp(conn);
			addrList = addrDAO.addrBookSelect(Integer.parseInt(memNum));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		req.setAttribute("addrList", addrList);
		req.getRequestDispatcher("/view/member/mypage/addressList.jsp").forward(req, resp);
	}
/*	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = null;
		int delete = 0;
		String str_num = req.getParameter("num");
		try {
			conn=ClassicDBConnection.getConnection();
			AddrBookDAO addrDAO = new AddrBookDAOImp(conn);
			delete = addrDAO.addrBookDelete(Integer.parseInt(str_num));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"delete\":"+delete+"}");
	}*/
}
