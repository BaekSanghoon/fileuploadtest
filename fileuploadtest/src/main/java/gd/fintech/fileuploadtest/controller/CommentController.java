package gd.fintech.fileuploadtest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.fileuploadtest.service.CommentService;
import gd.fintech.fileuploadtest.vo.Comment;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	
	@PostMapping("/addComment")
	public String addComment(Comment comment) {
		commentService.addComment(comment);
		return "redirect:/boardOne?boardId="+comment.getBoardId();
	}
	
	@GetMapping("/deleteCommnetOne")
	public String deleteCommentOne(
			@RequestParam(name="boardId")int boardId,
			@RequestParam(name="commentId")int commentId) {
		
		commentService.deleteComment(commentId);
		return "redirect:/boardOne?boardId="+boardId;
	}
}
