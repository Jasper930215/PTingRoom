package noom.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("admin.selectMemberInfo", map);
	}
	
	public void updatePW(Map<String, Object> map) throws Exception
	{ 
		update("admin.updatePW", map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPdList(Map<String,Object> map, int start, int end, String searchType, String searchWord)
	{
		map.put("START", start);
		map.put("END", end);
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("admin.selectPdList", map);
	}
	
	public int pdListGetCount(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("admin.pdListGetCount", map).toString());
	}
	
	public void insertPd(Map<String, Object> map) throws Exception
	{ 
		insert("admin.insertPd", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectPdDetail(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("admin.selectPdDetail", map); 
	}
	
	public void deletePd(Map<String, Object> map) throws Exception
	{ 
		delete("admin.deletePd", map); 
	}
	
	public void updatePd(Map<String, Object> map) throws Exception
	{ 
		update("admin.updatePd", map); 
	}
}
