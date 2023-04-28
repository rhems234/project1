package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.ApiVO;
import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;

	@Override
	public void register(ApiVO board) {
		log.info("register............." + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public ApiVO get(Long bno) {
		log.info("get............" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ApiVO board) {
		log.info( "modify : " + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info( "remove......." + bno);
		return mapper.delete(bno) == 1;
	}

	/*
	 * @Override public List<BoardVO> getList() {
	 * log.info("getList................."); return mapper.getList(); }
	 */

	@Override
	public List<ApiVO> getList(Criteria cri){

		log.info("get List With Criteria" + cri);

		return mapper.getListWithPaging(cri);
	}
}
