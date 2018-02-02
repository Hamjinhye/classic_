package com.classic.member.serviceImp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.member.dto.AddrBookDTO;
import com.classic.member.service.AddrBookService;
import com.classic.util.ClassicDBConnection;

public class AddrBookServiceImp implements AddrBookService {
	static Connection conn = null;
	
	@Override
	public List<AddrBookDTO> listAddr(int mem_num, PagingDTO pagingDTO) {
		List<AddrBookDTO> addrBookList = new ArrayList<AddrBookDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			addrBookList = new AddrBookDAOImp(conn).selectAddr(mem_num, pagingDTO);
		} catch (Exception e) {
			e.printStackTrace();
			try{
				conn.rollback();
			} catch (Exception e2){
				e2.printStackTrace();
			}
		} finally {
			ClassicDBConnection.close(conn);
		}
		return addrBookList;
	}
	
	@Override
	public boolean registerAddr(AddrBookDTO addrDTO) {
		boolean register = false;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			int insert = new AddrBookDAOImp(conn).addrBookInsert(addrDTO);
			if(insert==1) {
				register = true;
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
		
		return register;
	}

	@Override
	public int memRecordTotal(int mem_num) {
		int totalRecord = 0;
		try {
			conn=ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new AddrBookDAOImp(conn).addrTotalRecord(mem_num);
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
		return totalRecord;
	}

}
