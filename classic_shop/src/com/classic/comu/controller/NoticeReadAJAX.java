package com.classic.comu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.comu.dto.NoticeDTO;
import com.classic.comu.serviceImp.NoticeServiceImp;

@WebServlet("/notice/read.do")
public class NoticeReadAJAX extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String str_num = req.getParameter("num");
		NoticeDTO noticeDTO = new NoticeServiceImp().readNotice(Integer.parseInt(str_num));
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append(noticeDTO.toString());
	}
}
