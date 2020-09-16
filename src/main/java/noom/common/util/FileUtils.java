package noom.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils 
{
	private static final String filePath = "D:\\MJ54\\STS\\noom3\\src\\main\\webapp\\gymfile\\"; 
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception
	{ 
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		
		MultipartFile multipartFile = null; 
		String FILE_NAME = null; 
		
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		
		String GY_NUM = (String)map.get("GY_NUM");

		
		File file = new File(filePath); 
		if(file.exists() == false)
		{ 
			file.mkdirs(); 
		} 
		
		while(iterator.hasNext())
		{ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false)
			{ 
				FILE_NAME = multipartFile.getOriginalFilename();
				 
				
				file = new File(filePath + FILE_NAME); 
				multipartFile.transferTo(file); 
				listMap = new HashMap<String,Object>();
				listMap.put("GY_NUM", GY_NUM); 
				listMap.put("FILE_NAME", FILE_NAME);
				list.add(listMap); 
			} 
		} 
		return list; 
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception
	{ 
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		
		MultipartFile multipartFile = null; 
		String FILE_NAME = null; 
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		
		String GY_NUM = (String)map.get("GY_NUM"); 
		String requestName = null; 
		String FILE_NUM = null; 
		
		while(iterator.hasNext())
		{ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false)
			{ 
				FILE_NAME = multipartFile.getOriginalFilename();
				
				multipartFile.transferTo(new File(filePath + FILE_NAME)); 
				
				listMap = new HashMap<String,Object>(); 
				listMap.put("IS_NEW", "Y"); 
				listMap.put("GY_NUM", GY_NUM); 
				listMap.put("FILE_NAME", FILE_NAME); 
				list.add(listMap); 
			} 
			else
			{ 
				requestName = multipartFile.getName(); 
				FILE_NUM = "FILE_NUM_"+requestName.substring(requestName.indexOf("_")+1); 
				
				if(map.containsKey(FILE_NUM) == true && map.get(FILE_NUM) != null)
				{ 
					listMap = new HashMap<String,Object>(); 
					listMap.put("IS_NEW", "N"); 
					listMap.put("FILE_IDX", map.get(FILE_NUM)); 
					list.add(listMap); 
				} 
			} 
		} 
		
		return list; 
	}


}
