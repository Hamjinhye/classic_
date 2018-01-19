package com.classic.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dto.MemberDTO;
import com.classic.member.serviceImp.MemberServiceImp;

@WebServlet("/signup/checkId.do")
public class MemberCheckIdJSON extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		boolean checkIdMsg = false; //id 사용 가능
		if(id!=null && id.trim()!="") {
			checkIdMsg = new MemberServiceImp().checkMemId(id);
		} else {
			checkIdMsg = true;
		}
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"checkIdMsg\":"+checkIdMsg+"}");
	}
}

