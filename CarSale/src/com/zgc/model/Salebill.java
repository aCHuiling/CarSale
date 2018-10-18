package com.zgc.model;
import java.lang.String;
import java.util.Date;

import org.jboss.logging.FormatWith;
import org.springframework.format.annotation.DateTimeFormat;


public class Salebill extends BaseModel
{
private Double saletotal;
private String salebillid;
private long merch;
private int salenum;
private Date saledate;
private long custid;
private long saleid;
private String salestatus;
private String salevin;



private Customsbill customs;
private Employee employee;
private String customname;
private String employeename;
//修改前销售数量
private int presalenum;

private Merchbill merchbill;
private Importbill importbill;

private Double saleCount;
private Double profitCount;
private String saledates;
private String year;
private String nowyear;
private String moth;
private String date;
private String salename;
private String custsex;
private String merchkind;




public String getSalevin() {
	return salevin;
}

public void setSalevin(String salevin) {
	this.salevin = salevin;
}

public String getMerchkind() {
	return merchkind;
}

public void setMerchkind(String merchkind) {
	this.merchkind = merchkind;
}

public String getCustsex() {
	return custsex;
}

public void setCustsex(String custsex) {
	this.custsex = custsex;
}

public String getNowyear() {
	return nowyear;
}

public void setNowyear(String nowyear) {
	this.nowyear = nowyear;
}

public String getSalename() {
	return salename;
}

public void setSalename(String salename) {
	this.salename = salename;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getMoth() {
	return moth;
}

public void setMoth(String moth) {
	this.moth = moth;
}

public String getYear() {
	return year;
}

public void setYear(String year) {
	this.year = year;
}

public Double getSaletotal() {
	return saletotal;
}

public void setSaletotal(Double saletotal) {
	this.saletotal = saletotal;
}

public String getSaledates() {
	return saledates;
}

public void setSaledates(String saledates) {
	this.saledates = saledates;
}

public Double getSaleCount() {
	return saleCount;
}

public void setSaleCount(Double saleCount) {
	this.saleCount = saleCount;
}

public Double getProfitCount() {
	return profitCount;
}

public void setProfitCount(Double profitCount) {
	this.profitCount = profitCount;
}

public Merchbill getMerchbill() {
	return merchbill;
}

public void setMerchbill(Merchbill merchbill) {
	this.merchbill = merchbill;
}

public Importbill getImportbill() {
	return importbill;
}

public void setImportbill(Importbill importbill) {
	this.importbill = importbill;
}

public int getPresalenum() {
	return presalenum;
}

public Salebill setPresalenum(int presalenum) {
	this.presalenum = presalenum;
	return this;
}

public String getCustomname() {
	return customname;
}

public void setCustomname(String customname) {
	this.customname = customname;
}

public String getEmployeename() {
	return employeename;
}

public void setEmployeename(String employeename) {
	this.employeename = employeename;
}

public Customsbill getCustoms() {
	return customs;
}

public void setCustoms(Customsbill customs) {
	this.customs = customs;
}

public Employee getEmployee() {
	return employee;
}

public void setEmployee(Employee employee) {
	this.employee = employee;
}

public String getSalestatus() {
	return salestatus;
}

public Salebill setSalestatus(String salestatus) {
	this.salestatus = salestatus;
	return this;
}

public String getSalebillid()
{

return this.salebillid;
}

public Salebill setSalebillid(String salebillid)
{

this.salebillid=salebillid;
return this;
}

public long getMerch()
{

return this.merch;
}

public Salebill setMerch(long merch)
{

this.merch=merch;
return this;
}

public int getSalenum()
{

return this.salenum;
}

public Salebill setSalenum(int salenum)
{

this.salenum=salenum;
return this;
}

public Date getSaledate()
{

return this.saledate;
}

public Salebill setSaledate(Date saledate)
{

this.saledate=saledate;
return this;
}

public long getCustid()
{

return this.custid;
}

public Salebill setCustid(long custid)
{

this.custid=custid;
return this;
}

public long getSaleid()
{

return this.saleid;
}

public Salebill setSaleid(long saleid)
{

this.saleid=saleid;
return this;
}

public Salebill(String salebillid,long merch,int salenum,Date saledate,long custid,long saleid,String salestatus)
{
this.salebillid=salebillid;
this.merch=merch;
this.salenum=salenum;
this.saledate=saledate;
this.custid=custid;
this.saleid=saleid;
this.salestatus=salestatus;
}
public Salebill()
{
}

}