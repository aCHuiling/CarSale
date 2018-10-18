package com.zgc.intercept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zgc.tool.Tools;

public class UserManageIntercept extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {//前置拦截
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		if(session.getAttribute(Tools.CRRUSER)==null){
			PrintWriter out=response.getWriter();
			out.write("<script>");
			out.write("alert('用户没有登录，请登录！');");
			out.write("location.href='../index.html';");
			out.write("</script>");
			out.flush();
			out.close();
			return false;
		}
		return super.preHandle(request, response, handler);
	}
	
	

}
