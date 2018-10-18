package com.zgc.model;


public class Storebill extends BaseModel
{

private long tomerchid;
private int storenum;
private String storestatus;
private Merchbill merchbill;



public Merchbill getMerchbill() {
	return merchbill;
}

public void setMerchbill(Merchbill merchbill) {
	this.merchbill = merchbill;
}

public String getStorestatus() {
	return storestatus;
}

public Storebill setStorestatus(String storestatus) {
	this.storestatus = storestatus;
	return this;
}

public long getTomerchid()
{

return this.tomerchid;
}

public Storebill setTomerchid(long tomerchid)
{

this.tomerchid=tomerchid;
return this;
}

public int getStorenum()
{

return this.storenum;
}

public Storebill setStorenum(int storenum)
{

this.storenum=storenum;
return this;
}

public Storebill(long tomerchid,int storenum,String storestatus)
{
this.tomerchid=tomerchid;
this.storenum=storenum;
this.storestatus=storestatus;
}
public Storebill()
{
}

}