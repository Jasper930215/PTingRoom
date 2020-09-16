package noom.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class MemberInterceptor extends HandlerInterceptorAdapter
{
	private Log log = LogFactory.getLog(MemberInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		try
		{
			//로그인상태가 아니면 홈으로 이동시킨다.
			if(request.getSession().getAttribute("loginInfo") == null)
			{
				//프로젝트의 Context Path명을 반환하고 그 경로에 /member/needLogin을 추가한다.
				//적용 예 >> http://localhost:8080/common/member/needLogin
				response.sendRedirect(request.getContextPath()+"/member/needLogin");
				return false;
			}
			else
			{
				return true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
	{
		super.postHandle(request, response, handler, modelAndView);
	}
}
