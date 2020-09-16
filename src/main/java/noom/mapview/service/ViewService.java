package noom.mapview.service;

import java.util.List;
import java.util.Map;

public interface ViewService {
	 
	List<Map<String, Object>> selectGymList(Map<String, Object> map, int start, int end, String searchWord) throws Exception;
	int gymListGetCount(String searchWord) throws Exception;
	Map<String, Object> selectGymDetail(Map<String, Object> map) throws Exception;
	
	 
}