package com.zgc.model;
import java.lang.String;


public class Profferbill extends BaseModel
{

private String profferid;
private String fullname;
private String contactperson;
private String phone;
private String adress;
private String openingbank;
private String accountid;
private String others;
private String status;


public String getStatus() {
	return status;
}

public Profferbill setStatus(String status) {
	this.status = status;
	return this;
}

public String getProfferid()
{

return this.profferid;
}

public Profferbill setProfferid(String profferid)
{

this.profferid=profferid;
return this;
}

public String getFullname()
{

return this.fullname;
}

public Profferbill setFullname(String fullname)
{

this.fullname=fullname;
return this;
}

public String getContactperson()
{

return this.contactperson;
}

public Profferbill setContactperson(String contactperson)
{

this.contactperson=contactperson;
return this;
}

public String getPhone()
{

return this.phone;
}

public Profferbill setPhone(String phone)
{

this.phone=phone;
return this;
}

public String getAdress()
{

return this.adress;
}

public Profferbill setAdress(String adress)
{

this.adress=adress;
return this;
}

public String getOpeningbank()
{

return this.openingbank;
}

public Profferbill setOpeningbank(String openingbank)
{

this.openingbank=openingbank;
return this;
}

public String getAccountid()
{

return this.accountid;
}

public Profferbill setAccountid(String accountid)
{

this.accountid=accountid;
return this;
}

public String getOthers()
{

return this.others;
}

public Profferbill setOthers(String others)
{

this.others=others;
return this;
}

public Profferbill(String profferid,String fullname,String contactperson,String phone,String adress,String openingbank,String accountid,String others,String status)
{
this.profferid=profferid;
this.fullname=fullname;
this.contactperson=contactperson;
this.phone=phone;
this.adress=adress;
this.openingbank=openingbank;
this.accountid=accountid;
this.others=others;
this.status=status;
}
public Profferbill()
{
}

}