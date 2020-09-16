package noom.coupon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import noom.common.common.CommandMap;
import noom.coupon.dao.CouponDAO;



@Service("couponService")
public class CouponServiceImpl implements CouponService
{
	@Resource(name="couponDAO")
	private CouponDAO couponDAO;
	
	@Override
	public int checkcp(Map<String, Object> map) throws Exception
	{
		return couponDAO.checkcp(map);
	}
	
	@Override 
	public void cpget(Map<String, Object> map) throws Exception
	{ 
		couponDAO.cpget(map); 
	}
	
	@Override
	public int cplistMGetCount(Map<String, Object> map) throws Exception
	{
		return couponDAO.cplistMGetCount(map);
	}
	
	@Override
	public List<Map<String, Object>> selectCpm(Map<String, Object> map, int start, int end) throws Exception
	{
		return couponDAO.selectCpm(map, start, end);
	}
	
	@Override 
	public void request(Map<String, Object> map) throws Exception
	{ 
		couponDAO.request(map); 
	}
	
	@Override
	public int cplistAGetCount(String searchType, String searchWord) throws Exception
	{
		return couponDAO.cplistAGetCount(searchType, searchWord);
	}
	
	@Override
	public List<Map<String, Object>> selectCpa(Map<String, Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return couponDAO.selectCpa(map, start, end, searchType, searchWord );
	}
	
	@Override 
	public void expire(Map<String, Object> map) throws Exception
	{ 
		couponDAO.expire(map); 
	}
	
	@Override 
	public void permit(Map<String, Object> map) throws Exception
	{ 
		couponDAO.permit(map); 
	}
	
	@Override 
	public void reject(Map<String, Object> map) throws Exception
	{ 
		couponDAO.reject(map); 
	}
}
