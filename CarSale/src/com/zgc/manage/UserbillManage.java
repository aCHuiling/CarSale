package com.zgc.manage;
import com.zgc.model.Userbill;
import java.util.*;
import java.lang.Exception;

public interface UserbillManage 
{


public List<Userbill> getAllUserbill(Userbill userbill);

public Userbill getUserbillByUserbill(Userbill userbill);

public boolean addUserbill(Userbill userbill)throws Exception ;

public boolean updateUserbill(Userbill userbill)throws Exception ;

public boolean delUserbill(Userbill userbill)throws Exception ;

public Userbill login(Userbill user);

public boolean ckUserByName(String userName);

public Userbill getAllUserbillByEmp(Userbill user);


}