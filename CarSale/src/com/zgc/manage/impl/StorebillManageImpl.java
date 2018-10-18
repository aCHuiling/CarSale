package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.StorebillDao;
import com.zgc.manage.StorebillManage;
import com.zgc.model.Storebill;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class StorebillManageImpl implements StorebillManage 
{

	@Autowired
	private StorebillDao dao;
@PageInter
public List<Storebill> getAllStorebill(Storebill storebill)
{

return dao.getAllStorebill(storebill);
}

public Storebill getStorebillByStorebill(Storebill storebill)
{

return dao.getStorebillByStorebill(storebill);
}

public boolean addStorebill(Storebill storebill)throws Exception 
{

return false;
}

public boolean updateStorebill(Storebill storebill)throws Exception 
{

return false;
}

public boolean delStorebill(Storebill storebill)throws Exception 
{

return false;
}

public boolean ckSaleByMerchId(Storebill storebill) {
	// TODO Auto-generated method stub
	return dao.getStorebillByStorebill(storebill)!=null;
}


}