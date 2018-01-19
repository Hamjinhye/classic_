package com.classic.member.controller;

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
import com.classic.member.dto.MemberDTO;
import com.classic.member.serviceImp.MemberServiceImp;

@WebServlet("/user/mypage/myposting.do")
public class MypageMyPostingController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이징 된 qna 리스트
		//리뷰
		PagingDTO pagingDTO = new PagingDTO();
		String mem_num = req.getParameter("num"); //mem_num
		String pageNum_temp = req.getParameter("pageNum");
		int memTotalRecord = new QnaServiceImp().memRecordTotal(Integer.parseInt(mem_num));
		pagingDTO.setPageNum_temp(pageNum_temp);
		pagingDTO.setTotalRecord(memTotalRecord);
		pagingDTO = Paging.setPaging(pagingDTO);
		String url = req.getContextPath()+"/mypage/myposting.do?num="+mem_num+"&pageNum=";
		List<QnaDTO> memQnaList = new QnaServiceImp().readMemQna(Integer.parseInt(mem_num), pagingDTO); //내가 쓴 qna
		req.setAttribute("url", url);
		req.setAttribute("p", pagingDTO);
		req.setAttribute("memQnaList", memQnaList);
		req.getRequestDispatcher("/view/member/mypage/myposting.jsp").forward(req, resp);
	}

}
