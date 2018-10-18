package com.zgc.model;
import java.lang.String;

public class Merchbill extends BaseModel
{

private long merchid;
private String profferid;
private String fullname;
private String enginenumber;
private String vin;
private String color;
private String metricunit;
private String kind;
private String birthplace;
private Double unitcost;
private String others;
private String status;


public String getStatus() {
	return status;
}

public Merchbill setStatus(String status) {
	this.status = status;
	return this;
}

public long getMerchid()
{

return this.merchid;
}

public Merchbill setMerchid(long merchid)
{

this.merchid=merchid;
return this;
}

public String getProfferid()
{

return this.profferid;
}

public Merchbill setProfferid(String profferid)
{

this.profferid=profferid;
return this;
}

public String getFullname()
{

return this.fullname;
}

public Merchbill setFullname(String fullname)
{

this.fullname=fullname;
return this;
}

public String getMetricunit()
{

return this.metricunit;
}

public Merchbill setMetricunit(String metricunit)
{

this.metricunit=metricunit;
return this;
}

public String getKind()
{

return this.kind;
}

public Merchbill setKind(String kind)
{

this.kind=kind;
return this;
}

public String getBirthplace()
{

return this.birthplace;
}

public Merchbill setBirthplace(String birthplace)
{

this.birthplace=birthplace;
return this;
}

public Double getUnitcost()
{

return this.unitcost;
}

public Merchbill setUnitcost(Double unitcost)
{

this.unitcost=unitcost;
return this;
}

public String getOthers()
{

return this.others;
}

public Merchbill setOthers(String others)
{

this.others=others;
return this;
}

public String getEnginenumber() {
	return this.enginenumber;
}

public Merchbill setEnginenumber(String enginenumber) {
	this.enginenumber = enginenumber;
	return this;
}

public String getVin() {
	return this.vin;
}

public Merchbill setVin(String vin) {
	this.vin = vin;
	return this;
}

public String getColor() {
	return this.color;
}

public Merchbill setColor(String color) {
	this.color = color;
	return this;
}


public Merchbill(long merchid, String profferid, String fullname,
		String enginenumber, String vin, String color, String metricunit,
		String kind, String birthplace, Double unitcost, String others,
		String status) {
	super();
	this.merchid = merchid;
	this.profferid = profferid;
	this.fullname = fullname;
	this.enginenumber = enginenumber;
	this.vin = vin;
	this.color = color;
	this.metricunit = metricunit;
	this.kind = kind;
	this.birthplace = birthplace;
	this.unitcost = unitcost;
	this.others = others;
	this.status = status;
}

public Merchbill()
{
}

}