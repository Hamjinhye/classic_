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

@WebServlet("/user/mypage.do")
public class MypageMainController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원정보, 주문내역, 내가쓴글
		PagingDTO pagingDTO = new PagingDTO();
		String mem_num = req.getParameter("num"); //mem_num
		pagingDTO = Paging.setPaging(pagingDTO);
		
		MemberDTO memDTO = new MemberServiceImp().readMember(Integer.parseInt(mem_num)); //회원 정보
		List<QnaDTO> memQnaList = new QnaServiceImp().readMemQna(Integer.parseInt(mem_num), pagingDTO); //내가 쓴 qna
		req.setAttribute("memDTO", memDTO);
		req.setAttribute("memQnaList", memQnaList);
		req.getRequestDispatcher("/view/member/mypage/main.jsp").forward(req, resp);
		
	}
}
