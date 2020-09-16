package noom.coupon.service;

import java.util.List;
import java.util.Map;

import noom.common.common.CommandMap;

public interface CouponService 
{
	int checkcp(Map<String, Object> map) throws Exception;
	void cpget(Map<String, Object> map) throws Exception;
	int cplistMGetCount(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectCpm(Map<String, Object> map, int start, int end) throws Exception;
	void request(Map<String, Object> map) throws Exception;
	int cplistAGetCount(String searchType, String searchWord) throws Exception;
	List<Map<String, Object>> selectCpa(Map<String, Object> map, int start, int end, String searchType, String searchWord) throws Exception;
	void expire(Map<String, Object> map) throws Exception;
	void permit(Map<String, Object> map) throws Exception;
	void reject(Map<String, Object> map) throws Exception;
}
