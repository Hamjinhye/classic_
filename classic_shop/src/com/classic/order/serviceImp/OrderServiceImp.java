package com.classic.order.serviceImp;

import java.sql.Connection;

import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.service.OrderService;
import com.classic.util.ClassicDBConnection;

public class OrderServiceImp implements OrderService {
	static Connection conn = null;
	
	@Override
	public int recordTotal(int mem_num) {
		int totalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new OrderDaoImp(conn).selectCount(mem_num);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			ClassicDBConnection.close(conn);
		}
		return totalRecord;
	}


}
