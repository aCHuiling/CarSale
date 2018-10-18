package com.zgc.manage.impl;
import com.zgc.dao.UserRoleDao;
import com.zgc.manage.UserRoleManage;
import com.zgc.model.UserRole;
import com.zgc.model.Userbill;

import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class UserRoleManageImpl implements UserRoleManage 
{

	@Autowired
	private UserRoleDao dao;

public List<UserRole> getAllUserRole(UserRole userRole)
{

return dao.getAllUserRole(userRole);
}

public UserRole getUserRoleByUserRole(UserRole userRole)
{

return null;
}

public boolean addUserRole(UserRole userRole)throws Exception 
{

return false;
}

public boolean updateUserRole(UserRole userRole)throws Exception 
{

return false;
}

public boolean delUserRole(UserRole userRole)throws Exception 
{

return false;
}

public boolean updateUserRoleByUser(Userbill user)throws Exception {
	// TODO Auto-generated method stub
	boolean isSu=true;
	dao.delUserRole(new UserRole().setUserid(user.getRowid()));
	String[] ids=user.getUserRoleIds();
	if(ids!=null)
		for(String id:ids){
			if(!isSu)
				throw new Exception("更新失败！");
			UserRole userRole=dao.getUserRoleByUserRole(new UserRole().setRoleid(Long.parseLong(id)).setUserid(user.getRowid()));
		    if(userRole!=null){
		    	isSu=dao.updateUserRole(userRole.setStatus("1"))>0;
		    }else{
		    	isSu=dao.addUserRole(new UserRole().setCreatedby(user.getCreatedby()).setStatus("1").setCreatedtime(new Date()).setRoleid(Long.parseLong(id)).setUserid(user.getRowid()))>0;
		    }
		}
		return isSu;
}


}