package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.SalebillDao;
import com.zgc.dao.StorebillDao;
import com.zgc.manage.SalebillManage;
import com.zgc.model.Salebill;
import com.zgc.model.Storebill;

import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class SalebillManageImpl implements SalebillManage 
{

	
	@Autowired
	private SalebillDao dao;
	@Autowired
	private StorebillDao storeDao;
	
@PageInter
public List<Salebill> getAllSalebill(Salebill salebill)
{
return dao.getAllSalebill(salebill);
}

public Salebill getSalebillBySalebill(Salebill salebill)
{

return dao.getSalebillBySalebill(salebill);
}

public boolean addSalebill(Salebill salebill)throws Exception 
{
	boolean isStore=false;
	//查询库存余量（根据库存数量即修改的销售数量和车辆编号即销售车辆编号）
	Storebill storeModel=storeDao.getStorebillByStorebill(new Storebill().setStorenum(salebill.getSalenum()).setTomerchid(salebill.getMerch()));
	System.out.println("******************库存"+storeModel);
	if(storeModel!=null){
		//库存余量足够的情况下添加销售信息
		boolean isSu=dao.addSalebill(salebill.setSalestatus("1"))>0;
		System.out.println("*******************添加销售"+isSu);
		if(isSu){
			//添加销售信息成功的情况下减少库存余量
			isStore=storeDao.updateStorebill(new Storebill().setStorenum(salebill.getSalenum()).setTomerchid(salebill.getMerch()))>0;
		    System.out.println("****************减少库存"+isStore);
		    return isStore;
		}
		
	}
	return isStore;
	
}

public boolean updateSalebill(Salebill salebill)throws Exception 
{
	boolean isStore=false;
	//查询库存余量（根据库存数量即修改的销售数量和车辆编号即销售车辆编号）
	Storebill storeModel=storeDao.getStorebillByStorebill(new Storebill().setStorenum(salebill.getSalenum()).setTomerchid(salebill.getMerch()));
	System.out.println("******************库存"+storeModel);
	if(storeModel!=null){
		//库存余量足够的情况下添加销售信息
		boolean isSu=dao.updateSalebill(salebill)>0;
		System.out.println("*******************添加销售"+isSu);
		if(isSu){
			int preNum=salebill.getPresalenum();//修改前的销售数量
			System.out.println("修改前的销售数量"+preNum);
			int sufNum=salebill.getSalenum();//修改后的销售数量
			System.out.println("修改后的销售数量"+sufNum);
			int num=sufNum-preNum;
			System.out.println("修改后的销售数量-修改前的销售数量"+num);
			//修改信息成功的情况下减少或增加库存余量
			isStore=storeDao.updateStorebill(new Storebill().setStorenum(num).setTomerchid(salebill.getMerch()))>0;
		    System.out.println("****************减少库存"+isStore);
		    return isStore;
		}
		
	}
	return isStore;
}

public boolean delSalebill(Salebill salebill)throws Exception 
{

return dao.updateSalebill(salebill.setSalestatus("0"))>0;
}

public boolean ckSalebillBySaleId(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillBySalebill(salebill.setSalestatus("1"))!=null;
}

@PageInter
public List<Salebill> getAllSalebillSta(Salebill sale) {
	// TODO Auto-generated method stub
	return dao.getAllSalebillSta(sale);
}
@PageInter
public List<Salebill> getAllSalebillByDate(Salebill sale) {
	// TODO Auto-generated method stub
	return dao.getAllSalebillByDate(sale);
}
@PageInter
public List<Salebill> getAllSalebillByName(Salebill sale) {
	// TODO Auto-generated method stub
	return dao.getAllSalebillByName(sale);
}


//按销售人/年统计图
public List<Salebill> getSalebillByName(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillByName(salebill);
}
//按当年统计图
public List<Salebill> getSalebillByYear(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillByYear(salebill);
}
//按当年月份统计图
public List<Salebill> getSalebillByMonth(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillByMonth(salebill);
}
//按购买人性别统计图
public List<Salebill> getSalebillBySex(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillBySex(salebill);
}
//按车辆类别统计图
public List<Salebill> getSalebillByKind(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillByKind(salebill);
}
//按车辆类别统计图
public List<Salebill> getSalebillByGroup(Salebill salebill) {
	// TODO Auto-generated method stub
	return dao.getSalebillByGroup(salebill);
}

//无分页销售信息
public List<Salebill> getallSalebillNotPage(Salebill sale) {
	// TODO Auto-generated method stub
	return dao.getallSalebillNotPage(sale);
}







}