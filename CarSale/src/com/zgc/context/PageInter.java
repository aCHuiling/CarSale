package com.zgc.context;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//自定义注解
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)//访问的级别，如果没有该注解PageAop类中的m.isAnnotationPresent(PageInter.class)访问不到（为false）
//RetentionPolicy.RUNTIME JVM会读取注解，同时会保存到class文件中
public @interface PageInter {

	public String method() default "same";
	public String daoName() default "same";
	//如果没有默认值，使用该自定义注解@PageInter时会报错
	
}
