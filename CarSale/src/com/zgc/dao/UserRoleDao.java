package com.zgc.dao;
import com.zgc.model.UserRole;
import java.util.*;
import java.lang.Exception;

public interface UserRoleDao 
{


public List<UserRole> getAllUserRole(UserRole userRole);

public UserRole getUserRoleByUserRole(UserRole userRole);

public int addUserRole(UserRole userRole)throws Exception ;

public int updateUserRole(UserRole userRole)throws Exception ;

public int delUserRole(UserRole userRole)throws Exception ;


}