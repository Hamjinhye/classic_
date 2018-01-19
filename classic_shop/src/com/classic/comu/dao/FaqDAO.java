package com.classic.comu.dao;

import java.util.List;

import com.classic.comu.dto.FaqDTO;

public interface FaqDAO {
	
	public List<FaqDTO> selectFaq() throws Exception;
	public FaqDTO selectFaq(int num) throws Exception;
	public List<FaqDTO> selectList(FaqDTO faqDTO,int num) throws Exception;
	public int insert(FaqDTO faqDTO) throws Exception;

/*public void setSelect(ResultSet rs) throws SQLException {
		this.setNum(rs.getInt("num"));
		this.setMem_num(rs.getInt("mem_num"));
		this.seta_content(rs.getString("a_content"));
		this.setq_title(rs.getString("q_title"));
			dto에서 이동	
			
			*/
			//일단 위에  selectFaq부터 햇어요~
	












}