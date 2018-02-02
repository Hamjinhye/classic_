package com.classic.comu.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.daoImp.NoticeDAOImp;
import com.classic.comu.dto.NoticeDTO;
import com.classic.comu.service.NoticeService;
import com.classic.util.ClassicDBConnection;

public class NoticeServiceImp implements NoticeService{
	
	static Connection conn = null;

	@Override
	public List<NoticeDTO> readNotice(PagingDTO pagingDTO) {
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			noticeList = new NoticeDAOImp(conn).selectNotice(pagingDTO);
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
		return noticeList;
	}

	@Override
	public NoticeDTO readNotice(int num) {
		NoticeDTO noticeDTO = null;
		try {
			conn = ClassicDBConnection.getConnection();
			noticeDTO = new NoticeDAOImp(conn).selectNotice(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return noticeDTO;
	}


	@Override
	public int recordTotal() {
		int totalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new NoticeDAOImp(conn).noticeTotalRecord();
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
