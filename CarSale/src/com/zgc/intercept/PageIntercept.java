package com.zgc.intercept;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zgc.model.PageModel;
import com.zgc.tool.Tools;

public class PageIntercept extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String name=request.getParameter("username");
		response.setContentType("text/html;charset=utf-8");
		//非法进入
//		if("admin".equals(name+"")){
//			System.out.println(123);
//			PrintWriter out=response.getWriter();
//			out.print("<script>");
//			out.print("alert('啊哈哈');");
//			out.print("location.href='index';");
//			out.print("</script>");
//			return false;
//		}
		
		PageModel page=(PageModel) request.getSession().getAttribute(Tools.PAGEMODEL);
		if(page!=null){
			page.setTotalPage(1);
			page.setCurrPage(1);
		}
		return true;
	}

}
