package com.zgc.model;
import java.lang.String;
import java.util.Date;

public class Importbill extends BaseModel
{

private String importbillid;
private long merchbillid;
private Double importprice;
private int quantity;
private Double totalmoney;
private Date importdate;
private String impothers;
private String impstatus;
private Merchbill merchbill;
private String merchname;
//修改前进货数量
private int preimportnum;





public String getMerchname() {
	return merchname;
}

public void setMerchname(String merchname) {
	this.merchname = merchname;
}

public int getPreimportnum() {
	return preimportnum;
}

public Importbill setPreimportnum(int preimportnum) {
	this.preimportnum = preimportnum;
	return this;
}

public Merchbill getMerchbill() {
	return merchbill;
}

public void setMerchbill(Merchbill merchbill) {
	this.merchbill = merchbill;
}

public String getImpstatus() {
	return impstatus;
}

public Importbill setImpstatus(String impstatus) {
	this.impstatus = impstatus;
	return this;
}

public String getImportbillid()
{

return this.importbillid;
}

public Importbill setImportbillid(String importbillid)
{

this.importbillid=importbillid;
return this;
}

public long getMerchbillid()
{

return this.merchbillid;
}

public Importbill setMerchbillid(long merchbillid)
{

this.merchbillid=merchbillid;
return this;
}

public Double getImportprice()
{

return this.importprice;
}

public Importbill setImportprice(Double importprice)
{
this.importprice=importprice;
return this;
}

public int getQuantity()
{

return this.quantity;
}

public Importbill setQuantity(int quantity)
{

this.quantity=quantity;
return this;
}

public Double getTotalmoney()
{

return this.totalmoney;
}

public Importbill setTotalmoney(Double totalmoney)
{

this.totalmoney=totalmoney;
return this;
}

public Date getImportdate()
{

return this.importdate;
}

public Importbill setImportdate(Date importdate)
{

this.importdate=importdate;
return this;
}

public String getImpothers()
{

return this.impothers;
}

public Importbill setImpothers(String impothers)
{

this.impothers=impothers;
return this;
}

public Importbill(String importbillid,long merchbillid,Double importprice,int quantity,Double totalmoney,Date importdate,String impothers,String impstatus)
{
this.importbillid=importbillid;
this.merchbillid=merchbillid;
this.importprice=importprice;
this.quantity=quantity;
this.totalmoney=totalmoney;
this.importdate=importdate;
this.impothers=impothers;
this.impstatus=impstatus;
}
public Importbill()
{
}

}