package noom.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.common.CommandMap;
import noom.common.dao.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO
{
	public Object getMemCnt(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return selectOne("adminMember.getMemCnt", map);
	}
	public Object getWdCnt(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return selectOne("adminMember.getWithdrawCnt", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMemList(CommandMap commandMap, String searchType, String searchWord) throws Exception
	{
		commandMap.put("SEARCH_TYPE", searchType);
		commandMap.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("adminMember.selectMemList", commandMap.getMap());
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectWdList(CommandMap commandMap, String searchType, String searchWord) throws Exception
	{
		commandMap.put("SEARCH_TYPE", searchType);
		commandMap.put("SEARCH_WORD", searchWord);
		return (List<Map<String,Object>>)selectList("adminMember.selectWithdrawList", commandMap.getMap());
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>) selectOne("adminMember.selectMemInfo", map);
	}
	public void updateMemStat(Map<String, Object> map) throws Exception
	{
		update("adminMember.updateMemStat", map);
	}
	public void updateLoWeight(Map<String, Object> map) throws Exception
	{
		update("adminMember.updateLoWeight", map);
	}
}
