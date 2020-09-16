package noom.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import noom.admin.service.AdminMemberService;
import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;

@Controller
@RequestMapping(value = "/admMB")
public class AdminMemberController 
{
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	/* 일반회원리스트 */
	@RequestMapping(value="/mbOpenList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openHome(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="Name")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		Object listCount = adminMemberService.getMemCnt(searchType, searchWord);
		String lstcount = listCount.toString();
		int count = Integer.parseInt(lstcount);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin() - 1;
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd() - 1;
		
		List<Map<String,Object>> list = adminMemberService.selectMemList(commandMap, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		System.out.println("--map--:"+map);
		ModelAndView mv = new ModelAndView("/admin/memberlist");
		mv.addObject("map", map);
		mv.addObject("start", start);
		mv.addObject("end", end);
		
		return mv; 
		
	}
	
	/* 탈퇴회원리스트 */
	@RequestMapping(value="/withdraw", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openWdList(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="Name")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		Object listCount = adminMemberService.getWdCnt(searchType, searchWord);
		String lstcount = listCount.toString();
		int count = Integer.parseInt(lstcount);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin() -1;
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd() -1;
		
		List<Map<String,Object>> list = adminMemberService.selectWdList(commandMap, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		System.out.println("============ withdraw data check : " + list);
		
		ModelAndView mv = new ModelAndView("/admin/memberlist");
		mv.addObject("map", map);
		mv.addObject("start", start);
		mv.addObject("end", end);
		
		return mv; 
		
	}
	@RequestMapping(value="/memInfo", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberDetail(CommandMap commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> memberInfo = adminMemberService.selectMemInfo(commandMap.getMap());
		System.out.println("===================== memInfo controller : " + commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);
		mv.setViewName("/admin/memberdetail");
		
		return mv;
	}
	@RequestMapping(value="/updateStatus", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateMemStatus(CommandMap commandMap) throws Exception
	{
		adminMemberService.updateMemStat(commandMap.getMap());
		System.out.println("=================== controller : " + commandMap.getMap());
		Map<String,Object> getCode = commandMap.getMap();
		System.out.println("=================== updateStat map(code) : " + getCode.get("code"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admMB/memInfo?MB_CODE=" + getCode.get("code"));
		
		return mv;
	}
	@RequestMapping(value="/updateLoWei", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateLoWeight(CommandMap commandMap) throws Exception
	{
		adminMemberService.updateLoWeight(commandMap.getMap());
		Map<String,Object> getCode = commandMap.getMap();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admMB/memInfo?MB_CODE=" + getCode.get("code"));
		
		return mv;
	}
	
}
