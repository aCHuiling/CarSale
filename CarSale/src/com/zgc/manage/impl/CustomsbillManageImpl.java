package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.CustomsbillDao;
import com.zgc.manage.CustomsbillManage;
import com.zgc.model.Customsbill;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class CustomsbillManageImpl implements CustomsbillManage 
{

	@Autowired
	private CustomsbillDao dao;

	@PageInter
public List<Customsbill> getAllCustomsbill(Customsbill customsbill)
{

return dao.getAllCustomsbill(customsbill);
}

public Customsbill getCustomsbillByCustomsbill(Customsbill customsbill)
{

return dao.getCustomsbillByCustomsbill(customsbill);
}

public boolean addCustomsbill(Customsbill customsbill)throws Exception 
{

return dao.addCustomsbill(customsbill.setCuststatus("1"))>0;
}

public boolean updateCustomsbill(Customsbill customsbill)throws Exception 
{

return dao.updateCustomsbill(customsbill.setCuststatus("1"))>0;
}

public boolean delCustomsbill(Customsbill customsbill)throws Exception 
{

return dao.updateCustomsbill(customsbill.setCuststatus("0"))>0;
}

//添加销售信息时判断客户姓名存不存在
public boolean getCustomsbillByName(Customsbill customsbill) {
	// TODO Auto-generated method stub
	return dao.getCustomsbillByCustomsbill(customsbill)!=null;
}


}