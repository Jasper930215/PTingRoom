package noom.admin.service;

import java.util.List;
import java.util.Map;

import noom.common.common.CommandMap;

public interface AdminMemberService
{
	Object getMemCnt(String searchType, String searchWord) throws Exception;
	public List<Map<String,Object>> selectMemList(CommandMap commandMap, String searchType, String searchWord) throws Exception;
	Object getWdCnt(String searchType, String searchWord) throws Exception;
	public List<Map<String,Object>> selectWdList(CommandMap commandMap, String searchType, String searchWord) throws Exception;
	Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception;
	void updateMemStat(Map<String, Object> map) throws Exception;
	void updateLoWeight(Map<String, Object> map) throws Exception;
}