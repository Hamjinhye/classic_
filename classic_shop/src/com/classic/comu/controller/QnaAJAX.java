package com.classic.comu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.comu.dto.QnaDTO;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/qna/ajax.do")
public class QnaAJAX extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//detail
		String str_num = req.getParameter("num");
		QnaDTO qnaDTO = new QnaServiceImp().readQna(Integer.parseInt(str_num));
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append(qnaDTO.toString());
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//delete
		String str_num = req.getParameter("num");
		boolean remove = false;
		remove = new QnaServiceImp().removeQna(Integer.parseInt(str_num));
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"remove\":"+remove+"}");
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//modify
		String str_num = req.getParameter("num");
		String str_subject = req.getParameter("subject");
		String str_secure = req.getParameter("secure");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setNum(Integer.parseInt(str_num));
		qnaDTO.setSubject(Integer.parseInt(str_subject));
		qnaDTO.setSecure(Integer.parseInt(str_secure));
		qnaDTO.setContent(content);
		qnaDTO.setPwd(pwd);
		boolean modify = false;
		modify = new QnaServiceImp().modifyQna(qnaDTO);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"modify\":"+modify+"}");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		resp.getWriter().append("{\"register\":"+register+"}");
	}
}
