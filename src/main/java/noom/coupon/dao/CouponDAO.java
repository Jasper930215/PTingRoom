package noom.coupon.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import noom.common.common.CommandMap;
import noom.common.dao.AbstractDAO;

@Repository("couponDAO")
public class CouponDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public int checkcp(Map<String, Object> map) throws Exception
	{
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("coupon.checkcp",map);
		System.out.println(resultMap);
		System.out.println("중복되는 카운트 : "+resultMap.get("RESULT"));
		
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		//중복되는 카운트 수 1 또는 0
		return result;
	}
	
	public void cpget(Map<String, Object> map) throws Exception
	{ 
		insert("coupon.cpget", map); 
	}
	
	public int cplistMGetCount(Map<String, Object> map) throws Exception
	{
		
		return Integer.parseInt(selectOne("coupon.cplistMGetCount",map).toString());
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCpm(Map<String, Object> map, int start, int end) throws Exception
	{
		map.put("START", start); 
		map.put("END", end);
		
		return (List<Map<String, Object>>)selectList("coupon.selectCpm", map);
	}

	public void request(Map<String, Object> map) throws Exception
	{ 
		update("coupon.request", map); 
	}

	public int cplistAGetCount(String searchType, String searchWord) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return Integer.parseInt(selectOne("coupon.cplistAGetCount", map).toString());
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCpa(Map<String, Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		map.put("START", start); 
		map.put("END", end);
		map.put("SEARCH_TYPE", searchType);
		map.put("SEARCH_WORD", searchWord);
		return (List<Map<String, Object>>)selectList("coupon.selectCpa", map);
	} 	
	
	public void expire(Map<String, Object> map) throws Exception
	{ 
		update("coupon.expire", map); 
	}
	
	public void permit(Map<String, Object> map) throws Exception
	{ 
		update("coupon.permit", map); 
	}
	
	public void reject(Map<String, Object> map) throws Exception
	{ 
		update("coupon.reject", map); 
	}
	
}


