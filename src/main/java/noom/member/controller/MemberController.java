package noom.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import noom.board.service.BoardService;
import noom.common.common.CommandMap;
import noom.member.controller.MemberController;
import noom.member.mbcode.MbCode;
import noom.member.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	Log log = LogFactory.getLog(MemberController.class);

	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "/mbOpenSignUp", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openSign(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/join/join");

		return mv;

	}

	@RequestMapping(value = "/checkMbID", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public int checkMbID(CommandMap commandMap) throws Exception {
		int checkResult = memberService.selectMemberID(commandMap.getMap());

		return checkResult;
	}

	@RequestMapping(value = "/mbSignUp", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView signUp(CommandMap commandMap) throws Exception {

		MbCode mbcode = new MbCode();

		String[] getcode = mbcode.mbCode();
		commandMap.put("MB_CODE", getcode[0]);
		System.out.println("code : " + commandMap.get("MB_CODE"));

		memberService.insertMember(commandMap.getMap());

		ModelAndView mv = new ModelAndView("/join/joincomplete");
		mv.addObject("msg", "정상적으로 회원가입이 되었습니다.");

		return mv;
	}

	@RequestMapping(value = "/mbOpenSignUpAdd", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openSignAdd(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/join/joinadd");

		System.out.println(commandMap);
		List<Map<String, Object>> list_pd = memberService.selectProductList(commandMap.getMap());
		Map<String, Object> mbpd = new HashMap<String, Object>();
		mbpd.put("list_pd", list_pd);
		mbpd.put("MB_ID", commandMap.get("MB_ID"));
		mbpd.put("MB_PW", commandMap.get("MB_PW"));
		mbpd.put("MB_PHONE", commandMap.get("MB_PHONE"));
		System.out.println(mbpd);
		mv.addObject("mbpd", mbpd);
		return mv;

	}

	@RequestMapping(value = "/mbOpenSignUpAdd2", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openSignAdd2(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/join/joinadd2");

		System.out.println(commandMap);
		List<Map<String, Object>> list_pd = memberService.selectProductList(commandMap.getMap());
		Map<String, Object> mbpd = new HashMap<String, Object>();
		mbpd.put("list_pd", list_pd);
		
		System.out.println(mbpd);
		mv.addObject("mbpd", mbpd);
		return mv;

	}

	/* 로그인 */
	@RequestMapping(value = "/openLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openLogin(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		// 세션정보가 null이 아닐때
		if (request.getSession().getAttribute("loginInfo") != null) {
			String msg = "이미 로그인된 상태입니다.";
			mv.addObject("msg", msg);
			mv.setViewName("/join/loginsuccess");
		} else {
			mv.setViewName("/join/login");
		}

		return mv;
	}

	@RequestMapping(value = "/loginTry", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/join/loginsuccess");

		Map<String, Object> map = memberService.selectMemberInfo(commandMap.getMap());

		// 로그인 정보가 있다면 로그인
		if (map == null) {
			mv.addObject("msg", "로그인에 실패하였습니다.");
		} else {
			
			request.getSession().setAttribute("loginInfo", map);
			request.getSession().setMaxInactiveInterval(60 * 30);

			mv.addObject("msg", "로그인에 성공하였습니다.");
		}

		return mv;
	}

	@RequestMapping(value = "/logoutTry", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("loginInfo");

		ModelAndView mv = new ModelAndView("/join/logout");

		mv.addObject("msg", "로그아웃되었습니다.");

		return mv;
	}

	@RequestMapping(value = "/needLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView needLogin() throws Exception {
		ModelAndView mv = new ModelAndView("/join/loginwarning");
		mv.addObject("msg", "로그인 후 이용해주시기 바랍니다.");

		return mv;
	}

	@RequestMapping(value = "/openpayment", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView payment(CommandMap commandMap) throws Exception {
		MbCode mbcode = new MbCode();

		String[] getcode = mbcode.mbCode();
		commandMap.put("MB_CODE", getcode[0]);
		System.out.println("code : " + commandMap.get("MB_CODE"));
		System.out.println("--input--: " + commandMap.getMap());
		memberService.insertMemberAdd(commandMap.getMap());

		ModelAndView mv = new ModelAndView("/payment/payment");
		Map<String, Object> Price = memberService.selectPrice(commandMap.getMap());

		Map<String, Object> mbpd = new HashMap<String, Object>();
		mbpd.put("PD_NAME", commandMap.get("PD_NAME"));
		mbpd.put("PD_PRICE", Price.get("PD_PRICE"));
		mbpd.put("MB_NAME", commandMap.get("MB_NAME"));
		System.out.println("--mbpd--: " + mbpd);
		mv.addObject("mbpd", mbpd);
		return mv;

	}
	
	@RequestMapping(value = "/openpayment2", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView payment2(CommandMap commandMap) throws Exception {
		

		
		memberService.updateMemberAdd(commandMap.getMap());

		ModelAndView mv = new ModelAndView("/payment/payment");
		System.out.println("--cm--: "+commandMap.getMap());
		
		Map<String, Object> Price = memberService.selectPrice(commandMap.getMap());

		Map<String, Object> mbpd = new HashMap<String, Object>();
		mbpd.put("PD_NAME", commandMap.get("PD_NAME"));
		mbpd.put("PD_PRICE", Price.get("PD_PRICE"));
		mbpd.put("MB_NAME", commandMap.get("MB_NAME"));
		System.out.println("--mbpd--: " + mbpd);
		mv.addObject("mbpd", mbpd);
		return mv;

	}
	
	@RequestMapping(value = "/mbOpenInfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView openInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/mypage/myinfoupdate");
		commandMap.putAll((Map<? extends String, ? extends Object>) request.getSession().getAttribute("loginInfo"));
		Map<String, Object> Info = memberService.selectMemberInfo(commandMap.getMap());
		System.out.println(Info);
		mv.addObject("Info", Info);
		return mv;

	}

	@RequestMapping(value = "/mbInfoUpdate", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateInfo(CommandMap commandMap) throws Exception 
	{
		
		ModelAndView mv = new ModelAndView("/mypage/changeinfosuccess");
		
		memberService.updateInfo(commandMap.getMap());
		mv.addObject("msg", "회원정보가 정상적으로 변경되었습니다. 다시 로그인 해주세요.");
		return mv;
	}
	
	/* 회원탈퇴 */
	@RequestMapping(value="/openbye", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView openHome(CommandMap commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("/mypage/bye");
		
		return mv; 
		
	}
	
	@RequestMapping(value = "/bye", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView bye(CommandMap commandMap, HttpServletRequest request) throws Exception
	{ 
		
		System.out.println("commandMap : "+ commandMap.getMap());
		
		
		memberService.bye(commandMap.getMap());
		System.out.println(commandMap.getMap());
		int checkResult = memberService.searchMember(commandMap.getMap());
		
		if(checkResult == 0)
		{
			ModelAndView mv = new ModelAndView("/mypage/byesuccess"); 
			mv.addObject("msg", "정상적으로 탈퇴되었습니다.");
			return mv;
		}
		else
		{
			ModelAndView mv = new ModelAndView("/mypage/byefail"); 
			mv.addObject("msg", "비밀번호가 틀렸습니다.");
			return mv; 
		}
		
		
		
	}
}
