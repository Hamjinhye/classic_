package com.classic.order.controller;

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
import com.classic.comu.serviceImp.QnaServiceImp;
import com.classic.order.dao.OrderDAO;
import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.dto.PaidDTO;
import com.classic.order.serviceImp.OrderServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/order/list.do")
public class OrderListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PagingDTO pagingDTO = new PagingDTO();
		String str_memnum=req.getParameter("num"); 
		String pageNum_temp = req.getParameter("pageNum");

		int mem_num=Integer.parseInt(str_memnum);
		int totalRecord = new OrderServiceImp().recordTotal(mem_num);
		pagingDTO.setPageNum_temp(pageNum_temp); 
		pagingDTO.setTotalRecord(totalRecord); 
		pagingDTO = Paging.setPaging(pagingDTO);
		
		String url=req.getContextPath()+"/order/list.do?num="+mem_num+"&pageNum="; 
		
		List<PaidDTO> orderList = new ArrayList<PaidDTO>();
		Connection conn = null;
		try {
			conn=ClassicDBConnection.getConnection();
			orderList = new OrderDaoImp(conn).ListSelect(Integer.parseInt(str_memnum), pagingDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
<<<<<<< HEAD
=======
		req.setAttribute("totalRecord", totalRecord);
>>>>>>> origin
		req.setAttribute("orderList", orderList);
		req.setAttribute("url", url); 
		req.setAttribute("p", pagingDTO);
		req.getRequestDispatcher("/view/order/list.jsp").forward(req, resp);
	}
	
}
