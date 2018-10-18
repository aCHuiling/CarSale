package com.zgc.manage.impl;
import com.zgc.dao.SysFunctionDao;
import com.zgc.manage.SysFunctionManage;
import com.zgc.model.SysFunction;
import com.zgc.model.Userbill;

import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class SysFunctionManageImpl implements SysFunctionManage 
{

	@Autowired
	private SysFunctionDao dao;
	
public List<SysFunction> getAllSysFunction(SysFunction sysFunction)
{

return dao.getAllSysFunction(sysFunction);
}

public SysFunction getSysFunctionBySysFunction(SysFunction sysFunction)
{

return null;
}

public boolean addSysFunction(SysFunction sysFunction)throws Exception 
{

return false;
}

public boolean updateSysFunction(SysFunction sysFunction)throws Exception 
{

return false;
}

public boolean delSysFunction(SysFunction sysFunction)throws Exception 
{

return false;
}

public List<SysFunction> getAllFuncByUser(Userbill userModel) {
	// TODO Auto-generated method stub	
	List<SysFunction> allSysFunction=getFuncByParentId(0, userModel);

return allSysFunction;
}

public List<SysFunction> getFuncByParentId(long parentid,Userbill userModel){
	if(parentid==0){
		//父级id为0（一级）的功能集合
		List<SysFunction> sysFuncList=dao.getAllFuncByUser(userModel.setParentid(parentid));
		for (int i = 0; i <sysFuncList.size(); i++) {
			System.out.println("功能标题："+sysFuncList.get(i).getFunctitle());
		}
		List<SysFunction> newSysFunc=new ArrayList<SysFunction>();
		for(int i=0;i<sysFuncList.size();i++){
			newSysFunc.add(sysFuncList.get(i));
			//对应的二级的功能集合
			List<SysFunction> childFunction=getFuncByParentId(sysFuncList.get(i).getRowid(), userModel);
			newSysFunc.addAll(childFunction);
		}
		return newSysFunc;
	}
	else{
		
		List<SysFunction> funcList=dao.getAllFuncByUser(userModel.setParentid(parentid));
		if(funcList.size()>0){
			List<SysFunction> newSysFunc=new ArrayList<SysFunction>();
			for(int i=0;i<funcList.size();i++){
				newSysFunc.add(funcList.get(i));
				List<SysFunction> childFunction=getFuncByParentId(funcList.get(i).getRowid(),userModel);
				newSysFunc.addAll(childFunction);
			}
			funcList=newSysFunc;
		}
		return funcList;
	}
	
}

}