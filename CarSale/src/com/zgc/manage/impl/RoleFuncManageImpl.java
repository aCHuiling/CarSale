package com.zgc.manage.impl;
import com.zgc.dao.RoleFuncDao;
import com.zgc.manage.RoleFuncManage;
import com.zgc.model.RoleFunc;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class RoleFuncManageImpl implements RoleFuncManage 
{
	@Autowired
	private RoleFuncDao dao;


public List<RoleFunc> getAllRoleFunc(RoleFunc roleFunc)
{

return dao.getAllRoleFunc(roleFunc);
}

public RoleFunc getRoleFuncByRoleFunc(RoleFunc roleFunc)
{

return null;
}

public boolean addRoleFunc(RoleFunc roleFunc)throws Exception 
{

return false;
}

public boolean updateRoleFunc(RoleFunc roleFunc)throws Exception 
{

return false;
}

public boolean delRoleFunc(RoleFunc roleFunc)throws Exception 
{

return false;
}


}