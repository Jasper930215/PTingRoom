package noom.admin.controller;

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
import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;

@Controller
@RequestMapping(value="/admFAQ")
public class AdminFaqController 
{
	@Resource(name="adminFaqService")
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/faqList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView rvList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
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
		
		ModelAndView mv=new ModelAndView("/admin/faq");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/faqOpenWrite", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faqwrite");
		
		return mv; 
	}
	
	@RequestMapping(value="/faqInsert", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/admFAQ/faqList"); 
		adminFaqService.insertBoard(commandMap.getMap());
		return mv; 
	}
	
	@RequestMapping(value="/faqOpenUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception
	{ 
		
		ModelAndView mv = new ModelAndView("/admin/faqupdate"); 
		Map<String,Object> FAQMAP = adminFaqService.selectBoardDetail(commandMap.getMap()); 
		
		
		mv.addObject("FAQMAP", FAQMAP); 
		return mv; 
	} 
	
	@RequestMapping(value="/faqUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/admFAQ/faqList"); 
		adminFaqService.updateBoard(commandMap.getMap()); 
		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM")); 
		return mv; 
	}
	
	@RequestMapping(value="/faqDelete", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/admFAQ/faqList"); 
		adminFaqService.deleteBoard(commandMap.getMap()); 
		return mv; 
	}
}
