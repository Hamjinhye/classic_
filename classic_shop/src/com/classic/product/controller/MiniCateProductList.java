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
import com.classic.util.ClassicDBConnection;

@WebServlet("/product/miniCateList.do") // "/product/cate.do
public class MiniCateProductList extends HttpServlet {
	//!!!나중에 ctroller, dto, dao, servie... 분리 해서 만들거임! 참고할 사람은 이거 참고하지마세요

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String str_mini=req.getParameter("num");
		
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		List<ColourDTO> coloursList = new ArrayList<ColourDTO>();
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		
		CateDTO cateDTO = null;
		Connection conn = null;
		try {
			conn=ClassicDBConnection.getConnection();
			int mini_num =Integer.parseInt(str_mini);
			ProductDAO productDAO=new ProductDAOImp(conn);
			ColourDAO colourDAO = new ColourDAOImp(conn); 
			MiniCateDAO miniCateDAO = new MiniCateDAOImp(conn);
			CateDAO cateDAO = new CateDAIOImp(conn);
			productList=productDAO.selectMiniCateProductList(mini_num);
			coloursList=colourDAO.selectMiniCateListColours(mini_num);
			
			int cate_num=cateDAO.selectCateNum(mini_num);
			miniCateList=miniCateDAO.selectMiniCateList(cate_num);
			cateDTO=cateDAO.selectCate(cate_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(conn!=null) {
				ClassicDBConnection.close(conn);
			}
		}
		req.setAttribute("productList", productList); 
		req.setAttribute("coloursList", coloursList);
		req.setAttribute("miniCateList", miniCateList);
		req.setAttribute("cate", cateDTO);
		req.getRequestDispatcher("/view/product/miniCateList.jsp").forward(req, resp);
		
		
	}
	
}
