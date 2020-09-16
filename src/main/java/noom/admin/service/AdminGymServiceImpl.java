package noom.admin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import noom.admin.dao.AdminGymDAO;
import noom.common.util.FileUtils;


@Service("adminGymService")
public class AdminGymServiceImpl implements AdminGymService
{
	Log log = LogFactory.getLog(AdminGymServiceImpl.class);
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="adminGymDAO")
	private AdminGymDAO adminGymDAO;
	
	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return adminGymDAO.selectBoardList(map, start, end, searchType, searchWord);
	}
	
	@Override 
	public int boardListGetCount(String searchType, String searchWord) throws Exception 
	{ 
		return adminGymDAO.boardListGetCount(searchType, searchWord); 
	}
	
	@Override
	public void insertGym(Map<String, Object> map, HttpServletRequest request) throws Exception
	{
		adminGymDAO.insertGym(map);

		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request); 
		
		for(int i=0, size=list.size(); i<size; i++)
		{ 
			System.out.println("--file--: "+ list.get(i));
			adminGymDAO.insertFile(list.get(i)); 
		}
	}
	
	@Override 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception 
	{ 
		Map<String, Object> resultMap = new HashMap<String,Object>();

		Map<String, Object> tempMap = adminGymDAO.selectBoardDetail(map); 
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = adminGymDAO.selectFileList(map); 
		resultMap.put("list", list);

		
		return resultMap; 
	}
	
	@Override 
	public void deleteBoard(Map<String, Object> map) throws Exception 
	{ 
		adminGymDAO.deleteBoard(map); 
	}
	
	/*
	 * @Override public void updateBoard(Map<String, Object> map, HttpServletRequest
	 * request) throws Exception { adminGymDAO.updateBoard(map);
	 * adminGymDAO.deleteFileList(map); List<Map<String,Object>> list =
	 * fileUtils.parseUpdateFileInfo(map, request); Map<String,Object> tempMap =
	 * null; for(int i=0, size=list.size(); i<size; i++) { tempMap = list.get(i);
	 * if(tempMap.get("IS_NEW").equals("Y")) { adminGymDAO.insertFile(tempMap); }
	 * else { adminGymDAO.updateFile(tempMap); } } }
	 */

}
