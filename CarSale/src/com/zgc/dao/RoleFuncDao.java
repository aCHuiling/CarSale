package com.zgc.dao;
import com.zgc.model.RoleFunc;
import java.util.*;
import java.lang.Exception;

public interface RoleFuncDao 
{


public List<RoleFunc> getAllRoleFunc(RoleFunc roleFunc);

public RoleFunc getRoleFuncByRoleFunc(RoleFunc roleFunc);

public int addRoleFunc(RoleFunc roleFunc)throws Exception ;

public int updateRoleFunc(RoleFunc roleFunc)throws Exception ;

public int delRoleFunc(RoleFunc roleFunc)throws Exception ;


}