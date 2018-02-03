package com.classic.comu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.common.controller.Paging;
import com.classic.common.dto.PagingDTO;
import com.classic.comu.dto.QnaDTO;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/community/qna.do")
public class QnaListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//search setting
		String subject = req.getParameter("searchSubject");
		String name = req.getParameter("searchName");
		if(subject == null || subject == "") { subject = ""; }
		if(name == null || name == "") { name = ""; }
		//paging setting
		PagingDTO pagingDTO = new PagingDTO();
		String pageNum_temp = req.getParameter("pageNum");
		//int totalRecord = new QnaServiceImp().recordTotal();
		int searchRecord = new QnaServiceImp().searchCount(subject, name);
		pagingDTO.setPageNum_temp(pageNum_temp);
		pagingDTO.setTotalRecord(searchRecord);
		pagingDTO = Paging.setPaging(pagingDTO);
		String url=req.getContextPath()+"/community/qna.do?pageNum=";
		String returnPage = "&searchSubject="+subject+"&searchName="+name;
		List<QnaDTO> qnaList = new QnaServiceImp().searchQna(subject, name, pagingDTO);
		req.setAttribute("url", url);
		req.setAttribute("p", pagingDTO);
		req.setAttribute("returnPage", returnPage);
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("searchRecord", searchRecord);
		req.getRequestDispatcher("/view/comu/qna/list.jsp").forward(req, resp);
	}
}
