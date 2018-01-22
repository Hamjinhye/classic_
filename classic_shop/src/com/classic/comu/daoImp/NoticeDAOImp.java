package com.classic.comu.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




import com.classic.common.dto.PagingDTO;

import com.classic.comu.dao.NoticeDAO;
import com.classic.comu.dto.NoticeDTO;
import com.classic.util.ClassicDBConnection;



public class NoticeDAOImp implements NoticeDAO{
	
	private Connection conn;
	public NoticeDAOImp(Connection conn) {
		this.conn = conn;
	}
	
/*	@Override
	public List<NoticeDTO> selectNotice() throws Exception{
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		String sql = "SELECT n.num, m.id as name, n.title, n.count, n.indate"
				+ " FROM notice n, member m"
				+ " WHERE n.mem_num=m.num"
				+ " ORDER BY n.num DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setCount(rs.getInt("count"));
			noticeDTO.setIndate(rs.getDate("indate"));
			noticeList.add(noticeDTO);
		}
		return noticeList;
	}*/
	
	@Override
	public List<NoticeDTO> selectNotice(PagingDTO pagingDTO) throws Exception {
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		String sql = "SELECT * FROM"
					+ " (SELECT ROWNUM row_num, notice.* FROM"
						+ " (SELECT n.num, m.id as name, n.title, n.count, n.indate"
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
			noticeDTO.setCount(rs.getInt("count"));
			noticeDTO.setIndate(rs.getDate("indate"));
			noticeList.add(noticeDTO);
		}
		return noticeList;
	}


	@Override
	public NoticeDTO selectNotice(int num) throws Exception {
		NoticeDTO noticeDTO = null;
		String sql = "SELECT n.num, n.title, n.content, m.id as name, n.indate, n.count"
				+ " FROM notice n, member m"
				+ " WHERE n.mem_num=m.num"
				+ " AND n.num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setCount(rs.getInt("count"));
			noticeDTO.setIndate(rs.getDate("indate"));
			noticeDTO.setContent(rs.getString("content"));
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
}
	
//유정이가 전에 해놓은 거
/*	@Override
	public List<NoticeDTO> select(Connection conn) throws Exception {
		List<NoticeDTO> deptList = new ArrayList<NoticeDTO>();  //list 배열을 효율적으로 하는거!!일단이러케
		String sql="select * from notice"; //
		PreparedStatement pstmt = conn.prepareStatement(sql); //연결하고 sql던지고
		ResultSet rs = pstmt.executeQuery(); //결과값을 담고 나타내고
		while(rs.next()) { //복수니까 
			NoticeDTO notice = new NoticeDTO();
			notice.setNum(rs.getInt("num"));
			notice.setMem_num(rs.getInt("mem_num"));
			notice.setTitle(rs.getString("title"));
			notice.setContent(rs.getString("content"));
			notice.setCount(rs.getInt("count"));
			notice.setDate(rs.getDate("indate"));
			
			deptList.add(notice);
		}
		return deptList;
	}

	@Override
	public NoticeDTO select(Connection conn, int num) throws Exception {
		NoticeDTO notice = new NoticeDTO();
		String sql="select * from notice where num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			notice.setNum(rs.getInt("num"));
			notice.setMem_num(rs.getInt("mem_num"));
			notice.setTitle(rs.getString("title"));
			notice.setContent(rs.getString("content"));
			notice.setCount(rs.getInt("count"));
			notice.setDate(rs.getDate("indate"));
		}
		return notice;
	}*/

