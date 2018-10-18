package com.zgc.model;
import java.lang.String;
import java.util.Date;

public class Userbill extends BaseModel
{

private long rowid;
private String username;
private String password;
private String status;
private String ismanage;
private long createdby;
private Date createdtime;
private long last_upd_by;
private Date last_upd_time;


private Employee employee;
private String employeeName;
private String[] idArray;
private long parentid;
private String[] userRoleIds;





public String[] getUserRoleIds() {
	return userRoleIds;
}

public void setUserRoleIds(String[] userRoleIds) {
	this.userRoleIds = userRoleIds;
}

public long getParentid() {
	return parentid;
}

public Userbill setParentid(long parentid) {
	this.parentid = parentid;
	return this;
}

public String[] getIdArray() {
	return idArray;
}

public Userbill setIdArray(String[] idArray) {
	this.idArray = idArray;
	return this;
}

public String getEmployeeName() {
	return employeeName;
}

public void setEmployeeName(String employeeName) {
	this.employeeName = employeeName;
}

public Employee getEmployee() {
	return employee;
}

public void setEmployee(Employee employee) {
	this.employee = employee;
}

public long getRowid()
{

return this.rowid;
}

public Userbill setRowid(long rowid)
{

this.rowid=rowid;
return this;
}

public String getUsername()
{

return this.username;
}

public Userbill setUsername(String username)
{

this.username=username;
return this;
}

public String getPassword()
{

return this.password;
}

public Userbill setPassword(String password)
{

this.password=password;
return this;
}

public String getStatus()
{

return this.status;
}

public Userbill setStatus(String status)
{

this.status=status;
return this;
}

public String getIsmanage()
{

return this.ismanage;
}

public Userbill setIsmanage(String ismanage)
{

this.ismanage=ismanage;
return this;
}

public long getCreatedby()
{

return this.createdby;
}

public Userbill setCreatedby(long createdby)
{

this.createdby=createdby;
return this;
}

public Date getCreatedtime()
{

return this.createdtime;
}

public Userbill setCreatedtime(Date createdtime)
{

this.createdtime=createdtime;
return this;
}

public long getLast_upd_by()
{

return this.last_upd_by;
}

public Userbill setLast_upd_by(long last_upd_by)
{

this.last_upd_by=last_upd_by;
return this;
}

public Date getLast_upd_time()
{

return this.last_upd_time;
}

public Userbill setLast_upd_time(Date last_upd_time)
{

this.last_upd_time=last_upd_time;
return this;
}

public Userbill(long rowid,String username,String password,String status,String ismanage,long createdby,Date createdtime,long last_upd_by,Date last_upd_time)
{
this.rowid=rowid;
this.username=username;
this.password=password;
this.status=status;
this.ismanage=ismanage;
this.createdby=createdby;
this.createdtime=createdtime;
this.last_upd_by=last_upd_by;
this.last_upd_time=last_upd_time;

}
public Userbill()
{
}

}