package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.controller.ProductDetail;
import com.classic.product.dao.ProductDAO;
import com.classic.product.dto.ProductDTO;
import com.classic.util.ClassicDBConnection;

public class ProductDAOImp implements ProductDAO{
	
	
	private Connection conn=null;
	public ProductDAOImp(Connection conn) throws Exception {
		this.conn=conn;
	}
	@Override
	public List<ProductDTO> selectProductList(PagingDTO pagingDTO, int cate, int num) throws Exception {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		String sql="";
		
		if(cate==0) {
			sql=	"SELECT * FROM "
					+"(SELECT ROWNUM row_num, product.* FROM (select * from product "
					+"where cate_num in "
					+"(select m.num from mini_cate m, cate c "
					+"where m.cate_num=c.num and c.num=? and m.state!=0)) product "
					+"WHERE ROWNUM <= ?) "
					+"WHERE row_num >=? ";
			
			
		}else if(cate==1) {
			sql=	"SELECT * FROM "
					+"(SELECT ROWNUM row_num, product.* FROM "
					+"(SELECT * FROM PRODUCT WHERE cate_num=?) product "
					+"WHERE ROWNUM <= ?) "
					+"WHERE row_num >=? ";
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setInt(2, pagingDTO.getEndRecord());
		pstmt.setInt(3, pagingDTO.getStartRecord());
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productList.add(productDTO);
		}
		
		return productList;
		
	}
	@Override
	public ProductDTO selectProduct(int num) throws Exception {
		ProductDTO productDTO = null;
		String sql = "select * from product where num=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			productDTO=new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
		}
		return productDTO;
	}
	@Override
	public List<ProductDTO> selectMiniCateProductList(int cate_num) throws Exception {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		String sql="SELECT * FROM PRODUCT WHERE cate_num=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cate_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productList.add(productDTO);
		}
		
		return productList;
	}
	@Override
	public int productTotalRecord(int cate, int num) throws Exception { //for Paigination
		int totalRecord = 0;
		String sql="";
		if(cate==0) {
			sql="select COUNT(*) as total from product "
					+ "where cate_num in"
					+ "(select m.num from mini_cate m, cate c "
					+ "where m.cate_num=c.num and c.num=? and m.state!=0)";
			
		}else if(cate==1) {
			sql="SELECT COUNT(*) as total FROM PRODUCT WHERE cate_num=?";
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalRecord = rs.getInt("total");
		}
		return totalRecord;
	}
	@Override
	public List<ProductDTO> mainNewList() throws Exception {
		List<ProductDTO> newList = new ArrayList<ProductDTO>();
		String sql = "SELECT * FROM product"
				+ " WHERE sell_ox != 0"
				+ " AND out_ox = 1"
				+ " ORDER BY indate DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setNum(rs.getInt("num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setName(rs.getString("name"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setOut_time(rs.getDate("out_time"));
			newList.add(productDTO);
		}
		return newList;
	}
	
	@Override
	public List<ProductDTO> mainBestList() throws Exception {
		List<ProductDTO> bestList = new ArrayList<ProductDTO>();
		String sql = "SELECT * FROM product"
				+ " WHERE TO_CHAR(TO_DATE(indate, 'yy/mm/dd'), 'yymmdd')"
				+ " >= TO_CHAR(ADD_MONTHS(TO_DATE(sysdate, 'yyyy-mm-dd'), -1), 'yymmdd')"
				+ " AND sell_ox != 0"
				+ " AND out_ox = 1"
				+ " ORDER BY total_pcs ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setNum(rs.getInt("num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setName(rs.getString("name"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setOut_time(rs.getDate("out_time"));
			bestList.add(productDTO);
		}
		return bestList;
	}
}
