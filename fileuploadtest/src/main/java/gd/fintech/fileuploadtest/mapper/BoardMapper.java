package gd.fintech.fileuploadtest.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.fileuploadtest.vo.Board;
import gd.fintech.fileuploadtest.vo.BoardForm;
@Mapper
public interface BoardMapper {
	int insertBoard(Board board);
	List<Board> selectBoardListByPage(Map<String,Object> Pagemap);
	int selectBoardListTotalCount();
	int deleteBoard(int boardId);
	
	
	Board selectBoardFormOne(int boardId);
	int updateBoard(Board board);
	
}
