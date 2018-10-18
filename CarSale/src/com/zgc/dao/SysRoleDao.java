package com.zgc.dao;
import com.zgc.model.SysRole;
import java.util.*;
import java.lang.Exception;

public interface SysRoleDao 
{


public List<SysRole> getAllSysRole(SysRole sysRole);

public SysRole getSysRoleBySysRole(SysRole sysRole);

public int addSysRole(SysRole sysRole)throws Exception ;

public int updateSysRole(SysRole sysRole)throws Exception ;

public int delSysRole(SysRole sysRole)throws Exception ;


}