package gd.fintech.fileuploadtest.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.fileuploadtest.mapper.BoardfileMapper;
import gd.fintech.fileuploadtest.service.BoardService;
import gd.fintech.fileuploadtest.vo.Board;
import gd.fintech.fileuploadtest.vo.BoardForm;

@Controller
public class BoardController {
	@Autowired BoardService boardService;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/deleteFile")
	public String deleteFile(@RequestParam(name="boardId")int boardId,
			@RequestParam(name="boardfileId")int boardfileId) {
		boardService.removeBoardFile(boardfileId);
		return "redirect:/updateBoard?boardId="+boardId;
	}
	@GetMapping("/boardOne")
	public String boardOne(Model model,@RequestParam(name="boardId") int boardId) {
		Board boardOne = boardService.getBoardFormOne(boardId);
		model.addAttribute("boardOne",boardOne);
		return "boardOne";
	}
	@GetMapping("/updateBoard")
	public String updateBoard(Model model,@RequestParam(name="boardId") int boardId) {
		Board boardOne = boardService.getBoardFormOne(boardId);
		model.addAttribute("boardOne",boardOne);
		return "updateBoard";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(BoardForm boardForm) {
		boardService.updateBoard(boardForm);
		return "redirect:/boardOne?boardId="+boardForm.getBoardId();
	}
	
	@GetMapping("/removeBoard")
	public String removeBoard(@RequestParam(name="boardId")int boardId) {
		boardService.removeBoard(boardId);
		return "redirect:/boardList/1";
	}
	
	@GetMapping("/boardList/{currentPage}")
	public String boardList(Model model, @PathVariable(name="currentPage")int currentPage) {
		//페이징
		int rowPerPage =10;
		int totalCount= boardService.getBoardListTotalCount();
		int lastPage = (totalCount/rowPerPage) +1;
		int showPage =10; 
		int firstShow = currentPage - (currentPage%showPage)+1;
		if(currentPage%showPage==0) {
			firstShow = currentPage - ((currentPage-1)%showPage);
		}
		int lastShow=firstShow+showPage-1;
		
		List<Board> boardList = boardService.getBoardListByPage(currentPage,rowPerPage);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("firstShow",firstShow);
		model.addAttribute("lastShow",lastShow);
		
		
		
		logger.debug("boardList size :"+boardList.size());
		return "boardList";
	}
	@GetMapping("/addboard")
	public String addBoard() {
		return "addboard";
	}
	
	@PostMapping("/addboard")
	public String addBoard(BoardForm boardForm) {
		logger.debug(boardForm.toString());
		//logger.debug("size : " + boardForm.getBoardfile().size());
		boardService.addBoard(boardForm);
		return "redirect:/boardList/1";
	}
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
}
