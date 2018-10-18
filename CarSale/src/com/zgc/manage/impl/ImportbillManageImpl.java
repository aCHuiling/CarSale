package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.ImportbillDao;
import com.zgc.dao.MerchbillDao;
import com.zgc.dao.StorebillDao;
import com.zgc.manage.ImportbillManage;
import com.zgc.model.Importbill;
import com.zgc.model.Merchbill;
import com.zgc.model.Storebill;

import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class ImportbillManageImpl implements ImportbillManage 
{

	@Autowired
	private ImportbillDao dao;
	@Autowired
	private StorebillDao storebillDao;
	@Autowired
	private MerchbillDao merchbillDao;

	@PageInter
	public List<Importbill> getAllImportbill(Importbill importbill)
	{

		return dao.getAllImportbill(importbill);
	}

	public Importbill getImportbillByImportbill(Importbill importbill)
	{
		//double total=importbill.getImportprice()*importbill.getQuantity();
		return dao.getImportbillByImportbill(importbill);
	}

	public boolean addImportbill(Importbill importbill)throws Exception 
	{
		boolean isAddImp=dao.addImportbill(importbill.setImpstatus("1"))>0;
		if(isAddImp){
			boolean isAddStore=true;
			//查询车辆编号在库存中存不存在
			Storebill storeModel=storebillDao.getStorebillByStorebill(new Storebill().setTomerchid(importbill.getMerchbillid()));
			if(storeModel!=null){
				//存在的情况下就直接增加库存余量
				int addNum=(-importbill.getQuantity());//因为查询语句是减的，所以这里先把进货数量转为负数
				System.out.println("进货数量："+addNum);
				isAddStore=storebillDao.updateStorebill(new Storebill().setTomerchid(importbill.getMerchbillid()).setStorenum(addNum))>0;
			}else{
				//不存在的情况下在库存中增加信息
				isAddStore=storebillDao.addStorebill(new Storebill().setTomerchid(importbill.getMerchbillid()).setStorenum(importbill.getQuantity()).setStorestatus("1"))>0;
			}
			return isAddStore;
		}
		return false;
	}

	public boolean updateImportbill(Importbill importbill)throws Exception 
	{
		//查询车辆编号在库存中存不存在
//		Storebill storeModel=storebillDao.getStorebillByStorebill(new Storebill().setTomerchid(importbill.getMerchbillid()));
//		if(storeModel!=null){
			//如果车辆编号在库存中存在，先更新进货信息，再更新库存信息
			boolean isUpImp=dao.updateImportbill(importbill)>0;
			boolean isImport=false;
			if(isUpImp){
				int preNum=importbill.getPreimportnum();//修改前的进货数量
				System.out.println("修改前的进货数量"+preNum);
				int sufNum=importbill.getQuantity();//修改后的进货数量
				System.out.println("修改后的进货数量"+sufNum);
				int num=preNum-sufNum;
				System.out.println("修改后的进货数量-修改前的进货数量"+num);
				//修改信息成功的情况下减少或增加库存余量
				isImport=storebillDao.updateStorebill(new Storebill().setStorenum(num).setTomerchid(importbill.getMerchbillid()))>0;
			}
			return isImport;
//		}else{
//			//不存在的情况下
//			Merchbill merchbill=merchbillDao.getMerchbillByMerchbill(new Merchbill().setMerchid(importbill.getMerchbillid()));
//			boolean isAddStore=false;
//			if(merchbill!=null){
//				boolean isUpImp=dao.updateImportbill(importbill)>0;
//				if(isUpImp){
//					isAddStore=storebillDao.addStorebill(new Storebill().setTomerchid(importbill.getMerchbillid()).setStorenum(importbill.getQuantity()).setStorestatus("1"))>0;
//				}
//			}
//			return isAddStore;
//		}
	}

	public boolean delImportbill(Importbill importbill)throws Exception 
	{

		return dao.updateImportbill(importbill.setImpstatus("0"))>0;
	}


}