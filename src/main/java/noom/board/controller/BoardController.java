package noom.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import noom.board.page.BoardPaging;
import noom.board.service.BoardService;
import noom.common.common.CommandMap;



@Controller
@RequestMapping(value="/review")
public class BoardController 
{
	Log log = LogFactory.getLog(BoardController.class); 
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/rvList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView rvList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		//전체 게시물 레코드의 갯수
		int count = boardService.boardListGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String,Object>> list = boardService.selectBoardList(commandMap, start, end, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv=new ModelAndView("/community/community");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/rvOpenWrite", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/communitywrite");
		
		return mv; 
		
	}

	@RequestMapping(value="/rvInsert", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/review/rvList"); 
		boardService.insertBoard(commandMap.getMap());
		return mv; 
	}

	@RequestMapping(value="/rvOpenDetail", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardDetail(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="TITLE")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("/community/communitydetail"); 
		Map<String,Object> RVMAP = boardService.selectBoardDetail(commandMap.getMap()); 
		RVMAP.put("curPage", curPage);
		RVMAP.put("searchType", searchType);
		RVMAP.put("searchWord", searchWord);
		mv.addObject("RVMAP", RVMAP);
		Map<String,Object> MBMAP = boardService.selectBoardDetailAdd(RVMAP); 
		
		System.out.println("MBMAP : "+MBMAP);
		mv.addObject("MBMAP", MBMAP);
		return mv; 
	}

	@RequestMapping(value="/rvOpenUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception
	{ 
		/* 세션가져오기 */
		ModelAndView mv = new ModelAndView("/community/communityupdate"); 
		Map<String,Object> RVMAP = boardService.selectBoardDetail(commandMap.getMap()); 
		
		
		mv.addObject("RVMAP", RVMAP); 
		return mv; 
	} 
	
	@RequestMapping(value="/rvUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/review/rvOpenDetail"); 
		boardService.updateBoard(commandMap.getMap()); 
		mv.addObject("RV_NUM", commandMap.get("RV_NUM")); 
		return mv; 
	}

	@RequestMapping(value="/rvDelete", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/review/rvList"); 
		boardService.deleteBoard(commandMap.getMap()); 
		return mv; 
	}

}
