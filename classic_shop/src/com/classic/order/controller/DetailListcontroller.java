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

import com.classic.order.dao.OrderDAO;
import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.dto.PaidDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/order/detail.do")
public class DetailListcontroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_memnum=req.getParameter("num");
		String order_num=req.getParameter("order_num");
		int mem_num=Integer.parseInt(str_memnum);
		Connection conn = null;
		PaidDTO detail = new PaidDTO();
		int ordercount=0;
		try {
			conn=ClassicDBConnection.getConnection();
			OrderDAO orderDAO = new OrderDaoImp(conn);
			detail = orderDAO.DetailSelect(mem_num, order_num);
			ordercount = new OrderDaoImp(conn).orderCount(mem_num, order_num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		req.setAttribute("ordercount", ordercount);
		req.setAttribute("detail", detail);
		req.getRequestDispatcher("/view/order/detail.jsp").forward(req, resp);
		
	}
}
