package noom.common.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import noom.admin.service.AdminFaqService;
import noom.admin.service.AdminNoticeService;
import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;

@Controller
@RequestMapping(value="/home")
public class HomeController 
{
	@Resource(name="adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	@Resource(name="adminFaqService")
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/openHome", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openHome(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/home/home");
		
		return mv; 
		
	}
	
	@RequestMapping(value="/ntList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView rvList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		//전체 게시물 레코드의 갯수
		int count = adminNoticeService.boardListGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String,Object>> list = adminNoticeService.selectBoardList(commandMap, start, end, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv=new ModelAndView("/cs/mbnotice");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/ntOpenDetail", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardDetail(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("/cs/mbnoticedetail"); 
		Map<String,Object> NTMAP = adminNoticeService.selectBoardDetail(commandMap.getMap()); 
		NTMAP.put("curPage", curPage);
		NTMAP.put("searchType", searchType);
		NTMAP.put("searchWord", searchWord);
		mv.addObject("NTMAP", NTMAP);
		
		return mv; 
	}
	
	@RequestMapping(value="/faqList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView faqList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		//전체 게시물 레코드의 갯수
		int count = adminFaqService.boardListGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String,Object>> list = adminFaqService.selectBoardList(commandMap, start, end, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv=new ModelAndView("/cs/mbfaq");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/gymOpenDetail", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openGymDetail(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("/cs/mbnoticedetail"); 
		Map<String,Object> NTMAP = adminNoticeService.selectBoardDetail(commandMap.getMap()); 
		NTMAP.put("curPage", curPage);
		NTMAP.put("searchType", searchType);
		NTMAP.put("searchWord", searchWord);
		mv.addObject("NTMAP", NTMAP);
		
		return mv; 
	}
}
