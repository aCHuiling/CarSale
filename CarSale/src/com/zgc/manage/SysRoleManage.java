package com.zgc.manage;
import com.zgc.model.SysRole;
import java.util.*;
import java.lang.Exception;

public interface SysRoleManage 
{


public List<SysRole> getAllSysRole(SysRole sysRole);

public SysRole getSysRoleBySysRole(SysRole sysRole);

public boolean addSysRole(SysRole sysRole)throws Exception ;

public boolean updateSysRole(SysRole sysRole)throws Exception ;

public boolean delSysRole(SysRole sysRole)throws Exception ;

public List<SysRole> getAllSysRoleMenu(SysRole sysRole);

public boolean ckRoleByRoleName(String roleName);

public boolean ckRoleByRoleCode(String roleCode);

public boolean updateSysRoleFunc(SysRole role) throws Exception;


}