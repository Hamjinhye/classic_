package com.classic.comu.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.dao.QnaDAO;
import com.classic.comu.dto.QnaDTO;


public class QnaDAOImp implements QnaDAO{
	
	private Connection conn;
	public QnaDAOImp(Connection conn) {
		this.conn = conn;
	}
/*	@Override
	public List<QnaDTO> selectQna() throws Exception {
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		String sql = "SELECT q.num, q.mem_num, m.id as name, q.subject, q.count, q.indate, q.secure"
				+ " FROM qna q, member m"
				+ " WHERE q.mem_num=m.num"
				+ " ORDER BY q.num DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setMem_num(rs.getInt("mem_num"));
			qnaDTO.setName(rs.getString("name"));
			qnaDTO.setSubject(rs.getInt("subject"));
			qnaDTO.setCount(rs.getInt("count"));
			qnaDTO.setIndate(rs.getDate("indate"));
			qnaDTO.setSecure(rs.getInt("secure"));
			qnaList.add(qnaDTO);
		}
		return qnaList;
	}*/
	
	@Override
	public List<QnaDTO> selectQna(PagingDTO pagingDTO) throws Exception {
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		String sql = "SELECT * FROM"
				+ " (SELECT ROWNUM row_num, qna.* FROM"
				+ " (SELECT q.num, m.id as name, q.subject, q.count, q.indate, q.secure"
				+ " FROM qna q, member m"
				+ " WHERE q.mem_num=m.num"
				+ " ORDER BY q.num DESC) qna"
				+ " WHERE ROWNUM <= ?)"
				+ " WHERE row_num >= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pagingDTO.getEndRecord()); //끝 게시물
		pstmt.setInt(2, pagingDTO.getStartRecord()); //시작 게시물
		rs = pstmt.executeQuery();
		while(rs.next()) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setRow_num(rs.getInt("row_num")); //DTO에 row_num 추가하기 & 맨 밑에 보면 total 레코드 구하는 메소드 있음
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setName(rs.getString("name"));
			qnaDTO.setSubject(rs.getInt("subject"));
			qnaDTO.setCount(rs.getInt("count"));
			qnaDTO.setIndate(rs.getDate("indate"));
			qnaDTO.setSecure(rs.getInt("secure"));
			qnaList.add(qnaDTO);
		}
		return qnaList;
	}
	@Override
	public List<QnaDTO> searchQna(int subject, String name, PagingDTO pagingDTO) throws Exception {
		List<QnaDTO> qnaSearchList = new ArrayList<QnaDTO>();
		return qnaSearchList;
	}
	@Override
	public List<QnaDTO> selectMemQna(int mem_num, PagingDTO pagingDTO) throws Exception {
		List<QnaDTO> memQnaList = new ArrayList<QnaDTO>();
		String sql = "SELECT * FROM"
						+ " (SELECT ROWNUM row_num, qna.* FROM"
							+ " (SELECT q.num, m.id as name, q.subject, q.indate, q.count, q.secure"
							+ " FROM qna q, member m"
							+ " WHERE q.mem_num=m.num"
							+ " AND q.mem_num=?"
							+ " ORDER BY q.indate DESC) qna"
						+ " WHERE ROWNUM <=?)"
					+ " WHERE row_num >=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setInt(2, pagingDTO.getEndRecord());
		pstmt.setInt(3, pagingDTO.getStartRecord());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setRow_num(rs.getInt("row_num"));
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setName(rs.getString("name"));
			qnaDTO.setSubject(rs.getInt("subject"));
			qnaDTO.setCount(rs.getInt("count"));
			qnaDTO.setSecure(rs.getInt("secure"));
			qnaDTO.setIndate(rs.getDate("indate"));
			memQnaList.add(qnaDTO);
		}
		return memQnaList;
	}
	@Override
	public QnaDTO detailQna(int num) throws Exception {
		QnaDTO qnaDTO = null;
		String sql = "SELECT q.num, m.id as name, q.subject, q.content, q.count, q.secure, q.pwd, q.indate"
				+ " FROM qna q, member m"
				+ " WHERE q.mem_num=m.num"
				+ " AND q.num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setName(rs.getString("name"));
			qnaDTO.setSubject(rs.getInt("subject"));
			qnaDTO.setContent(rs.getString("content"));
			qnaDTO.setCount(rs.getInt("count"));
			qnaDTO.setSecure(rs.getInt("secure"));
			qnaDTO.setPwd(rs.getString("pwd"));
			qnaDTO.setIndate(rs.getDate("indate"));
		}
		return qnaDTO;
	}
	@Override
	public int insertQna(QnaDTO qnaDTO) throws Exception {
		int insert = 0;
		String sql = "INSERT INTO qna (num, mem_num, subject, content, count, secure, pwd, indate)"
				+ " VALUES(qna_seq.nextval,?,?,?,0,?,?,sysdate)";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qnaDTO.getMem_num());
		pstmt.setInt(2, qnaDTO.getSubject());
		pstmt.setString(3, qnaDTO.getContent());
		pstmt.setInt(4, qnaDTO.getSecure());
		pstmt.setString(5, qnaDTO.getPwd());
		insert = pstmt.executeUpdate();
		return insert;
	}
	@Override
	public int updateQna(QnaDTO qnaDTO) throws Exception {
		int update = 0;
		String sql = "UPDATE qna SET subject=?, content=?, secure=?, pwd=? WHERE num=?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qnaDTO.getSubject());
		pstmt.setString(2, qnaDTO.getContent());
		pstmt.setInt(3, qnaDTO.getSecure());
		pstmt.setString(4, qnaDTO.getPwd());
		pstmt.setInt(5, qnaDTO.getNum());
		update = pstmt.executeUpdate();
		return update;
	}
	@Override
	public int deleteQna(int num) throws Exception {
		int delete = 0;
		String sql = "DELETE FROM qna WHERE num=?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		delete = pstmt.executeUpdate();
		return delete;
	}
	@Override
	public int qnaTotalRecord() throws Exception { //페이징에 사용할 totalRecord
		int totalRecord = 0;
		String sql = "SELECT COUNT(*) as total FROM qna";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalRecord = rs.getInt("total");
		}
		return totalRecord;
	}

	@Override
	public int qnaMemTotalRecord(int mem_num) throws Exception {
		int memTotalRecord = 0;
		String sql = "SELECT COUNT(*) as total FROM qna WHERE mem_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			memTotalRecord = rs.getInt("total");
		}
		return memTotalRecord;
	}

	@Override
	public int count(int num) throws Exception {
		int count = 0;
		String sql = "UPDATE qna SET count=count+1 WHERE num=?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		count = pstmt.executeUpdate();
		return count;
	}
}
