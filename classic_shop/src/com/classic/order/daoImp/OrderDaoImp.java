package com.classic.order.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	
	
	//▼ 이거 나중에 개발 다 끝났을 땐 지우셔야 돼요(다른 곳에 있는 syso 포함!)
	/*public static void main(String[] args) {
		Connection conn=null;
		try {
			conn=ClassicDBConnection.getConnection();
			OrderDAO dao = new OrderDaoImp(conn);
			System.out.println(dao.ListSelect(1));
			//System.out.println(dao.DetailSelect(1, 43));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

	
}
