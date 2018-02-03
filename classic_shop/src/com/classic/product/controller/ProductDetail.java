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

import com.classic.product.daoImp.ColourDAOImp;
import com.classic.product.daoImp.ProductDAOImp;
import com.classic.product.daoImp.ReviewDAOImp;
import com.classic.product.daoImp.ShopGuideDAOImp;
import com.classic.product.daoImp.SizuDAOImp;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.ProductDTO;
import com.classic.product.dto.ReviewDTO;
import com.classic.product.dto.ShopGuideDTO;
import com.classic.product.dto.SizuDTO;
import com.classic.util.ClassicDBConnection;


@WebServlet("/detail.do")
public class ProductDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str_num = req.getParameter("num");
	
		ProductDTO productDTO=null;
		ShopGuideDTO shopGuideDTO = null;
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		List<SizuDTO> sizuList = new ArrayList<SizuDTO>();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		Connection conn=null;
		try {
			int product_num=Integer.parseInt(str_num);
			conn = ClassicDBConnection.getConnection();
			productDTO=new ProductDAOImp(conn).selectProduct(product_num);
			colourList=new ColourDAOImp(conn).selectColourList(product_num);
			sizuList=new SizuDAOImp(conn).selectSizuList(product_num);
			shopGuideDTO=new ShopGuideDAOImp(conn).selectShopGuide(21);// 임시데이터 나중에 바꿔야함 기본사용, 직접 입력 상태 줘서 레코드 두줄만 써야할듯, 0,1 로 제어해서
			reviewList=new ReviewDAOImp(conn).selectReviewList(product_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		
		
		req.setAttribute("productDetail", productDTO); 
		req.setAttribute("colourList", colourList); 
		req.setAttribute("sizuList", sizuList); 
		req.setAttribute("shopGuide", shopGuideDTO); 
		req.setAttribute("reviewList", reviewList); 
		req.getRequestDispatcher("/view/product/detail.jsp").forward(req, resp);
		
	}
}
