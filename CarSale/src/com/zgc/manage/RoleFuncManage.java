package com.zgc.manage;
import com.zgc.model.RoleFunc;
import java.util.*;
import java.lang.Exception;

public interface RoleFuncManage 
{


public List<RoleFunc> getAllRoleFunc(RoleFunc roleFunc);

public RoleFunc getRoleFuncByRoleFunc(RoleFunc roleFunc);

public boolean addRoleFunc(RoleFunc roleFunc)throws Exception ;

public boolean updateRoleFunc(RoleFunc roleFunc)throws Exception ;

public boolean delRoleFunc(RoleFunc roleFunc)throws Exception ;


}