package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.MerchbillDao;
import com.zgc.manage.MerchbillManage;
import com.zgc.model.Merchbill;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class MerchbillManageImpl implements MerchbillManage 
{

	@Autowired
	private MerchbillDao dao;

	@PageInter
public List<Merchbill> getAllMerchbill(Merchbill merchbill)
{

return dao.getAllMerchbill(merchbill);
}

public Merchbill getMerchbillByMerchbill(Merchbill merchbill)
{

return dao.getMerchbillByMerchbill(merchbill);
}

public boolean addMerchbill(Merchbill merchbill)throws Exception 
{
boolean isSu=true;
Merchbill merchbillModel=dao.getMerchbillByMerchbill(merchbill.setStatus("0"));
if(merchbillModel!=null){
	isSu=dao.updateMerchbill(merchbill.setStatus("1").setMerchid(merchbillModel.getMerchid()))>0;
}else{
	isSu=dao.addMerchbill(merchbill.setStatus("1"))>0;
}
return isSu;
}

public boolean updateMerchbill(Merchbill merchbill)throws Exception 
{

return dao.updateMerchbill(merchbill)>0;
}

public boolean delMerchbill(Merchbill merchbill)throws Exception 
{

return dao.updateMerchbill(merchbill)>0;
}

public List<Merchbill> getAllMerchbillId(Merchbill merch) {
	// TODO Auto-generated method stub
	return dao.getAllMerchbill(merch);
}

public boolean ckMerchByEnginenumber(Merchbill setEnginenumber) {
	// TODO Auto-generated method stub
	return dao.getMerchbillByMerchbill(setEnginenumber)!=null;
}

public boolean ckMerchByVin(Merchbill setVin) {
	// TODO Auto-generated method stub
	return dao.getMerchbillByMerchbill(setVin)!=null;
}

}