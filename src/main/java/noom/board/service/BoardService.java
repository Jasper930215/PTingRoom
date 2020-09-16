package noom.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService 
{
	List<Map<String,Object>> selectBoardList(Map<String,Object> commandMap, int start, int end, String searchType, String searchWord) throws Exception;
	void insertBoard(Map<String, Object> map) throws Exception;
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	Map<String, Object> selectBoardDetailAdd(Map<String, Object> map) throws Exception;
	void updateBoard(Map<String, Object> map) throws Exception;
	void deleteBoard(Map<String, Object> map) throws Exception;
	int boardListGetCount(String searchType, String searchWord) throws Exception;
}
