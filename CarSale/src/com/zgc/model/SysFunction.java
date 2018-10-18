package com.zgc.model;
import java.lang.String;
import java.util.Date;


public class SysFunction 
{

private long rowid;
private String status;
private long createdby;
private Date createdtime;
private long last_upd_by;
private Date last_upd_time;
private String functitle;
private String funcurl;
private String funcname;
private long parentid;



public long getParentid() {
	return parentid;
}

public void setParentid(long parentid) {
	this.parentid = parentid;
}

public long getRowid()
{

return this.rowid;
}

public SysFunction setRowid(long rowid)
{

this.rowid=rowid;
return this;
}

public String getStatus()
{

return this.status;
}

public SysFunction setStatus(String status)
{

this.status=status;
return this;
}

public long getCreatedby()
{

return this.createdby;
}

public SysFunction setCreatedby(long createdby)
{

this.createdby=createdby;
return this;
}

public Date getCreatedtime()
{

return this.createdtime;
}

public SysFunction setCreatedtime(Date createdtime)
{

this.createdtime=createdtime;
return this;
}

public long getLast_upd_by()
{

return this.last_upd_by;
}

public SysFunction setLast_upd_by(long last_upd_by)
{

this.last_upd_by=last_upd_by;
return this;
}

public Date getLast_upd_time()
{

return this.last_upd_time;
}

public SysFunction setLast_upd_time(Date last_upd_time)
{

this.last_upd_time=last_upd_time;
return this;
}

public String getFunctitle()
{

return this.functitle;
}

public SysFunction setFunctitle(String functitle)
{

this.functitle=functitle;
return this;
}

public String getFuncurl()
{

return this.funcurl;
}

public SysFunction setFuncurl(String funcurl)
{

this.funcurl=funcurl;
return this;
}

public String getFuncname()
{

return this.funcname;
}

public SysFunction setFuncname(String funcname)
{

this.funcname=funcname;
return this;
}

public SysFunction(long rowid,String status,long createdby,Date createdtime,long last_upd_by,Date last_upd_time,String functitle,String funcurl,String funcname)
{
this.rowid=rowid;
this.status=status;
this.createdby=createdby;
this.createdtime=createdtime;
this.last_upd_by=last_upd_by;
this.last_upd_time=last_upd_time;
this.functitle=functitle;
this.funcurl=funcurl;
this.funcname=funcname;

}
public SysFunction()
{
}

}