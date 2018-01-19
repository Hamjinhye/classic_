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

@WebServlet("/user/order.do")
public class OrderListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_memnum=req.getParameter("num");
		Connection conn = null;
		List<PaidDTO> orderList = new ArrayList<PaidDTO>();
		try {
			conn=ClassicDBConnection.getConnection();
			OrderDAO orderDAO = new OrderDaoImp(conn);
			orderList = orderDAO.ListSelect(Integer.parseInt(str_memnum));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("/view/order/list.jsp").forward(req, resp);
	}
	
}
