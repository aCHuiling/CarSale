package com.zgc.model;
import java.lang.String;

public class Customsbill extends BaseModel
{

private long customsid;
private String custname;
private String custsex;
private int custage;
private String custphone;
private String custstatus;


public String getCuststatus() {
	return custstatus;
}

public Customsbill setCuststatus(String custstatus) {
	this.custstatus = custstatus;
	return this;
}

public long getCustomsid()
{

return this.customsid;
}

public Customsbill setCustomsid(long customsid)
{

this.customsid=customsid;
return this;
}

public String getCustname()
{

return this.custname;
}

public Customsbill setCustname(String custname)
{

this.custname=custname;
return this;
}

public String getCustsex()
{

return this.custsex;
}

public Customsbill setCustsex(String custsex)
{

this.custsex=custsex;
return this;
}

public int getCustage()
{

return this.custage;
}

public Customsbill setCustage(int custage)
{

this.custage=custage;
return this;
}

public String getCustphone()
{

return this.custphone;
}

public Customsbill setCustphone(String custphone)
{

this.custphone=custphone;
return this;
}

public Customsbill(long customsid,String custname,String custsex,int custage,String custphone,String custstatus)
{
this.customsid=customsid;
this.custname=custname;
this.custsex=custsex;
this.custage=custage;
this.custphone=custphone;
this.custstatus=custstatus;
}
public Customsbill()
{
}

}