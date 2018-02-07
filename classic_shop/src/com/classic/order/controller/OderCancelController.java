package com.classic.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dto.PaidDTO;
import com.classic.order.serviceImp.OrderServiceImp;

@WebServlet("/order/cancel.do")
public class OderCancelController  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String order_num=req.getParameter("order_num");
		PaidDTO paidDTO=new PaidDTO();
		paidDTO.setOrder_num(order_num);
		boolean modify = false;
		modify=new OrderServiceImp().cancelUpdate(paidDTO);
		req.setAttribute("modify",modify);
		req.getRequestDispatcher("/view/order/list.jsp").forward(req, resp);
	}
}
