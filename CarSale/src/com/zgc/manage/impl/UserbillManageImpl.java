package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.UserbillDao;
import com.zgc.manage.UserbillManage;
import com.zgc.model.Userbill;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class UserbillManageImpl implements UserbillManage 
{

	@Autowired
	private UserbillDao dao;
    
	//查询所有用户
	@PageInter
	public List<Userbill> getAllUserbill(Userbill userbill)
	{

		return dao.getAllUserbill(userbill);
	}

	public Userbill getUserbillByUserbill(Userbill userbill)
	{

		return null;
	}

	//添加用户
	public boolean addUserbill(Userbill userbill)throws Exception 
	{
		boolean isSu=true;
		//根据状态和id查询用户存不存在，如果存在就更新，不存在就添加
		Userbill userModel=dao.getUserbillByUserStatus(userbill.setStatus("0"));
		if(!isSu)
			throw new Exception("添加失败！");
		if(userModel!=null){
			isSu=dao.updateUserbill(userbill.setStatus("1").setCreatedby(userbill.getRowid()).setCreatedtime(new Date()))>0;
		}else{	
			isSu=dao.addUserbill(userbill.setStatus("1").setCreatedby(userbill.getRowid()).setCreatedtime(new Date()))>0;
		}

		return isSu;
	}

	//修改用户
	public boolean updateUserbill(Userbill userbill)throws Exception 
	{

		return dao.updateUserbill(userbill)>0;
	}

	//删除用户
	public boolean delUserbill(Userbill userbill)throws Exception 
	{

		return dao.delUserbill(userbill)>0;
	}

	//登录
	public Userbill login(Userbill user) {
		// TODO Auto-generated method stub
		user.setStatus("1");
		return dao.getUserbillByUserbill(user);
	}

	//根据用户名查询用户存不存在
	public boolean ckUserByName(String userName) {
		// TODO Auto-generated method stub
		return dao.getUserbillByUserbill(new Userbill().setUsername(userName).setStatus("1"))!=null;
	}

	//查看当前个人信息，根据当前用户名所得到的id
	public Userbill getAllUserbillByEmp(Userbill user) {
		// TODO Auto-generated method stub
		return dao.getAllUserbillByEmp(user);
	}


}