package com.classic.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.common.controller.Paging;
import com.classic.common.dto.PagingDTO;
import com.classic.order.dao.WishListDAO;
import com.classic.order.daoImp.WishListDAOImp;
import com.classic.order.dto.WishDTO;
import com.classic.util.ClassicDBConnection;

@WebServlet("/user/wish.do")
public class WIshListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		Connection conn =null;
		System.out.println(req.getParameter("num"));
		if(req.getParameter("num")!="") {
			int memNum = Integer.parseInt(req.getParameter("num"));
			int totalRecode = 0;
			String strPageNum = (req.getParameter("pageNum")!=null)?req.getParameter("page"):"1";
			String url = req.getContextPath()+"/view/wish.do?num="+memNum+"&pageNum=";
			List<WishDTO> wishList = null;
			PagingDTO pagingDTO = null;
			try {
				conn = ClassicDBConnection.getConnection();
				WishListDAO wish = new WishListDAOImp(conn);
				pagingDTO = new PagingDTO();
				totalRecode = wish.recodeTotal(memNum);
				wishList = wish.selectWish(memNum);
				pagingDTO.setTotalRecord(totalRecode);
				pagingDTO.setPageNum_temp(strPageNum);
				pagingDTO = Paging.setPaging(pagingDTO);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ClassicDBConnection.close(conn);
			}
			req.setAttribute("url", url);
			req.setAttribute("p", pagingDTO);
			req.setAttribute("wishList", wishList);
			req.getRequestDispatcher("/view/order/wish/list.jsp").forward(req, resp);
			
		} else {
			resp.sendRedirect(req.getContextPath()+"/login.do");
		}
	}
}
