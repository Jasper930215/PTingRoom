package noom.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import noom.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord)
	{
		map.put("START", start);
		map.put("END", end);
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("review.selectBoardList", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception
	{ 
		insert("review.insertBoard", map); 
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception
	{ 
		update("review.updateHitCnt", map); 
	} 
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("review.selectBoardDetail", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectBoardDetailAdd(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("review.selectBoardDetailAdd", map); 
	}

	public void updateBoard(Map<String, Object> map) throws Exception
	{ 
		update("review.updateBoard", map); 
	}

	public void deleteBoard(Map<String, Object> map) throws Exception
	{ 
		delete("review.deleteBoard", map); 
	}
	
	public int boardListGetCount(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("review.boardListGetCount", map).toString());
	}
}	
