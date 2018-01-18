package com.classic.member.serviceImp;

import java.sql.Connection;
import java.sql.SQLException;

import com.classic.member.daoImp.AddrBookDAOImp;
import com.classic.member.dto.AddrBookDTO;
import com.classic.member.service.AddrBookService;
import com.classic.util.ClassicDBConnection;

public class AddrBookServiceImp implements AddrBookService {
	static Connection conn = null;
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

}
