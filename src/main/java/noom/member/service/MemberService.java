package noom.member.service;

import java.util.List;
import java.util.Map;

import noom.common.common.CommandMap;

public interface MemberService 	
{
	int selectMemberID(Map<String, Object> map) throws Exception;
	void insertMember(Map<String, Object> map) throws Exception;
	void insertMemberAdd(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectProductList(Map<String,Object> commandMap) throws Exception;
	Map<String, Object> selectPrice(Map<String,Object> commandMap) throws Exception;
	void updateMemberAdd(Map<String, Object> map) throws Exception;
	void updateInfo(Map<String, Object> map) throws Exception;
	void bye(Map<String, Object> map) throws Exception;
	int searchMember(Map<String, Object> map) throws Exception;
}
