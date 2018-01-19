package com.classic.comu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.comu.dto.QnaDTO;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/community/qna/read.do")
public class QnaReadRemoveJSON extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//qna Detail
		req.setCharacterEncoding("UTF-8");
		QnaDTO qnaDTO = null;
		String str_num = req.getParameter("num");
		int count = new QnaServiceImp().count(Integer.parseInt(str_num));
		qnaDTO = new QnaServiceImp().readQna(Integer.parseInt(str_num));
		qnaDTO.setCount(count);
		req.setAttribute("qnaDTO", qnaDTO);
		req.getRequestDispatcher("/view/comu/qna/read.jsp").forward(req, resp);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//delete
		String str_num = req.getParameter("num");
		boolean remove = false;
		remove = new QnaServiceImp().removeQna(Integer.parseInt(str_num));
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"remove\":\""+remove+"\"}");
	}
}
