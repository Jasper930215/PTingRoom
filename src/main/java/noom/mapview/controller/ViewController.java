package noom.mapview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;
import noom.mapview.service.ViewService;

@Controller
@RequestMapping(value = "/search")
public class ViewController
{
	@Resource(name="viewService")
	private ViewService viewService;

	@RequestMapping(value="/openMapList")
	public @ResponseBody ModelAndView openMapList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception 
	{
		
		int count = viewService.gymListGetCount(searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String, Object>> list = viewService.selectGymList(commandMap, start, end, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv = new ModelAndView("/map/view");
		mv.addObject("map", map);

		return mv; 

	}
	
	@RequestMapping(value="/openMapDetail", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openMapDetail(CommandMap commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		System.out.println("commandMap : "+commandMap.getMap());
		ModelAndView mv = new ModelAndView("/map/detail"); 
		Map<String,Object> GYMMAP = viewService.selectGymDetail(commandMap.getMap()); 
		
		GYMMAP.put("curPage", curPage);
		GYMMAP.put("searchWord", searchWord);
		System.out.println("GYMMAP : "+ GYMMAP);
		mv.addObject("GYMMAP", GYMMAP.get("map"));
		mv.addObject("curPage", GYMMAP.get("curPage"));
		mv.addObject("searchWord", GYMMAP.get("searchWord"));
		return mv; 
	}
}



