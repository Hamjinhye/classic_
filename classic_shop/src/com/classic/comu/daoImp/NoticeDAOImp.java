package com.classic.comu.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.dao.NoticeDAO;
import com.classic.comu.dto.NoticeDTO;



public class NoticeDAOImp implements NoticeDAO{
	
	private Connection conn;
	public NoticeDAOImp(Connection conn) {
		this.conn = conn;
	}
	
	
	@Override
	public List<NoticeDTO> selectNotice(PagingDTO pagingDTO) throws Exception {
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		String sql = "SELECT * FROM"
					+ " (SELECT ROWNUM row_num, notice.* FROM"
						+ " (SELECT n.num, m.id as name, n.title, n.indate, n.count"
						+ " FROM notice n, member m"
						+ " WHERE n.mem_num=m.num"
						+ " ORDER BY n.num DESC) notice"
						+ " WHERE ROWNUM <=?)"
						+ " WHERE row_num >=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pagingDTO.getEndRecord());
		pstmt.setInt(2, pagingDTO.getStartRecord());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setRow_num(rs.getInt("row_num"));
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setIndate(rs.getDate("indate"));
			noticeDTO.setCount(rs.getInt("count"));
			noticeList.add(noticeDTO);
		}
		return noticeList;
	}

	@Override
	public NoticeDTO selectNotice(int num) throws Exception {
		NoticeDTO noticeDTO = null;
		String sql = "SELECT n.num, m.id as name, n.subject, n.content, n.count, n.indate"
				+ " FROM notice n, member m"
				+ " WHERE n.mem_num=m.num" 
				+ " AND n.num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setSubject(rs.getInt("subject"));
			noticeDTO.setContent(rs.getString("content"));
			noticeDTO.setCount(rs.getInt("count"));
			noticeDTO.setIndate(rs.getDate("indate"));
		}
		return noticeDTO;
	}

	@Override
	public int noticeTotalRecord() throws Exception {
		int totalRecord = 0;
		String sql = "SELECT COUNT(*) as total FROM notice";
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
	public int selectCount(int num) throws Exception {
		int count = 0;
		String sql = "UPDATE notice SET count=count+1 WHERE num=?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		count = pstmt.executeUpdate();
		return count;
	}
}
