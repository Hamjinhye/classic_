package com.classic.order.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classic.order.dto.PaidDTO;
@WebServlet("/user/addorder.do")
public class OrderController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*NUM              NOT NULL NUMBER(8)
		MEM_NUM                     NUMBER(8)
		PRODUCT_NUM                 NUMBER(8)
		COUPON_NUM                  NUMBER(8) -- 
		ORDER_NUM          NOT NULL NUMBER(16) --
		NAME               NOT NULL VARCHAR2(20)
		PHONE              NOT NULL NUMBER(11)
		ZIP_CODE           NOT NULL VARCHAR2(21)
		BASE_ADDR          NOT NULL VARCHAR2(200)
		DETAIL_ADDR        NOT NULL VARCHAR2(200)
		MEMO                        VARCHAR2(300)
		PAID_DATE                   DATE
		PAY_WITH           NOT NULL NUMBER(1)
		ORDER_MONEY        NOT NULL NUMBER(12)
		PAYMENT            NOT NULL NUMBER(12)
		ORDER_DATE         NOT NULL DATE
		ORDER_STATE        NOT NULL NUMBER(1)    
		-3:취소/-2:환불반품/-1:교환/0:결제대기 / 1:결제완료 / 2:주문확인 / 3:주문완료
		DEPOSIT_NAME       NOT NULL VARCHAR2(20)
		0:배송준비 / 1:배송중 /2:배송완료 /3:수취확인*/
		req.setCharacterEncoding("UTF-8");
		String memNum = req.getParameter("memNum");
		String [] productNum = req.getParameterValues("productNum");
		String [] colour = req.getParameterValues("colour");
		String [] sizu = req.getParameterValues("sizu");
		String [] Quantity = req.getParameterValues("quantity");
		String orderMemName= req.getParameter("orderMemName");
		String orderPostCode = req.getParameter("orderPostCode");
		String oderAddress = req.getParameter("orderAddress");
		String orederHomeNumber = req.getParameter("orderHomeNumber");
		String orderPhone = req.getParameter("orderPhone");
		String delivName= req.getParameter("delivName");
		String delivPostCode = req.getParameter("delivPostCode");
		String delivAddress = req.getParameter("delivAddress");
		String delivHomeNumber = req.getParameter("delivHomeNumber");
		String delivPhone = req.getParameter("delivPhone");
		String delivComent = req.getParameter("delivComent");
		String couponNum = req.getParameter("");
		Date date = new Date();
		System.out.println(date);
		for(int i=0; i<productNum.length; i++) {
			PaidDTO  paidDTO = new PaidDTO(); 
			paidDTO.setMem_num(Integer.parseInt(memNum));
			paidDTO.setProduct_num(Integer.parseInt(productNum[i]));
			paidDTO.setCoupon_num((i==0)?Integer.parseInt(couponNum):null);
			paidDTO.setColour(colour[i]);
			paidDTO.setSizu(sizu[i]);
		}
		
	}
}
