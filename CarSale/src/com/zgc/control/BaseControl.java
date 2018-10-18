package com.zgc.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.InitBinder;

import com.zgc.model.BaseModel;
import com.zgc.model.PageModel;
import com.zgc.tool.Tools;

public class BaseControl {
	
	public PageModel getPageModel(HttpSession session,BaseModel model){
		PageModel page=(PageModel)session.getAttribute(Tools.PAGEMODEL);
		model.setPageModel(page);
		return page;
	}

	//给对象放值
	@InitBinder
	public void initPage(HttpSession session,HttpServletRequest req){
		PageModel page=null;
		if(session.getAttribute(Tools.PAGEMODEL)!=null)
			page=(PageModel)session.getAttribute(Tools.PAGEMODEL);
		else{
			page=new PageModel();
			session.setAttribute(Tools.PAGEMODEL, page);
		}
		//获取当前页
		int index=1;
		if(req.getParameter("pageIndex")!=null)
			index=Integer.parseInt(req.getParameter("pageIndex"));
		page.setCurrPage(index);
		//动态获取参数，当获取的参数是checkbox时可以用String[]存放
		Map<String, String[]> parmMap=req.getParameterMap();
		StringBuffer parmBuf=new StringBuffer();//StringBuffer()追加字符串
		for(String key:parmMap.keySet()){
			if("pageIndex".equals(key))
				continue;
			String[] parms=parmMap.get(key);
			for(String v:parms)	
			parmBuf.append("&"+key+"="+v);
			System.out.println("key:"+key);
		}
		req.setAttribute("parm", parmBuf.toString());
		//parmBuf默认为内存地址
		System.out.println("parmBuf:"+parmBuf);
	}
}
