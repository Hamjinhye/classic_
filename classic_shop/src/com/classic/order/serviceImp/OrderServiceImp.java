package com.classic.order.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.order.daoImp.OrderDaoImp;
import com.classic.order.dto.PaidDTO;
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

	@Override
	public List<PaidDTO> orderList(int mem_num, PagingDTO pagingDTO) {
		List<PaidDTO> orderList = new ArrayList<PaidDTO>();
		try {
			conn=ClassicDBConnection.getConnection();
			orderList = new OrderDaoImp(conn).ListSelect(mem_num, pagingDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		return orderList;
	}

	@Override
	public boolean cancelUpdate(PaidDTO paidDTO) {
		boolean modify=false;
		try {
			conn=ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			int update = new OrderDaoImp(conn).cancelUpdate(paidDTO);
			if(update==1) {
				modify=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			ClassicDBConnection.close(conn);
		}
		return modify;
	}


}
