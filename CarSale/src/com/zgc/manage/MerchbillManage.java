package com.zgc.manage;
import com.zgc.model.Merchbill;
import java.util.*;
import java.lang.Exception;

public interface MerchbillManage 
{


public List<Merchbill> getAllMerchbill(Merchbill merchbill);

public Merchbill getMerchbillByMerchbill(Merchbill merchbill);

public boolean addMerchbill(Merchbill merchbill)throws Exception ;

public boolean updateMerchbill(Merchbill merchbill)throws Exception ;

public boolean delMerchbill(Merchbill merchbill)throws Exception ;

public List<Merchbill> getAllMerchbillId(Merchbill merch);

public boolean ckMerchByEnginenumber(Merchbill setEnginenumber);

public boolean ckMerchByVin(Merchbill setVin);



}