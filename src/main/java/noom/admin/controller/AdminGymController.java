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

import noom.admin.service.AdminGymService;
import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;

@Controller
@RequestMapping(value="/gym")
public class AdminGymController 
{
	@Resource(name="adminGymService")
	private AdminGymService adminGymService;
	
	@RequestMapping(value="/gymList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView rvList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="NAME")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		//전체 게시물 레코드의 갯수
		int count = adminGymService.boardListGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String,Object>> list = adminGymService.selectBoardList(commandMap, start, end, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv=new ModelAndView("/admin/gymlist");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/gymOpenWrite", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView writeGym(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/admin/gymwrite");
		
		return mv; 
		
	}
	@RequestMapping(value = "/gymWrite", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView insertGym(CommandMap commandMap, HttpServletRequest request) throws Exception 
	{
		System.out.println("---commandMap1-- : "+ commandMap.getMap());
		

		adminGymService.insertGym(commandMap.getMap(), request); 
		
		ModelAndView mv = new ModelAndView("redirect:/gym/gymList");
		
		return mv; 
	}
	
	@RequestMapping(value="/gymOpenDetail", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardDetail(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="NAME")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		System.out.println("commandMap : "+commandMap.getMap());
		ModelAndView mv = new ModelAndView("/admin/gymdetail"); 
		Map<String,Object> GYMMAP = adminGymService.selectBoardDetail(commandMap.getMap()); 
		
		GYMMAP.put("curPage", curPage);
		GYMMAP.put("searchType", searchType);
		GYMMAP.put("searchWord", searchWord);
		System.out.println("GYMMAP : "+ GYMMAP);
		mv.addObject("GYMMAP", GYMMAP.get("map"));
		mv.addObject("curPage", GYMMAP.get("curPage"));
		mv.addObject("searchType", GYMMAP.get("searchType"));
		mv.addObject("searchWord", GYMMAP.get("searchWord"));
		return mv; 
	}
	
	/*
	 * @RequestMapping(value="/gymOpenUpdate") public ModelAndView
	 * openBoardUpdate(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/admin/gymupdate"); System.out.println("--commandMap-- : "+
	 * commandMap.getMap()); Map<String,Object> map =
	 * adminGymService.selectBoardDetail(commandMap.getMap());
	 * System.out.println("--map1-- : "+map);
	 * 
	 * mv.addObject("map", map.get("map")); System.out.println("---map2-- : "+
	 * map.get("map")); mv.addObject("list", map.get("list"));
	 * System.out.println("---list-- : "+ map.get("list")); return mv; }
	 * 
	 * @RequestMapping(value="/gymUpdate") public ModelAndView
	 * updateBoard(CommandMap commandMap, HttpServletRequest request) throws
	 * Exception { adminGymService.updateBoard(commandMap.getMap(), request);
	 * 
	 * ModelAndView mv = new ModelAndView("redirect:/gym/gymOpenDetail");
	 * 
	 * mv.addObject("FILE_NUM", commandMap.get("FILE_NUM")); return mv; }
	 * 
	 * 
	 * @RequestMapping(value="/gymDelete", method = {RequestMethod.POST,
	 * RequestMethod.GET}) public ModelAndView deleteBoard(CommandMap commandMap)
	 * throws Exception { ModelAndView mv = new
	 * ModelAndView("redirect:/gym/gymList");
	 * adminGymService.deleteBoard(commandMap.getMap()); return mv; }
	 */
}
