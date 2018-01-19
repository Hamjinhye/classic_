package com.classic.member.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.member.dao.AddrBookDAO;
import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.member.dto.AddrBookDTO;
import com.classic.member.serviceImp.AddrBookServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/address/register.do")
//@WebServlet("/addresslist/insert.do")
public class AddrBookRegisterJSON extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/view/member/mypage/addressRegister.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memNum = req.getParameter("mem_num");
		String zipCode = req.getParameter("zip_code");
		String baseAddr = req.getParameter("base_addr");
		String detailAddr = req.getParameter("detail_addr");
		AddrBookDTO addrDTO = new AddrBookDTO();
		addrDTO.setMem_num(Integer.parseInt(memNum));
		addrDTO.setZip_code(zipCode);
		addrDTO.setBase_addr(baseAddr);
		addrDTO.setDetail_addr(detailAddr);
		boolean register = false;
		register = new AddrBookServiceImp().registerAddr(addrDTO);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().append("{\"register\":\""+register+"\"}");

	}
}
