package com.classic.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import com.classic.product.dao.CateDAO;
import com.classic.product.dao.ColourDAO;
import com.classic.product.dao.MiniCateDAO;
import com.classic.product.dao.ProductDAO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.ColourDAOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.daoImp.ProductDAOImp;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.dto.ProductDTO;
import com.classic.product.service.ProductService;
import com.classic.product.serviceImp.ProductServiceImp;
import com.classic.util.ClassicDBConnection;

@WebServlet("/product.do") // "/product.do"
public class ProductList extends HttpServlet {
	//!!!나중에 ctroller, dto, dao, servie... 분리 해서 만들거임! 참고할 사람은 이거 참고하지마세요

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int cate=Integer.parseInt(req.getParameter("cate"));
		int num=Integer.parseInt(req.getParameter("num"));
		String pageNum_temp = req.getParameter("pageNum"); 
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		List<ColourDTO> coloursList = new ArrayList<ColourDTO>();
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		CateDTO cateDTO = null;
		Connection conn = null;
		
		PagingDTO pagingDTO = new PagingDTO();
		
		ProductService productService = new ProductServiceImp();
		
		int totalRecord = productService.recordTotal(cate, num); 
		
		pagingDTO.setPageNum_temp(pageNum_temp); //view에서 받아온 String 타입의 pageNum을, pageNum_temp에 넣기(integer.parse도 Paging.java에 있음. 변환 필요X)
		pagingDTO.setTotalRecord(totalRecord); 
		pagingDTO.setRowNum(9);
		
		pagingDTO = Paging.setPaging(pagingDTO); 
		
		productList = productService.listProduct(pagingDTO,cate,num);
		coloursList = productService.listColour(pagingDTO, cate, num);
		miniCateList = productService.listMiniCate(pagingDTO, cate, num);
		
		cateDTO=productService.cateDTO(pagingDTO, cate, num);
	
		
		String url=req.getContextPath()+"/product.do?cate="+cate+"&num="+num+"&pageNum="; 
		req.setAttribute("url", url); 
		req.setAttribute("p", pagingDTO);
		req.setAttribute("productList", productList);
		req.setAttribute("coloursList", coloursList);
		req.setAttribute("miniCateList", miniCateList);
		req.setAttribute("cate", cateDTO);
		
		
		
		
		if(cate==0) {
			req.getRequestDispatcher("/view/product/list.jsp").forward(req, resp);
		}else if(cate==1) {
			req.getRequestDispatcher("/view/product/miniCateList.jsp").forward(req, resp);
		}
		
		
	}
	
}
