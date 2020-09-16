package noom.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService
{
	Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception;
	void updatePW(Map<String, Object> map) throws Exception;
	int pdListGetCount(String searchType, String searchWord) throws Exception;
	List<Map<String,Object>> selectPdList(Map<String,Object> commandMap, int start, int end, String searchType, String searchWord) throws Exception;
	void insertPd(Map<String, Object> map) throws Exception;
	Map<String, Object> selectPdDetail(Map<String, Object> map) throws Exception;
	void updatePd(Map<String, Object> map) throws Exception;
	void deletePd(Map<String, Object> map) throws Exception;
}