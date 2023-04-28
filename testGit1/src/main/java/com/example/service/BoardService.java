package com.example.service;

import java.util.List;

import com.example.domain.ApiVO;
import com.example.domain.Criteria;

public interface BoardService {

	public void register(ApiVO board);
	public ApiVO get(Long bno);
	public boolean modify(ApiVO board);
	public boolean remove(Long bno);

	/* public List<BoardVO> getList(); */

	public List<ApiVO> getList(Criteria cri);

}
