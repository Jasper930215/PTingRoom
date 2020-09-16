package noom.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.admin.dao.AdminMemberDAO;
import noom.common.common.CommandMap;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService
{
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	public Object getMemCnt(String searchType, String searchWord) throws Exception
	{
		Object result = adminMemberDAO.getMemCnt(searchType, searchWord);
		return result;
	}
	@Override
	public List<Map<String,Object>> selectMemList(CommandMap commandMap, String searchType, String searchWord) throws Exception
	{
		return adminMemberDAO.selectMemList(commandMap, searchType, searchWord);
	}
	public Object getWdCnt(String searchType, String searchWord) throws Exception
	{
		Object result = adminMemberDAO.getWdCnt(searchType, searchWord);
		return result;
	}
	@Override
	public List<Map<String,Object>> selectWdList(CommandMap commandMap, String searchType, String searchWord) throws Exception
	{
		return adminMemberDAO.selectWdList(commandMap, searchType, searchWord);
	}
	@Override
	public Map<String,Object> selectMemInfo(Map<String, Object> map) throws Exception
	{
		return adminMemberDAO.selectMemInfo(map);
	}
	@Override
	public void updateMemStat(Map<String, Object> map) throws Exception
	{
		adminMemberDAO.updateMemStat(map);
	}
	@Override
	public void updateLoWeight(Map<String, Object> map) throws Exception
	{
		adminMemberDAO.updateLoWeight(map);
	}
}