package noom.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.dao.AbstractDAO;

@Repository("adminGymDAO")
public class AdminGymDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord)
	{
		map.put("START", start);
		map.put("END", end);
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("adminGym.selectBoardList", map);
	}
	
	public int boardListGetCount(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("adminGym.boardListGetCount", map).toString());
	}
	
	public void insertGym(Map<String, Object> map) throws Exception
	{
		insert("adminGym.insertGym", map);
		
	}
	
	public void insertFile(Map<String, Object> map) throws Exception
	{ 
		System.out.println("--dao pic-- : "+ map);
		insert("adminGym.insertFile", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("adminGym.selectBoardDetail", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception
	{ 
		return (List<Map<String, Object>>)selectList("adminGym.selectFileList", map); 
	}

	
	public void deleteBoard(Map<String, Object> map) throws Exception
	{ 
		delete("adminGym.deleteBoard", map); 
	}
	
	/*
	 * public void updateBoard(Map<String, Object> map) throws Exception {
	 * update("adminGym.updateBoard", map); }
	 * 
	 * public void deleteFileList(Map<String, Object> map) throws Exception {
	 * update("adminGym.deleteFileList", map); }
	 * 
	 * public void updateFile(Map<String, Object> map) throws Exception {
	 * update("adminGym.updateFile", map); }
	 */


}
