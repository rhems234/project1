package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BuyVO;
import com.example.service.BuyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/buy/*")
public class BuyController {

	@Autowired
	private BuyService service;

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}

	@GetMapping("/get")
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/get");
		model.addAttribute("buy", service.get(id));
	}

	@PostMapping("/modify")
	public String modify(BuyVO buy, RedirectAttributes rttr) {
		log.info("modify: " + buy);

		if (service.modify(buy)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/buy/list";
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(BuyVO buy, RedirectAttributes rttr) {

		log.info("register: " + buy);
		service.register(buy);
		rttr.addFlashAttribute("result", buy.getId());

		return "redirect:/buy/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {

		log.info("remove : " + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/buy/list";
	}
}
