package noom.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.admin.dao.AdminNoticeDAO;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService
{
	@Resource(name="adminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	
	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return adminNoticeDAO.selectBoardList(map, start, end, searchType, searchWord);
	}
	
	@Override 
	public int boardListGetCount(String searchType, String searchWord) throws Exception 
	{ 
		return adminNoticeDAO.boardListGetCount(searchType, searchWord); 
	}
	
	@Override 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception 
	{ 
		 
		Map<String, Object> resultMap = adminNoticeDAO.selectBoardDetail(map); 
		return resultMap; 
	}
	
	@Override 
	public void insertBoard(Map<String, Object> map) throws Exception 
	{ 
		adminNoticeDAO.insertBoard(map); 
	}
	
	@Override public void updateBoard(Map<String, Object> map) throws Exception
	{ 
		adminNoticeDAO.updateBoard(map); 
	}
	
	@Override 
	public void deleteBoard(Map<String, Object> map) throws Exception 
	{ 
		adminNoticeDAO.deleteBoard(map); 
	}
}
