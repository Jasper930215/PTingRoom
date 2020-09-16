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

import noom.admin.service.AdminService;
import noom.board.page.BoardPaging;
import noom.common.common.CommandMap;



@Controller
@RequestMapping(value = "/adm")
public class AdminController 
{
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/openIndex", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openHome(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/admin/adminmain");
		
		return mv; 
		
	}
	/* 로그인 */
	@RequestMapping(value = "/openLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openLogin(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("--sessionb--: "+request.getSession().getAttribute("loginInfo"));
		request.getSession().removeAttribute("loginInfo");
		System.out.println("--sessiona--: "+request.getSession().getAttribute("loginInfo"));
		
		
		// 세션정보가 null이 아닐때
		if (request.getSession().getAttribute("admloginInfo") != null) 
		{
			String msg = "이미 로그인된 상태입니다.";
			mv.addObject("msg", msg);
			mv.setViewName("/admin/admloginsuccess");
		}
		else
		{
			mv.setViewName("/admin/admlogin");
		}
		/*
		 * else if(session == null) { mv.setViewName("/admin/admlogin"); }
		 */

		return mv;
	}
	
	@RequestMapping(value = "/loginTry", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request, CommandMap commandMap) throws Exception 
	{

		Map<String, Object> map = adminService.selectMemberInfo(commandMap.getMap());

		// 로그인 정보가 있다면 로그인
		if (map == null) {
			ModelAndView mv1 = new ModelAndView("/admin/admloginfail");
			mv1.addObject("msg", "로그인에 실패하였습니다.");
			return mv1;
		} else {
			ModelAndView mv2 = new ModelAndView("/admin/admloginsuccess");
			request.getSession().setAttribute("admloginInfo", map);
			request.getSession().setMaxInactiveInterval(60 * 60);

			mv2.addObject("msg", "로그인에 성공하였습니다.");
			return mv2;
		}
		
	}
	
	@RequestMapping(value = "/logoutTry", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("admloginInfo");

		ModelAndView mv = new ModelAndView("/admin/admlogout");

		mv.addObject("msg", "로그아웃되었습니다.");

		return mv;
	}
	
	@RequestMapping(value = "/needLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView needLogin() throws Exception {
		ModelAndView mv = new ModelAndView("/admin/loginwarning");
		mv.addObject("msg", "로그인 후 이용해주시기 바랍니다.");

		return mv;
	}
	
	/* 마이페이지 */
	@RequestMapping(value="/openMypage", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openMypage(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/admin/mypage_ADM");
		
		return mv; 
		
	}
	
	@RequestMapping(value = "/changePW", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView changePW(CommandMap commandMap, HttpServletRequest request) throws Exception
	{ 
		System.out.println("--session--: "+request.getSession().getAttribute("admloginInfo"));
		commandMap.putAll((Map<? extends String, ? extends Object>) request.getSession().getAttribute("admloginInfo"));
		System.out.println("--commnadMap--: "+commandMap.getMap());
		
		adminService.updatePW(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/admin/changepwsuccess"); 
		mv.addObject("msg", "비밀번호가 정상적으로 변경되었습니다. 다시 로그인 해주세요.");
		return mv; 
	}
	
	//데이터분석페이지
	@RequestMapping(value="/openCharts", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openCharts(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/admin/loading");
		
		return mv; 
		
	}
	
	/* 상품리스트,삭제 페이지 */
	@RequestMapping(value="/pdList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView rvList(HttpServletRequest request, Map<String,Object> commandMap, @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="NAME")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{
		//전체 게시물 레코드의 갯수
		int count = adminService.pdListGetCount(searchType, searchWord);
		
		BoardPaging paging = new BoardPaging(count, curPage);
		//현재 페이지 번호
		int start = paging.getPageBegin();
		//현재 페이지의 끝 번호
		int end = paging.getPageEnd();
		
		List<Map<String,Object>> list = adminService.selectPdList(commandMap, start, end, searchType, searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("paging", paging);
		
		ModelAndView mv=new ModelAndView("/admin/productlist");
		mv.addObject("map", map);
		
		return mv;
	}
	@RequestMapping(value="/pdOpenWrite", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/productwrite");
		
		return mv; 
	}
	
	@RequestMapping(value="/pdInsert", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView insertPd(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/adm/pdList"); 
		adminService.insertPd(commandMap.getMap());
		return mv; 
	}
	
	
	@RequestMapping(value="/pdOpenUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView openBoardUpdate(CommandMap commandMap,  @RequestParam(value="curPage", defaultValue="1")int curPage,
			@RequestParam(value="searchType", defaultValue="NAME")String searchType,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) throws Exception
	{ 
		
		ModelAndView mv = new ModelAndView("/admin/productupdate"); 
		Map<String,Object> PDMAP = adminService.selectPdDetail(commandMap.getMap()); 
		PDMAP.put("curPage", curPage);
		PDMAP.put("searchType", searchType);
		PDMAP.put("searchWord", searchWord);
		
		mv.addObject("PDMAP", PDMAP); 
		return mv; 
	} 
	
	
	@RequestMapping(value="/pdUpdate", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/adm/pdList"); 
		adminService.updatePd(commandMap.getMap()); 
		mv.addObject("PD_NAME", commandMap.get("PD_NAME")); 
		return mv; 
	}
	
	@RequestMapping(value="/pdDelete", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception
	{ 
		ModelAndView mv = new ModelAndView("redirect:/adm/pdList"); 
		adminService.deletePd(commandMap.getMap()); 
		return mv; 
	}
	
}
