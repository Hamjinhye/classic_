package com.classic.comu.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.daoImp.QnaDAOImp;
import com.classic.comu.dto.QnaDTO;
import com.classic.comu.service.QnaService;
import com.classic.util.ClassicDBConnection;

public class QnaServiceImp implements QnaService{
	
	static Connection conn = null;

/*	@Override
	public List<QnaDTO> listQna() {
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			qnaList = new QnaDAOImp(conn).selectQna();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return qnaList;
	}*/

	@Override
	public List<QnaDTO> listQna(PagingDTO pagingDTO) {
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			qnaList = new QnaDAOImp(conn).selectQna(pagingDTO); //daoImp 호출
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
		return qnaList;
	}

	@Override
	public List<QnaDTO> readMemQna(int mem_num, PagingDTO pagingDTO) {
		List<QnaDTO> memQnaList = new ArrayList<QnaDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			memQnaList = new QnaDAOImp(conn).selectMemQna(mem_num, pagingDTO);
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
		return memQnaList;
	}

	@Override
	public QnaDTO readQna(int num) {
		QnaDTO qnaDTO = null;
		try {
			conn = ClassicDBConnection.getConnection();
			qnaDTO = new QnaDAOImp(conn).detailQna(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return qnaDTO;
	}

	@Override
	public boolean registerQna(QnaDTO qnaDTO) {
		boolean register = false;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			int insert = new QnaDAOImp(conn).insertQna(qnaDTO);
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
		} finally {
			ClassicDBConnection.close(conn);
		}
		
		return register;
	}

	@Override
	public boolean modifyQna(QnaDTO qnaDTO) {
		boolean modify = false;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			int update = new QnaDAOImp(conn).updateQna(qnaDTO);
			if(update==1) {
				modify = true;
			}
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
		return modify;
	}

	@Override
	public boolean removeQna(int num) {
		boolean remove = false;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			int qnaDel = new QnaDAOImp(conn).deleteQna(num);
			if(qnaDel==1) {
				remove = true;
			}
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
		return remove;
	}

	@Override
	public int recordTotal() {
		int totalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new QnaDAOImp(conn).qnaTotalRecord(); //record 호출
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
	public int memRecordTotal(int mem_num) {
		int memTotalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			memTotalRecord = new QnaDAOImp(conn).qnaMemTotalRecord(mem_num);
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
		return memTotalRecord;
	}

	@Override
	public int count(int num) {
		int count = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			count = new QnaDAOImp(conn).count(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return count;
	}
}
