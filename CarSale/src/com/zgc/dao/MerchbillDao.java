package com.zgc.dao;
import com.zgc.model.Merchbill;
import java.util.*;
import java.lang.Exception;

public interface MerchbillDao 
{


public List<Merchbill> getAllMerchbill(Merchbill merchbill);

public Merchbill getMerchbillByMerchbill(Merchbill merchbill);

public int addMerchbill(Merchbill merchbill)throws Exception ;

public int updateMerchbill(Merchbill merchbill)throws Exception ;

public int delMerchbill(Merchbill merchbill)throws Exception ;


}