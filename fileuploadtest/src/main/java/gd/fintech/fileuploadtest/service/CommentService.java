package gd.fintech.fileuploadtest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.fileuploadtest.mapper.CommentMapper;
import gd.fintech.fileuploadtest.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired private CommentMapper commentMapper;
	public int addComment(Comment comment) {
		return commentMapper.insertComment(comment);
	}
	
	public int deleteComment(int commentId) {
		return commentMapper.deleteComment(commentId);
	}
}
