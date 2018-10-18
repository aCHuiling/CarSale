package com.zgc.tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExceptionFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain filtChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		try {
			filtChain.doFilter(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			HttpServletResponse res= (HttpServletResponse) resp;
			HttpServletRequest request=(HttpServletRequest) req;
			res.sendRedirect(request.getContextPath()+"/error.html");
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
