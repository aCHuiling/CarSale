package com.zgc.model;
import java.lang.String;
import java.util.Date;

public class RoleFunc 
{

private long funcid;
private long roleid;
private String status;
private long createdby;
private Date createdtime;
private long last_upd_by;
private Date last_upd_time;

public long getFuncid()
{

return this.funcid;
}

public RoleFunc setFuncid(long funcid)
{

this.funcid=funcid;
return this;
}

public long getRoleid()
{

return this.roleid;
}

public RoleFunc setRoleid(long roleid)
{

this.roleid=roleid;
return this;
}

public String getStatus()
{

return this.status;
}

public RoleFunc setStatus(String status)
{

this.status=status;
return this;
}

public long getCreatedby()
{

return this.createdby;
}

public RoleFunc setCreatedby(long createdby)
{

this.createdby=createdby;
return this;
}

public Date getCreatedtime()
{

return this.createdtime;
}

public RoleFunc setCreatedtime(Date createdtime)
{

this.createdtime=createdtime;
return this;
}

public long getLast_upd_by()
{

return this.last_upd_by;
}

public RoleFunc setLast_upd_by(long last_upd_by)
{

this.last_upd_by=last_upd_by;
return this;
}

public Date getLast_upd_time()
{

return this.last_upd_time;
}

public RoleFunc setLast_upd_time(Date last_upd_time)
{

this.last_upd_time=last_upd_time;
return this;
}

public RoleFunc(long funcid,long roleid,String status,long createdby,Date createdtime,long last_upd_by,Date last_upd_time)
{
this.funcid=funcid;
this.roleid=roleid;
this.status=status;
this.createdby=createdby;
this.createdtime=createdtime;
this.last_upd_by=last_upd_by;
this.last_upd_time=last_upd_time;

}
public RoleFunc()
{
}

}