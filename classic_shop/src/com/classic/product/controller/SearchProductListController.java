package com.classic.product.controller;

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
import com.classic.product.dao.CateDAO;
import com.classic.product.dao.MiniCateDAO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.dto.ProductDTO;
import com.classic.product.serviceImp.ProductServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/product/search.do")
public class SearchProductListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String cate_num = req.getParameter("searchCate");
		String name = req.getParameter("name");
		String priceStr = req.getParameter("productPrice");
		int priceHigh = 0;
		int priceLow = 0;
		if(cate_num == null || cate_num == "") {
			cate_num = "";
		} 
		if(name == null || name == "") {
			name = "";
		}
		if(priceStr == null || priceStr == ""){
			priceHigh = 0;
			priceLow = 1000000;
		} else if(priceStr.equals("30000")) {
			priceHigh = 0;
			priceLow = 30000;
		} else if(priceStr.equals("50000")) {
			priceHigh = 0;
			priceLow = 50000;
		} else if(priceStr.equals("10000")) {
			priceHigh = 0;
			priceLow = 100000;
		} else if(priceStr.equals("100000")) {
			priceHigh = 1000000;
			priceLow = 100000;
		}
		
		PagingDTO pagingDTO = new PagingDTO();
		String pageNum_temp = req.getParameter("pageNum");
		int searchCount = new ProductServiceImp().searchCount(name, cate_num, priceHigh, priceLow);
		pagingDTO.setRowNum(9);
		pagingDTO.setPageNum_temp(pageNum_temp);
		pagingDTO.setTotalRecord(searchCount);
		pagingDTO = Paging.setPaging(pagingDTO);
		String url = req.getContextPath()+"/product/search.do?pageNum=";
		String returnPage = "&searchCate="+cate_num+"&name="+name+"&price="+priceStr;
		List<CateDTO> cateList = new ArrayList<CateDTO>();
		List<MiniCateDTO> miniCateList = new ProductServiceImp().forSearchCateRead();
		List<ProductDTO> searchList = new ProductServiceImp().searchProduct(name, cate_num, priceHigh, priceLow, pagingDTO);
		List<ColourDTO> colorList = new ProductServiceImp().readColor();
		Connection conn =null;
		try {
			conn=ClassicDBConnection.getConnection();
			CateDAO cateDAO = new CateDAIOImp(conn);
			cateList = cateDAO.selectCateList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		req.setAttribute("cateList", cateList);
		req.setAttribute("miniCateList", miniCateList);
		req.setAttribute("searchList", searchList);
		req.setAttribute("searchCount", searchCount);
		req.setAttribute("url", url);
		req.setAttribute("returnPage", returnPage);
		req.setAttribute("p", pagingDTO);
		req.setAttribute("colorList", colorList);
		req.getRequestDispatcher("/view/product/search/searchForm.jsp").forward(req, resp);
	}

}
