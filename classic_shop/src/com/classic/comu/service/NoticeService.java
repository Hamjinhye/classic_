package com.classic.comu.service;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.dto.NoticeDTO;

public interface NoticeService {
	
	public List<NoticeDTO> readNotice(PagingDTO pagingDTO);
	public NoticeDTO readNotice(int num);
	public int recordTotal();
}
