package com.zgc.manage;
import com.zgc.model.SysFunction;
import com.zgc.model.Userbill;

import java.util.*;
import java.lang.Exception;

public interface SysFunctionManage 
{


public List<SysFunction> getAllSysFunction(SysFunction sysFunction);

public SysFunction getSysFunctionBySysFunction(SysFunction sysFunction);

public boolean addSysFunction(SysFunction sysFunction)throws Exception ;

public boolean updateSysFunction(SysFunction sysFunction)throws Exception ;

public boolean delSysFunction(SysFunction sysFunction)throws Exception ;

public List<SysFunction> getAllFuncByUser(Userbill userModel);


}