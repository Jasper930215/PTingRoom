package noom.admin.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter
{
	Log log = LogFactory.getLog(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		try
		{
			//로그인상태가 아니면 관리자로그인페이지로 이동시킨다.
			if(request.getSession().getAttribute("admloginInfo") == null)
			{
				//프로젝트의 Context Path(/common)명을 반환하고 그 경로에 /admin/needLogin 을 추가한다.
				response.sendRedirect(request.getContextPath()+"/adm/needLogin");
				return false;
			}
			else
			{
				return true;
			}
		}
		catch(Exception e)
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


