package com.classic.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dao.OrderDAO;
import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.dto.PaidDTO;
import com.classic.util.ClassicDBConnection;
@WebServlet("/user/addorder.do")
public class OrderController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memNum = req.getParameter("memNum");
		String [] productNum = req.getParameterValues("productNum");
		String [] colour = req.getParameterValues("colour");
		String [] sizu = req.getParameterValues("sizu");
		String [] quantity = req.getParameterValues("quantity");
		String [] price = req.getParameterValues("price");
		String orderMemName= req.getParameter("orderMemName");
		String orderPostCode = req.getParameter("orderPostCode");
		String oderAddress = req.getParameter("orderAddress");
		String oderAddress2 = req.getParameter("orderAddress2");
		String orederHomeNumber = req.getParameter("orderHomeNumber");
		String orderPhone = req.getParameter("orderPhone");
		String delivName= req.getParameter("delivName");
		String delivPostCode = req.getParameter("delivPostcode");
		String delivAddress = req.getParameter("delivAddress");
		String delivAddress2 = req.getParameter("delivAddress2");
		String delivHomeNumber = req.getParameter("delivHomeNumber");
		String delivPhone = req.getParameter("delivPhone");
		String delivComent = req.getParameter("delivComent");
		String couponNum = req.getParameter("couponNum").split("_")[0];
		String payWith = req.getParameter("payWith");
		String depositName = req.getParameter("depositName");
		System.out.println("couponSale:"+req.getParameter("couponNum").split("_")[1]);
		Double couponSale =Double.parseDouble(req.getParameter("couponNum").split("_")[1]);
		PaidDTO paidDTO = new PaidDTO();
		OrderDAO orderDAO = null;
		Connection conn = null;
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String systemTime = System.currentTimeMillis()+"";
		String orderNumber = simpleDateFormat.format(date)+systemTime.substring(systemTime.length()-8,systemTime.length());
		int insert = 0;
		paidDTO.setMem_num(Integer.parseInt(memNum));
		paidDTO.setCoupon_num(Integer.parseInt(couponNum));
		paidDTO.setName(delivName);
		paidDTO.setPhone(Integer.parseInt(delivPhone));
		paidDTO.setZip_code(delivPostCode);
		paidDTO.setBase_addr(delivAddress);
		paidDTO.setDetail_addr(delivAddress2);
		paidDTO.setMemo(delivComent);
		paidDTO.setPay_with(Integer.parseInt(payWith));
		paidDTO.setDeposit_name(depositName);
		paidDTO.setOrder_num(orderNumber);
		for(int i=0; i<productNum.length; i++) {
			paidDTO.setColour(colour[i]);
			paidDTO.setSizu(sizu[i]);
			int productPrice = Integer.parseInt(price[i]);
			paidDTO.setProduct_num(Integer.parseInt(productNum[i]));
			paidDTO.setOrder_money(productPrice);			
			for(int z = 0; z<Integer.parseInt(quantity[i]); z++) {
				try {
					System.out.println(couponSale+"="+couponSale.intValue());
					if(couponSale==couponSale.intValue()) {
						if(i==0&&z==0) {
							paidDTO.setPayment((int)(productPrice-couponSale));
							System.out.println("정수 첫번째 : "+paidDTO.getPayment());
						} else {
							paidDTO.setPayment(productPrice);
							System.out.println("정수 그 후  : "+paidDTO.getPayment());
						}
					}else {
						System.out.println("실수 계산:"+(int)(productPrice-(productPrice*couponSale)));
					}
					conn = ClassicDBConnection.getConnection();
					orderDAO = new OrderDaoImp(conn);
					/*insert += orderDAO.insert(paidDTO);*/
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
