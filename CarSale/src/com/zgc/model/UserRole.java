package com.zgc.model;
import java.lang.String;
import java.util.Date;

public class UserRole 
{

private long userid;
private long roleid;
private String status;
private long createdby;
private Date createdtime;
private long last_upd_by;
private Date last_upd_time;

public long getUserid()
{

return this.userid;
}

public UserRole setUserid(long userid)
{

this.userid=userid;
return this;
}

public long getRoleid()
{

return this.roleid;
}

public UserRole setRoleid(long roleid)
{

this.roleid=roleid;
return this;
}

public String getStatus()
{

return this.status;
}

public UserRole setStatus(String status)
{

this.status=status;
return this;
}

public long getCreatedby()
{

return this.createdby;
}

public UserRole setCreatedby(long createdby)
{

this.createdby=createdby;
return this;
}

public Date getCreatedtime()
{

return this.createdtime;
}

public UserRole setCreatedtime(Date createdtime)
{

this.createdtime=createdtime;
return this;
}

public long getLast_upd_by()
{

return this.last_upd_by;
}

public UserRole setLast_upd_by(long last_upd_by)
{

this.last_upd_by=last_upd_by;
return this;
}

public Date getLast_upd_time()
{

return this.last_upd_time;
}

public UserRole setLast_upd_time(Date last_upd_time)
{

this.last_upd_time=last_upd_time;
return this;
}

public UserRole(long userid,long roleid,String status,long createdby,Date createdtime,long last_upd_by,Date last_upd_time)
{
this.userid=userid;
this.roleid=roleid;
this.status=status;
this.createdby=createdby;
this.createdtime=createdtime;
this.last_upd_by=last_upd_by;
this.last_upd_time=last_upd_time;

}
public UserRole()
{
}

}