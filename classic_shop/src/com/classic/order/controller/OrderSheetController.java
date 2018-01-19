package com.classic.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebFault;

import com.sun.xml.internal.ws.api.ha.HaInfo;

@WebServlet("/user/ordersheet.do")
public class OrderSheetController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String str_num=req.getParameter("num");
		//req.getRequestDispatcher("/view/order/sheet.jsp").forward(req, resp);
		//from주연
	}
}
