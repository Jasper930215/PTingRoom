package noom.coupon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;
import noom.coupon.cpcode.CpCode;
import noom.coupon.service.CouponService;


@Controller
@RequestMapping(value="/cp")
public class CouponController 
{
	@Resource(name="couponService")
	private CouponService couponService;
	
	@RequestMapping(value = "/mbOpenCpDown", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openSign(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/home/cpdown");

		return mv;

	}
	
	
	
	@RequestMapping(value="/cpget", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView cpget(CommandMap commandMap) throws Exception
	{ 
		
		CpCode cpcode = new CpCode();
		
		String[] getcp = cpcode.couponnum();
		commandMap.put("CPN_CODE", getcp[0]);
		
		couponService.cpget(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/home/cpdown");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/checkcp", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public int checkcp(CommandMap commandMap, HttpServletRequest request) throws Exception
	{
		commandMap.putAll((Map<? extends String, ? extends Object>) request.getSession().getAttribute("loginInfo"));
		System.out.println(commandMap.getMap());
		int checkResult = couponService.checkcp(commandMap.getMap());

		return checkResult;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cplistM", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView cpList_M(Map<String, Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage, HttpServletRequest request) throws Exception
	{ 
		
		commandMap.putAll((Map<? extends String, ? extends Object>) request.getSession().getAttribute("loginInfo"));
		Map<String, Object> code = new HashMap<String, Object>();
		code.put("MB_CODE", commandMap.get("MB_CODE"));
		System.out.println("commandMap : "+code);
		//전체 게시물 레코드의 갯수
		int count = couponService.cplistMGetCount(code);
		System.out.println("count : "+ count);
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		ModelAndView mv = new ModelAndView("/mypage/coupon_M");
		
		List<Map<String,Object>> list_Cpm = couponService.selectCpm(commandMap, start, end);
		/*
		 * for (Map<String, Object> autoR: list_Cpm) {
		 * 
		 * autoR.put("Nick", session.getAttribute("userNick"));
		 * System.out.println("--autoR--: "+autoR); couponService.autoreject(autoR); }
		 */
		list_Cpm = couponService.selectCpm(commandMap, start, end);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list_Cpm", list_Cpm);
		map.put("count",count);
		map.put("paging",paging);
		System.out.println("-----map----: "+map);
		System.out.println("========list=======:"+ list_Cpm);
		System.out.println("========count=======:"+ count);
		System.out.println("========paging=======:"+ paging);
				
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/cprequest", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView request(CommandMap commandMap) throws Exception
	{ 
		
		
		System.out.println("------request code-------"+commandMap.getMap());
		couponService.request(commandMap.getMap()); 
		ModelAndView mv = new ModelAndView("redirect:/cp/cplistM"); 
		return mv; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cplistA", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView cpList_A(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="NAME")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		
		//전체 게시물 레코드의 갯수
		int count = couponService.cplistAGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		ModelAndView mv = new ModelAndView("/admin/coupon_A");
		
		List<Map<String,Object>> list_Cpa = couponService.selectCpa(commandMap, start, end, searchType, searchWord);
		
		
		  for (Map<String, Object> autoE: list_Cpa) 
		  {
			  System.out.println("--autoE--: "+autoE); 
			  couponService.expire(autoE); 
		  }
		 
		list_Cpa = couponService.selectCpa(commandMap, start, end, searchType, searchWord);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list_Cpa", list_Cpa);
		map.put("count",count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging",paging);
		System.out.println("-----map----: "+map);
		System.out.println("========list=======:"+ list_Cpa);
		System.out.println("========count=======:"+ count);
		System.out.println("========paging=======:"+ paging);
				
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/cppermit", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView permit(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/cp/cplistA"); 
		
		System.out.println("------permit code-------"+commandMap.getMap());
		couponService.permit(commandMap.getMap()); 
		
		return mv; 
	}
	
	@RequestMapping(value="/cpreject", method = {RequestMethod.POST, RequestMethod.GET} ) 
	public ModelAndView reject(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/cp/cplistA"); 
		
		System.out.println("------reject code-------"+commandMap.getMap());
		couponService.reject(commandMap.getMap()); 
		
		return mv; 
	}
}

