package noom.mapview.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.mapview.dao.ViewDAO;


@Service("viewService")
public class ViewServiceImpl implements ViewService
{
	@Resource(name="viewDAO")
	private ViewDAO viewDAO;
	
	@Override
	public List<Map<String, Object>> selectGymList(Map<String, Object> map, int start, int end, String searchWord) throws Exception
	{
		return viewDAO.selectGymList(map, start, end, searchWord);
	}
	
	@Override 
	public int gymListGetCount(String searchWord) throws Exception 
	{ 
		return viewDAO.gymListGetCount(searchWord); 
	}

	@Override 
	public Map<String, Object> selectGymDetail(Map<String, Object> map) throws Exception 
	{ 
		Map<String, Object> resultMap = new HashMap<String,Object>();

		Map<String, Object> tempMap = viewDAO.selectGymDetail(map); 
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = viewDAO.selectFileList(map); 
		resultMap.put("list", list);

		
		return resultMap; 
	}
}