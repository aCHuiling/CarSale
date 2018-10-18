package com.zgc.manage;
import com.zgc.model.Storebill;
import java.util.*;
import java.lang.Exception;

public interface StorebillManage 
{


public List<Storebill> getAllStorebill(Storebill storebill);

public Storebill getStorebillByStorebill(Storebill storebill);

public boolean addStorebill(Storebill storebill)throws Exception ;

public boolean updateStorebill(Storebill storebill)throws Exception ;

public boolean delStorebill(Storebill storebill)throws Exception ;

public boolean ckSaleByMerchId(Storebill storebill);


}