package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board")
	public String getBoardList(Model model) throws Exception {
		model.addAttribute("boardList", boardService.getBoardList());
		return "board/list";
	}

	@GetMapping("/board/{id}")
	public String getBoard(@PathVariable("id") String id, Model model) throws Exception {
		model.addAttribute("board", boardService.getBoard(id));
		return "board/detail";
	}

	@GetMapping("/board/write")
	public String writeBoardForm() {
		return "board/write";
	}

	@PostMapping("/board/write")
	public String writeBoard(BoardVO board, RedirectAttributes redirectAttrs) throws Exception {
		boardService.insertBoard(board);
		redirectAttrs.addFlashAttribute("msg", "글이 등록되었습니다.");
		return "redirect:/board";
	}

	@GetMapping("/board/{id}/update")
	public String updateBoardForm(@PathVariable("id") String id, Model model) throws Exception {
		model.addAttribute("board", boardService.getBoard(id));
		return "board/update";
	}

	@PostMapping("/board/update")
	public String updateBoard(BoardVO board, RedirectAttributes redirectAttrs) throws Exception {
		boardService.updateBoard(board);
		redirectAttrs.addFlashAttribute("msg", "글이 수정되었습니다.");
		return "redirect:/board/" + board.getId();
	}

	@GetMapping("/board/{id}/delete")
	public String deleteBoard(@PathVariable("id") String id, RedirectAttributes redirectAttrs) throws Exception {
		boardService.deleteBoard(id);
		redirectAttrs.addFlashAttribute("msg", "글이 삭제되었습니다.");
		return "redirect:/board";
	}

}
