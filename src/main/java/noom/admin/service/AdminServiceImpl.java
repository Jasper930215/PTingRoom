package noom.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.admin.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService
{
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception
	{
		return adminDAO.selectMemberInfo(map);
	}
	
	@Override public void updatePW(Map<String, Object> map) throws Exception
	{ 
		adminDAO.updatePW(map); 
	}
	
	@Override
	public List<Map<String,Object>> selectPdList(Map<String,Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return adminDAO.selectPdList(map, start, end, searchType, searchWord);
	}
	
	@Override 
	public int pdListGetCount(String searchType, String searchWord) throws Exception 
	{ 
		return adminDAO.pdListGetCount(searchType, searchWord); 
	}
	
	@Override 
	public void insertPd(Map<String, Object> map) throws Exception 
	{ 
		adminDAO.insertPd(map); 
	}
	
	@Override 
	public Map<String, Object> selectPdDetail(Map<String, Object> map) throws Exception 
	{ 
		 
		Map<String, Object> resultMap = adminDAO.selectPdDetail(map); 
		return resultMap; 
	}
	
	@Override public void updatePd(Map<String, Object> map) throws Exception
	{ 
		adminDAO.updatePd(map); 
	}
	
	@Override 
	public void deletePd(Map<String, Object> map) throws Exception 
	{ 
		adminDAO.deletePd(map); 
	}
}
