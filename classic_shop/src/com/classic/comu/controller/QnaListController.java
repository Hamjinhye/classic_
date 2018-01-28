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
import com.classic.comu.serviceImp.QnaReplyServiceImp;
import com.classic.comu.serviceImp.QnaServiceImp;

@WebServlet("/community/qna.do")
public class QnaListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		PagingDTO pagingDTO = new PagingDTO();
		String pageNum_temp = req.getParameter("pageNum");
		int totalRecord = new QnaServiceImp().recordTotal();
		pagingDTO.setPageNum_temp(pageNum_temp);
		pagingDTO.setTotalRecord(totalRecord);
		pagingDTO = Paging.setPaging(pagingDTO);
		
		String url=req.getContextPath()+"/community/qna.do?pageNum=";
		List<QnaDTO> qnaList = new QnaServiceImp().listQna(pagingDTO);
		req.setAttribute("url", url);
		req.setAttribute("p", pagingDTO);
		req.setAttribute("qnaList", qnaList);
		req.getRequestDispatcher("/view/comu/qnaList.jsp").forward(req, resp);
	}
}
