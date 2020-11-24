package gd.fintech.fileuploadtest.vo;

import java.util.List;

import lombok.Data;

@Data
public class Board {
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private List<Boardfile> boardfiles;
	private List<Comment> commentList;
	
}
