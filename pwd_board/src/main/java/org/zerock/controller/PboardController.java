package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.PboardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.PboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class PboardController {

	private PboardService service;
	
	// 목록화면
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		
//		model.addAttribute("list", service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list : " + cri);
		
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));  // 123은 임의의 수
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 등록화면
	@GetMapping("/register")
	public void register() {		
	}
	
	// 등록처리
	@PostMapping("/register")
	public String register(PboardVO board, RedirectAttributes rttr) {
		
		log.info("register : " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	// 상세보기, 수정화면
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	// 수정처리
	@PostMapping("/modify")
	public String modify(PboardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "modified");
		}
		return "redirect:/board/list";
	}
	
	// 삭제처리
	@RequestMapping(value="/remove" , method = {RequestMethod.GET, RequestMethod.POST})
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "removed");
		}
		return "redirect:/board/list";
	}
	
	// 비밀번호 확인
	@GetMapping("/pwdCheck")
	public void pwdcheck() {		
	}
	
	/*
	 * @PostMapping(value = "/check", consumes = "application/json", produces =
	 * {MediaType.TEXT_PLAIN_VALUE}) public ResponseEntity<String>
	 * create(@RequestBody String password) {
	 * 
	 * log.info("Password : " + password);
	 * 
	 * PboardVO checkCount = service.check(password);
	 * 
	 * log.info("Password CHECK COUNT : " + checkCount);
	 * 
	 * return checkCount == 1 ? new ResponseEntity<>("확인되었습니다.", HttpStatus.OK) :
	 * new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 삼항 연산자 처리 }
	 */}