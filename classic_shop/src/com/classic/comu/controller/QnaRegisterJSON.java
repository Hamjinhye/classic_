package com.classic.comu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.comu.dto.QnaDTO;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/community/qna/register.do")
public class QnaRegisterJSON extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//request qna form
		req.getRequestDispatcher("/view/comu/qnaRegister.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//insert
		String str_mem = req.getParameter("mem_num");
		String str_subject = req.getParameter("subject");
		String str_secure = req.getParameter("secure");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setMem_num(Integer.parseInt(str_mem));
		qnaDTO.setSubject(Integer.parseInt(str_subject));
		qnaDTO.setSecure(Integer.parseInt(str_secure));
		qnaDTO.setContent(content);
		qnaDTO.setPwd(pwd);
		boolean register = false;
		register = new QnaServiceImp().registerQna(qnaDTO);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"register\":\""+register+"\"}");
	}
}
