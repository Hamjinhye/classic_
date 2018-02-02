package com.classic.member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.common.controller.Paging;
import com.classic.common.dto.PagingDTO;
import com.classic.member.dao.AddrBookDAO;
import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.member.dto.AddrBookDTO;
import com.classic.member.serviceImp.AddrBookServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/address.do")
public class AddrBookListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PagingDTO pagingDTO = new PagingDTO();
		String memNum = req.getParameter("num");
		String pageNum_temp = req.getParameter("pageNum");
		int memTotalRecord = new AddrBookServiceImp().memRecordTotal(Integer.parseInt(memNum));
		pagingDTO.setPageNum_temp(pageNum_temp);
		pagingDTO.setTotalRecord(memTotalRecord);
		pagingDTO=Paging.setPaging(pagingDTO);
		
		String url=req.getContextPath()+"/user/address.do?num="+memNum+"&pageNum=";
		
		List<AddrBookDTO> addrBookList = new AddrBookServiceImp().listAddr(Integer.parseInt(memNum),pagingDTO);
		req.setAttribute("url", url);
		req.setAttribute("p", pagingDTO);
		req.setAttribute("addrBookList", addrBookList);
		req.getRequestDispatcher("/view/member/mypage/addressList.jsp").forward(req, resp);
	}
}
