package com.classic.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dto.MemberDTO;
import com.classic.member.serviceImp.MemberServiceImp;

@WebServlet("/user/mypage/modify.do")
public class MemberModifyJSON extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_num = req.getParameter("num");
		MemberDTO memDTO = new MemberServiceImp().readMember(Integer.parseInt(str_num));
		req.setAttribute("modifyMem", memDTO);
		req.getRequestDispatcher("/view/member/mypage/memModify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_num = req.getParameter("num");
		String pw = req.getParameter("pw");
		String phone = req.getParameter("phone");
		MemberDTO memDTO = new MemberDTO();
		memDTO.setNum(Integer.parseInt(str_num));
		memDTO.setPw(pw);
		memDTO.setPhone(phone);
		boolean modify = new MemberServiceImp().modifyMember(memDTO);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"modify\":\""+modify+"\"}");
	}
}
