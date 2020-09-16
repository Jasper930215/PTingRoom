package noom.mapview.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


import noom.common.dao.AbstractDAO;

@Repository("viewDAO")
public class ViewDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGymList(Map<String, Object> map, int start, int end, String searchWord) throws Exception
	{
		map.put("START", start);
		map.put("END", end);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String, Object>>) selectList("view.selectGymList", map);
	}

	public int gymListGetCount(String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("view.gymListGetCount", map).toString());
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectGymDetail(Map<String, Object> map) throws Exception
	{ 
		return (Map<String, Object>) selectOne("view.selectGymDetail", map); 
	}
	
	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception
	{ 
		return (List<Map<String, Object>>)selectList("view.selectFileList", map); 
	}
}
