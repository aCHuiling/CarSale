package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.ProfferbillDao;
import com.zgc.manage.ProfferbillManage;
import com.zgc.model.Profferbill;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class ProfferbillManageImpl implements ProfferbillManage 
{

	@Autowired
	private ProfferbillDao dao;

	@PageInter
public List<Profferbill> getAllProfferbill(Profferbill profferbill)
{

return dao.getAllProfferbill(profferbill);
}

//根据供货商号获取供货商信息
public Profferbill getProfferbillByProfferbill(Profferbill profferbill)
{

return dao.getProfferbillByProfferbill(profferbill);
}

//添加供货商信息
public boolean addProfferbill(Profferbill profferbill)throws Exception 
{

	boolean isSu=true;
	Profferbill profferbillModel=dao.getProfferbillByProfferbill(profferbill.setStatus("0"));
	if(profferbillModel!=null){
		isSu=dao.updateProfferbill(profferbill.setStatus("1").setProfferid(profferbillModel.getProfferid()))>0;
	}else{
		isSu=dao.addProfferbill(profferbill.setStatus("1"))>0;
	}
    return isSu;
}

public boolean updateProfferbill(Profferbill profferbill)throws Exception 
{

return dao.updateProfferbill(profferbill)>0;
}

public boolean delProfferbill(Profferbill profferbill)throws Exception 
{

return dao.updateProfferbill(profferbill)>0;
}

//判断供货商号是否存在 
public boolean ckProfferId(String profferId) {
	// TODO Auto-generated method stub
	return dao.getProfferbillByProfferbill(new Profferbill().setProfferid(profferId).setStatus("1"))!=null;
}

public List<Profferbill> getAllProfferId(Profferbill proffer) {
	// TODO Auto-generated method stub
	return dao.getAllProfferbill(proffer);
}


}