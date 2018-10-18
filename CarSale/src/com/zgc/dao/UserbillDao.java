package com.zgc.dao;
import com.zgc.model.Userbill;
import java.util.*;
import java.lang.Exception;

public interface UserbillDao 
{


public List<Userbill> getAllUserbill(Userbill userbill);

public Userbill getUserbillByUserbill(Userbill userbill);

public int addUserbill(Userbill userbill)throws Exception ;

public int updateUserbill(Userbill userbill)throws Exception ;

public int delUserbill(Userbill userbill)throws Exception ;

public Userbill getAllUserbillByEmp(Userbill user);

public Userbill getUserbillByUserStatus(Userbill userbill);


}