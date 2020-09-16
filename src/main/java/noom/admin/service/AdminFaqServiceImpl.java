package noom.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.admin.dao.AdminFaqDAO;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService
{
	@Resource(name="adminFaqDAO")
	private AdminFaqDAO adminFaqDAO;
	
	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return adminFaqDAO.selectBoardList(map, start, end, searchType, searchWord);
	}
	
	@Override 
	public int boardListGetCount(String searchType, String searchWord) throws Exception 
	{ 
		return adminFaqDAO.boardListGetCount(searchType, searchWord); 
	}
	
	@Override 
	public void insertBoard(Map<String, Object> map) throws Exception 
	{ 
		adminFaqDAO.insertBoard(map); 
	}
	
	@Override public void updateBoard(Map<String, Object> map) throws Exception
	{ 
		adminFaqDAO.updateBoard(map); 
	}
	
	@Override 
	public void deleteBoard(Map<String, Object> map) throws Exception 
	{ 
		adminFaqDAO.deleteBoard(map); 
	}
	
	@Override 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception 
	{ 
		 
		Map<String, Object> resultMap = adminFaqDAO.selectBoardDetail(map); 
		return resultMap; 
	}
}
