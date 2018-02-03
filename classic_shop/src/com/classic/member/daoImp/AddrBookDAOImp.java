package com.classic.member.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.member.dao.AddrBookDAO;
import com.classic.member.dto.AddrBookDTO;


public class AddrBookDAOImp implements AddrBookDAO {
	
	private Connection conn;
	public AddrBookDAOImp(Connection conn) {
		this.conn = conn;
	}
	@Override
	public List<AddrBookDTO> selectAddr(int mem_num,PagingDTO pagingDTO) throws Exception {
		List<AddrBookDTO> addrBookList = new ArrayList<AddrBookDTO>();
		String sql="SELECT * FROM"
				+ " (SELECT ROWNUM row_num, addr_book.* FROM"
				+ " (SELECT a.num, a.zip_code, a.base_addr, a.detail_addr"
				+ " FROM addr_book a, member m"
				+ " WHERE a.mem_num=m.num AND a.mem_num=?"
				+ " ORDER BY a.num DESC) addr_book"
				+ " WHERE ROWNUM <= ? )"
				+ " WHERE row_num >= ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setInt(2, pagingDTO.getEndRecord()); //끝 게시물
		pstmt.setInt(3, pagingDTO.getStartRecord()); //시작 게시물
		rs=pstmt.executeQuery();
		while(rs.next()) {
			AddrBookDTO addrBookDTO = new AddrBookDTO();
			addrBookDTO.setRow_num(rs.getInt("row_num"));
			addrBookDTO.setNum(rs.getInt("num"));
			addrBookDTO.setZip_code(rs.getString("zip_code"));
			addrBookDTO.setBase_addr(rs.getString("base_addr"));
			addrBookDTO.setDetail_addr(rs.getString("detail_addr"));
			addrBookList.add(addrBookDTO);
		}
		return addrBookList;
	}

	@Override
	public int addrBookInsert(AddrBookDTO addrBookDTO) throws Exception {
		int insert=0;
		String sql="INSERT INTO addr_book(num, mem_num, zip_code, base_addr, detail_addr) VALUES(addr_book_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, addrBookDTO.getMem_num());
		pstmt.setString(2, addrBookDTO.getZip_code());
		pstmt.setString(3, addrBookDTO.getBase_addr());
		pstmt.setString(4, addrBookDTO.getDetail_addr());
		pstmt.setString(5, addrBookDTO.getZip_code());
		insert = pstmt.executeUpdate();
		return insert;
	}

	@Override
	public int addrBookDelete(int num, int mem_num) throws Exception {
		int delete = 0;
		String sql ="delete from addr_book where mem_num=? and num=?";
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_num);
		pstmt.setInt(2, num);
		delete = pstmt.executeUpdate();
		return delete;
	}
	@Override
	public int addrTotalRecord(int mem_num) throws Exception {
		int memTotalRecord=0;
		String sql = "SELECT COUNT(*) as total FROM addr_book where mem_num=?";
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
}
