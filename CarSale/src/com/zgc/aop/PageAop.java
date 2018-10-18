package com.zgc.aop;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zgc.context.PageInter;
import com.zgc.model.BaseModel;
import com.zgc.model.PageModel;
import com.zgc.tool.BaseDaoTools;
import com.zgc.tool.Tools;

@Aspect
@Component//spring自动配置
public class PageAop {

	@Pointcut("execution(public * com..*.*(..))")
	public void test(){
		
	}
	
	@Autowired
	private HttpSession session;
	@Autowired
	private BaseDaoTools daoTools;
	
	@Around("test()")
	public Object around(ProceedingJoinPoint point){
		System.out.println("intoAop");
		//System.out.println("sId:"+session.getId());
		if(point.getTarget().getClass().getInterfaces().length>0)
		//判断是否有接口，point.getTarget()找到当前实现类对象，getClass()通过对象找到类的模版（类型，对应实现类）
		//getInterfaces()获取接口，getInterfaces().length>0要么是dao要么是manage
		try {
			String className=point.getTarget().getClass().getInterfaces()[0].getName();//获取接口名称
			//获取不了manage的接口名称，需要手动写bean
			System.out.println("clName:"+className);
			if(className.indexOf("Manage")>-1){//判断是否为业务逻辑层
				BaseModel model=null;
				Object[] parms=point.getArgs();//获取方法所有参数
				for(Object parm:parms){
					if(parm instanceof BaseModel){//判断参数是否属于实体类
						model=(BaseModel) parm;//属于就转为实体类
						PageModel page=(PageModel) session.getAttribute(Tools.PAGEMODEL);
						model.setPageModel(page);//将page从session中取出对应的页面放进实体类中
						//有了PageModel page=(PageModel) session.getAttribute(Tools.PAGEMODEL);
						//model.setPageModel(page);UserControl中的getPageModel(session,user);和UserManageImpl中的tool.pageTools(user, dao, "getAllUser");就不用写了
						break;//减少循环次数
					}
				}
			   Method[] allMethod=point.getTarget().getClass().getDeclaredMethods();//获取当前对象模版的所有方法
			   String methodName=point.getSignature().getName();//获取当前切面方法名称
			   System.out.println("methodName:"+methodName+",clName:"+className);
			   for(Method m:allMethod){
				   if(m.getName().equals(methodName)){
					   if(model!=null){//判断实体类是否为空，否则会报错
						   System.out.println("isAnnotation:"+m.isAnnotationPresent(PageInter.class)+",method:"+methodName);
						   if(m.isAnnotationPresent(PageInter.class)){//是否被注解的接口使用（判断是否有注解）
							   String methName=methodName;
							   String daoName="dao";
							   PageInter pageInter=m.getAnnotation(PageInter.class);//获取注解内容
							   System.out.println("method:"+pageInter.method()+",dao:"+pageInter.daoName());
							   if(!pageInter.method().equals("same"))//判断是否有默认值
								   methName=pageInter.method();
							   if(!pageInter.daoName().equals("same"))
								   daoName=pageInter.daoName();
							  Field field=point.getTarget().getClass().getDeclaredField(daoName);//getField(daoName)获取字段（属性），如private UserDao dao;字段为dao
							  field.setAccessible(true);//私有字段得不到值，将field设置为true私有字段就可以访问
							  Object daoObj=field.get(point.getTarget());//获取字段的值，为object类型
							  daoTools.pageTools(model, daoObj, methName);
						   }
					   }
					   break;
				   }
			   }
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			Object result=point.proceed();
			return result;
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
