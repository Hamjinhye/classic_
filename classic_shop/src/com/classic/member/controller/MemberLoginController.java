package com.classic.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classic.member.dto.MemberDTO;
import com.classic.member.service.MemberService;
import com.classic.member.serviceImp.MemberServiceImp;

@WebServlet("/login.do")
public class MemberLoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/view/member/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("memId");
		String pw = req.getParameter("memPw");
		HttpSession session = req.getSession();
		MemberDTO memDTO = new MemberServiceImp().readMember(id, pw);
		String msg = "아이디 또는 비밀번호를 확인해주세요.";
		String url = req.getContextPath()+"/login.do";
		if(memDTO!=null) {
			msg = id+"님 접속을 환영합니다.";
			url = req.getContextPath()+"/index.jsp";
			session.setAttribute("loginMem",	memDTO);
		}
		session.setAttribute("msg", msg);
		resp.sendRedirect(url);
	}
}
