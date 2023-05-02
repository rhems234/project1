package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BoardVO;
import com.example.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	public List<BoardVO> getBoardList() throws Exception {
		return boardRepository.getBoardList();
	}

	public BoardVO getBoard(String id) throws Exception {
		return boardRepository.getBoard(id);
	}

	public void insertBoard(BoardVO board) throws Exception {
		boardRepository.insertBoard(board);
	}

	public void updateBoard(BoardVO board) throws Exception {
		boardRepository.updateBoard(board);
	}

	public void deleteBoard(String id) throws Exception {
		boardRepository.deleteBoard(id);
	}

}

