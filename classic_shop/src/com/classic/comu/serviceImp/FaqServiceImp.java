package com.classic.comu.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.comu.daoImp.FaqDAOImp;
import com.classic.comu.dto.FaqDTO;
import com.classic.comu.service.FaqService;
import com.classic.util.ClassicDBConnection;

public class FaqServiceImp implements FaqService{

	static Connection conn = null;
	
	@Override
	public List<FaqDTO> readFaq() {
		List<FaqDTO> faqList = new ArrayList<FaqDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			faqList = new FaqDAOImp(conn).selectFaq();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return faqList;
	}   

}
