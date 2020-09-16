package noom.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.common.common.CommandMap;
import noom.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService
{
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int selectMemberID(Map<String, Object> map) throws Exception
	{
		return memberDAO.selectMemberID(map);
	}
	
	@Override
	public void insertMember(Map<String, Object> map) throws Exception
	{
		memberDAO.insertMember(map);
	}
	
	@Override
	public void insertMemberAdd(Map<String, Object> map) throws Exception
	{
		memberDAO.insertMemberAdd(map);
	}
	
	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception
	{
		return memberDAO.selectMemberInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> selectProductList(Map<String,Object> map) throws Exception
	{
		return memberDAO.selectProductList(map);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> selectPrice(Map<String,Object> map) throws Exception
	{
		return (Map<String, Object>) memberDAO.selectPrice(map);
	}
	
	@Override 
	public void updateMemberAdd(Map<String, Object> map) throws Exception
	{ 
		memberDAO.updateMemberAdd(map); 
	}
	
	@Override 
	public void updateInfo(Map<String, Object> map) throws Exception
	{ 
		memberDAO.updateInfo(map); 
	}
	
	@Override public void bye(Map<String, Object> map) throws Exception
	{ 
		memberDAO.bye(map); 
	}
	
	@Override
	public int searchMember(Map<String, Object> map) throws Exception
	{
		return memberDAO.searchMember(map);
	}
}
