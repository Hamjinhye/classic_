package com.classic.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.ProductDTO;
import com.classic.product.serviceImp.ProductServiceImp;


@WebServlet("/main.do")
public class MainController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductDTO> newList = new ProductServiceImp().listNew();
		List<ProductDTO> bestList = new ProductServiceImp().listBest();
		List<ColourDTO> colorList = new ProductServiceImp().readColor();
		
		req.setAttribute("newList", newList);
		req.setAttribute("bestList", bestList);
		req.setAttribute("colorList", colorList);
		req.getRequestDispatcher("/view/main.jsp").forward(req, resp);
	}

}
