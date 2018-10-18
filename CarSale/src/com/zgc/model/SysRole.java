package com.zgc.model;
import java.util.Date;
import java.lang.String;

public class SysRole extends BaseModel
{

private long rowid;
private long createdby;
private Date createdtime;
private long last_upd_by;
private Date last_upd_time;
private String funcname;
private String rolename;
private String rolecode;
private String status;
private int[] function_ids;
private String[] idArray;



public String[] getIdArray() {
	return idArray;
}

public SysRole setIdArray(String[] idArray) {
	this.idArray = idArray;
	return this;
}

public int[] getFunction_ids() {
	return function_ids;
}

public void setFunction_ids(int[] function_ids) {
	this.function_ids = function_ids;
}

public long getRowid()
{

return this.rowid;
}

public SysRole setRowid(long rowid)
{

this.rowid=rowid;
return this;
}

public long getCreatedby()
{

return this.createdby;
}

public SysRole setCreatedby(long createdby)
{

this.createdby=createdby;
return this;
}

public Date getCreatedtime()
{

return this.createdtime;
}

public SysRole setCreatedtime(Date createdtime)
{

this.createdtime=createdtime;
return this;
}

public long getLast_upd_by()
{

return this.last_upd_by;
}

public SysRole setLast_upd_by(long last_upd_by)
{

this.last_upd_by=last_upd_by;
return this;
}

public Date getLast_upd_time()
{

return this.last_upd_time;
}

public SysRole setLast_upd_time(Date last_upd_time)
{

this.last_upd_time=last_upd_time;
return this;
}

public String getFuncname()
{

return this.funcname;
}

public SysRole setFuncname(String funcname)
{

this.funcname=funcname;
return this;
}

public String getRolename()
{

return this.rolename;
}

public SysRole setRolename(String rolename)
{

this.rolename=rolename;
return this;
}

public String getRolecode()
{

return this.rolecode;
}

public SysRole setRolecode(String rolecode)
{

this.rolecode=rolecode;
return this;
}

public String getStatus()
{

return this.status;
}

public SysRole setStatus(String status)
{

this.status=status;
return this;
}

public SysRole(long rowid,long createdby,Date createdtime,long last_upd_by,Date last_upd_time,String funcname,String rolename,String rolecode,String status)
{
this.rowid=rowid;
this.createdby=createdby;
this.createdtime=createdtime;
this.last_upd_by=last_upd_by;
this.last_upd_time=last_upd_time;
this.funcname=funcname;
this.rolename=rolename;
this.rolecode=rolecode;
this.status=status;

}
public SysRole()
{
}

}