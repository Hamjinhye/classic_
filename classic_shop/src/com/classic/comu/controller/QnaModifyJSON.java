package com.classic.comu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.comu.dto.QnaDTO;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/community/qna/modify.do")
public class QnaModifyJSON extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String str_num = req.getParameter("num");
		QnaDTO qnaDTO = new QnaServiceImp().readQna(Integer.parseInt(str_num));
		req.setAttribute("qnaModify", qnaDTO);
		req.getRequestDispatcher("/view/comu/qnaModify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//update
		String str_num = req.getParameter("num");
		String mem_num = req.getParameter("mem_num");
		String str_subject = req.getParameter("subject");
		String str_secure = req.getParameter("secure");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setNum(Integer.parseInt(str_num));
		qnaDTO.setMem_num(Integer.parseInt(mem_num));
		qnaDTO.setSubject(Integer.parseInt(str_subject));
		qnaDTO.setSecure(Integer.parseInt(str_secure));
		qnaDTO.setContent(content);
		qnaDTO.setPwd(pwd);
		boolean modify = false;
		modify = new QnaServiceImp().modifyQna(qnaDTO);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"modify\":\""+modify+"\"}");
	}
	

}
