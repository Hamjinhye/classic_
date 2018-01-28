package com.classic.order.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.member.dto.CouponDTO;
import com.classic.order.dao.OrderDAO;
import com.classic.order.dto.PaidDTO;
import com.classic.util.ClassicDBConnection;

public class OrderDaoImp implements OrderDAO{
	
	
	private Connection conn;
	public OrderDaoImp(Connection conn) {
		this.conn = conn;
	}
	@Override
	public List<PaidDTO> ListSelect(int mem_num) throws Exception {
		List<PaidDTO> orderList = new ArrayList<PaidDTO>();
		String sql ="select p.num, p.order_num, p.payment, p.order_state, p.mem_num, " + 
				"g.num as g_num, g.name as g_name, d.state as deliv_state, d.deliv_num, "+ 
				"g.num as product_num, s.sizu as g_size, c.name as g_color " + 
				"from paid p, member m, product g, delivery d, sizu s, colour c " + 
				"where p.product_num=g.num " + 
				"and p.mem_num=m.num " + 
				"and p.num=d.paid_num(+) " + 
				"and p.sizu_num=s.num "+
				"and p.colour_num=c.num "+
				"and mem_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			PaidDTO order = new PaidDTO();
			order.setNum(rs.getInt("num"));
			order.setOrder_num(rs.getString("order_num"));
			order.setPayment(rs.getInt("payment"));
			order.setOrder_state(rs.getInt("order_state"));
			order.setMem_num(rs.getInt("mem_num"));
			order.setG_num(rs.getInt("g_num"));
			order.setG_name(rs.getString("g_name"));
			order.setDeliv_state(rs.getInt("deliv_state"));
			order.setDeliv_num(rs.getString("deliv_num"));
			order.setProduct_num(rs.getInt("product_num"));
			order.setG_size(rs.getString("g_size"));
			order.setG_color(rs.getString("g_color"));
			orderList.add(order);
		}
		
		/*System.out.println("DaoImp_orderList: "+orderList);*/
		return orderList;
	}
	@Override
	public int cancelUpdate(PaidDTO paidDto) throws Exception {
		//주문취소
		int update=0;
		String sql="UPDATE paid SET order_state=-2 " + 
				"WHERE order_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, paidDto.getOrder_num());
		update=pstmt.executeUpdate();
		
		return update;
	}
	@Override
	public int shippingUpdate(String order_num) throws Exception {
		int update=0;
		return update;
	}
	@Override
	public PaidDTO DetailSelect(int mem_num, String order_num) throws Exception {
		//주문 상세내역
		PaidDTO detail = new PaidDTO();
		String sql ="select p.num, p.order_num, p.payment, p.order_state, p.mem_num, " + 
				"g.num as g_num, g.name as g_name, d.state as deliv_state, d.deliv_num, d.company as deliv_com, " + 
				"g.num as product_num, s.sizu as g_size, c.name as g_color, p.order_money, " + 
				"cp.log_num, cp.num as coupon_num, cpl.num as cpl_num, cpl.name as coupon_name, cpl.sale as coupon_sale, "+ 
				"p.name, p.phone, p.zip_code, p.base_addr, p.detail_addr, p.memo " + 
				"from paid p, member m, product g, delivery d, sizu s, colour c, coupon cp, coupon_log cpl " + 
				"where p.product_num=g.num " + 
				"and p.mem_num=m.num " + 
				"and p.num=d.paid_num(+) " + 
				"and p.sizu_num=s.num " + 
				"and p.colour_num=c.num " + 
				"and p.coupon_num=cp.num(+) "+ 
				"and cp.log_num=cpl.num(+) " +
				"and p.mem_num=? " + 
				"and p.order_num=?"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setString(2, order_num);
		System.out.println("mem_num:"+mem_num);
		System.out.println("order_num:"+order_num);
		
		rs=pstmt.executeQuery();
		if(rs.next()) {
			detail.setNum(rs.getInt("num"));
			detail.setOrder_num(rs.getString("order_num"));
			detail.setPayment(rs.getInt("payment"));
			detail.setOrder_state(rs.getInt("order_state"));
			detail.setMem_num(rs.getInt("mem_num"));
			detail.setG_num(rs.getInt("g_num"));
			detail.setG_name(rs.getString("g_name"));
			detail.setDeliv_state(rs.getInt("deliv_state"));
			detail.setDeliv_num(rs.getString("deliv_num"));
			detail.setProduct_num(rs.getInt("product_num"));
			detail.setG_size(rs.getString("g_size"));
			detail.setG_color(rs.getString("g_color"));
			detail.setOrder_money(rs.getInt("order_money"));
			detail.setCoupon_name(rs.getString("coupon_name"));
			detail.setCoupon_num(rs.getInt("coupon_num"));
			detail.setCoupon_sale(rs.getInt("coupon_sale"));
			detail.setDeliv_com(rs.getString("deliv_com"));
			detail.setName(rs.getString("name"));
			detail.setPhone(rs.getInt("phone"));
			detail.setZip_code(rs.getString("zip_code"));
			detail.setBase_addr(rs.getString("base_addr"));
			detail.setDetail_addr(rs.getString("detail_addr"));
			detail.setMemo(rs.getString("memo"));
		}
		System.out.println("다오detail: "+detail);
		return detail;
	}
	
	
	
	
	//혜진 주문전 sheet에서 쿠폰 몇장인지보여줄때 
	@Override
	public int couponCount(int mem_num) throws Exception {
		int coupon=0;
		String sql = "SELECT COUNT(*) FROM COUPON WHERE mem_num=? AND state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			coupon = rs.getInt("COUNT(*)");
		}
		return coupon;
	}
	//쿠폰 선택할 때 정보
	@Override
	public List<CouponDTO> selectCoupon(int mem_num) throws Exception {
		List<CouponDTO> couponList = new ArrayList<CouponDTO>();
		CouponDTO coupon = null;
		String sql = "SELECT c.num coupon_num, c.mem_num mem_num , cl.name coupon_name, cl.sale disconunt "
					+ "from coupon c, coupon_log cl " 
					+ "where c.log_num = cl.num and "
					+ "cl.start_date<=sysdate and cl.end_date>=sysdate "
					+ "and c.mem_num = ? and c.state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			coupon = new CouponDTO();
			coupon.setNum(rs.getInt("coupon_num"));
			coupon.setMem_num(rs.getInt("mem_num"));
			coupon.setCoupon_name(rs.getString("coupon_name"));
			coupon.setSale(rs.getInt("discount"));
			//coupon.setIndate(rs.getString("indate")); - 얘 dto에서 date로 받을건지 무렁봐야대 
			couponList.add(coupon);
		}
		return couponList;
	}
	@Override
	public int insert(PaidDTO paidDTO) throws Exception {
		int insert = 0; 
		String sql = "INSERT paid INTO "
		return 0;
	}
	

	
}
