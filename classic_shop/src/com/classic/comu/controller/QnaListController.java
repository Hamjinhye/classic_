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
		//qnaList
		PagingDTO pagingDTO = new PagingDTO(); //dto 호출
		String pageNum_temp = req.getParameter("pageNum"); //view에서 pageNum 받아오기
		int totalRecord = new QnaServiceImp().recordTotal(); //totalRecord 호출
		pagingDTO.setPageNum_temp(pageNum_temp); //view에서 받아온 String 타입의 pageNum을, pageNum_temp에 넣기(integer.parse도 Paging.java에 있음. 변환 필요X)
		pagingDTO.setTotalRecord(totalRecord); //전체 게시물 수 넣기
		pagingDTO = Paging.setPaging(pagingDTO); //pagingDTO에 Paging.java setting
		
		String url=req.getContextPath()+"/community/qna.do?pageNum="; //url 값 설정
		/*
		 view에서 어떻게 쓰이는지는, /common/paging.jsp 참고
		 pageNum과 또 다른 파라미터를 받아와야 하는 상황이라면, 아래의 형식으로 설정
		 String url = req.getContextPath()+"/mypage/myposting.do?num="+mem_num+"&pageNum=";
		 * */
		List<QnaDTO> qnaList = new QnaServiceImp().listQna(pagingDTO); //list 호출
		req.setAttribute("url", url); //url 내장객체에 담기
		req.setAttribute("p", pagingDTO);
		req.setAttribute("qnaList", qnaList);
		req.getRequestDispatcher("/view/comu/qnaList.jsp").forward(req, resp);
	}
}
