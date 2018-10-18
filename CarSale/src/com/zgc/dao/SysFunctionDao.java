package com.zgc.dao;
import com.zgc.model.SysFunction;
import com.zgc.model.Userbill;

import java.util.*;
import java.lang.Exception;

public interface SysFunctionDao 
{


public List<SysFunction> getAllSysFunction(SysFunction sysFunction);

public SysFunction getSysFunctionBySysFunction(SysFunction sysFunction);

public int addSysFunction(SysFunction sysFunction)throws Exception ;

public int updateSysFunction(SysFunction sysFunction)throws Exception ;

public int delSysFunction(SysFunction sysFunction)throws Exception ;

public List<SysFunction> getAllFuncByUser(Userbill userModel);

public SysFunction getSysFunctionBySysFuncId(SysFunction sysFunction);


}