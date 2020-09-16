package noom.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public int selectMemberID(Map<String, Object> map) throws Exception
	{
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("member.selectMemberID",map);
		
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		
		return result;
	}
	
	public void insertMember(Map<String, Object> map) throws Exception
	{
		insert("member.insertMember", map);
	}
	
	public void insertMemberAdd(Map<String, Object> map) throws Exception
	{
		insert("member.insertMemberAdd", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>)selectOne("member.selectMemberInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("member.selectProductList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPrice(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>) selectOne("member.selectPrice", map);
	}
	
	public void updateMemberAdd(Map<String, Object> map) throws Exception
	{ 
		update("member.updateMemberAdd", map); 
	}
	
	public void updateInfo(Map<String, Object> map) throws Exception
	{ 
		update("member.updateInfo", map); 
	}
	public void bye(Map<String, Object> map) throws Exception
	{ 
		update("member.bye", map); 
	}
	
	@SuppressWarnings("unchecked")
	public int searchMember(Map<String, Object> map) throws Exception
	{
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("member.searchMember",map);
		
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		
		return result;
	}
}
