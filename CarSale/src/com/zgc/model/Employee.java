package com.zgc.model;
import java.lang.String;
import java.util.Date;


public class Employee extends BaseModel
{

private long staffid;
private String name;
private String sex;
private String home;
private String diploma;
private String empkind;
private int salary;
private String phone;
private String adress;
private String idcard;
private Date begindate;
private String empothers;
private String isexists;



public String getIsexists() {
	return isexists;
}

public void setIsexists(String isexists) {
	this.isexists = isexists;
}

public long getStaffid()
{

return this.staffid;
}

public Employee setStaffid(long staffid)
{

this.staffid=staffid;
return this;
}

public String getName()
{

return this.name;
}

public Employee setName(String name)
{

this.name=name;
return this;
}

public String getSex()
{

return this.sex;
}

public Employee setSex(String sex)
{

this.sex=sex;
return this;
}

public String getHome()
{

return this.home;
}

public Employee setHome(String home)
{

this.home=home;
return this;
}

public String getDiploma()
{

return this.diploma;
}

public Employee setDiploma(String diploma)
{

this.diploma=diploma;
return this;
}

public String getEmpkind()
{

return this.empkind;
}

public Employee setEmpkind(String empkind)
{

this.empkind=empkind;
return this;
}

public int getSalary()
{

return this.salary;
}

public Employee setSalary(int salary)
{

this.salary=salary;
return this;
}

public String getPhone()
{

return this.phone;
}

public Employee setPhone(String phone)
{

this.phone=phone;
return this;
}

public String getAdress()
{

return this.adress;
}

public Employee setAdress(String adress)
{

this.adress=adress;
return this;
}

public String getIdcard()
{

return this.idcard;
}

public Employee setIdcard(String idcard)
{

this.idcard=idcard;
return this;
}

public Date getBegindate()
{

return this.begindate;
}

public Employee setBegindate(Date begindate)
{

this.begindate=begindate;
return this;
}

public String getEmpothers()
{

return this.empothers;
}

public Employee setEmpothers(String empothers)
{

this.empothers=empothers;
return this;
}

public Employee(long staffid,String name,String sex,String home,String diploma,String empkind,int salary,String phone,String adress,String idcard,Date begindate,String empothers,String isexists)
{
this.staffid=staffid;
this.name=name;
this.sex=sex;
this.home=home;
this.diploma=diploma;
this.empkind=empkind;
this.salary=salary;
this.phone=phone;
this.adress=adress;
this.idcard=idcard;
this.begindate=begindate;
this.empothers=empothers;
this.isexists=isexists;

}
public Employee()
{
}

}