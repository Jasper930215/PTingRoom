package noom.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.dao.AbstractDAO;

@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord)
	{
		map.put("START", start);
		map.put("END", end);
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("adminFaq.selectBoardList", map);
	}
	
	public int boardListGetCount(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("adminFaq.boardListGetCount", map).toString());
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception
	{ 
		insert("adminFaq.insertBoard", map); 
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception
	{ 
		delete("adminFaq.deleteBoard", map); 
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception
	{ 
		update("adminFaq.updateBoard", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("adminFaq.selectBoardDetail", map); 
	}
}
