package com.classic.product.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.ColourDAOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.daoImp.ProductDAOImp;
import com.classic.product.daoImp.SearchDAOImp;
import com.classic.product.dto.ProductDTO;
import com.classic.product.service.ProductService;
import com.classic.util.ClassicDBConnection;

public class ProductServiceImp implements ProductService{

	static Connection conn = null;

	@Override
	public List<ProductDTO> listProduct(PagingDTO pagingDTO, int cate, int num) {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			productList = new ProductDAOImp(conn).selectProductList(pagingDTO, cate, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return productList;
	}

	@Override
	public int recordTotal(int cate, int num) {
		int totalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new ProductDAOImp(conn).productTotalRecord(cate, num); //record 호출
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
	public List<ColourDTO> listColour(PagingDTO pagingDTO, int cate, int num) {
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			colourList = new ColourDAOImp(conn).selectCateListColours(pagingDTO, cate, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return colourList;
	}

	@Override
	public List<MiniCateDTO> listMiniCate(PagingDTO pagingDTO, int cate, int num) {
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			if(cate==0) {
				miniCateList = new MiniCateDAOImp(conn).selectMiniCateList(pagingDTO, cate, num);
			}
			else if(cate==1) {
				int cate_num= new CateDAIOImp(conn).selectCateNum(num);
				miniCateList = new MiniCateDAOImp(conn).selectMiniCateList(pagingDTO, cate, cate_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return miniCateList;
	}

	@Override
	public CateDTO cateDTO(PagingDTO pagingDTO, int cate, int num) {
		CateDTO cateDTO = null;
		try {
			conn=ClassicDBConnection.getConnection();
			if(cate==0) {
				cateDTO=new CateDAIOImp(conn).selectCate(num);
			}else if(cate==1) {
				int cate_num=new CateDAIOImp(conn).selectCateNum(num);
				cateDTO=new CateDAIOImp(conn).selectCate(cate_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		
		
		return cateDTO;
	}
	
	//상품 검색 카테고리 출력
	@Override
	public List<MiniCateDTO> forSearchCateRead() {
		List<MiniCateDTO> searchMiniCateList = new ArrayList<MiniCateDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			searchMiniCateList = new MiniCateDAOImp(conn).forSearchCataList();
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
		return searchMiniCateList;
	}

	@Override
	public List<ProductDTO> searchProduct(String name, String cate_num, int priceHigh, int priceLow,
			PagingDTO pagingDTO) {
		List<ProductDTO> productSearchList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			productSearchList = new SearchDAOImp(conn).searchProduct(name, cate_num, priceHigh, priceLow, pagingDTO);
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
		return productSearchList;
	}

	@Override
	public int searchCount(String name, String cate_num, int priceHigh, int priceLow) {
		int searchCount = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			searchCount = new SearchDAOImp(conn).searchCount(name, cate_num, priceHigh, priceLow);
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
		return searchCount;
	}

	@Override
	public List<ColourDTO> readColor() {
		List<ColourDTO> colorList = new ArrayList<ColourDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			colorList = new SearchDAOImp(conn).selectColor();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return colorList;
	}

	@Override
	public List<ProductDTO> listNew()  {
		List<ProductDTO> newList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			newList = new ProductDAOImp(conn).mainNewList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return newList;
	}

	@Override
	public List<ProductDTO> listBest() {
		List<ProductDTO> bestList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			bestList = new ProductDAOImp(conn).mainBestList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return bestList;
	}

}
