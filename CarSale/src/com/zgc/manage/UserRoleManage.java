package com.zgc.manage;
import com.zgc.model.UserRole;
import com.zgc.model.Userbill;

import java.util.*;
import java.lang.Exception;

public interface UserRoleManage 
{


public List<UserRole> getAllUserRole(UserRole userRole);

public UserRole getUserRoleByUserRole(UserRole userRole);

public boolean addUserRole(UserRole userRole)throws Exception ;

public boolean updateUserRole(UserRole userRole)throws Exception ;

public boolean delUserRole(UserRole userRole)throws Exception ;

public boolean updateUserRoleByUser(Userbill user)throws Exception;


}