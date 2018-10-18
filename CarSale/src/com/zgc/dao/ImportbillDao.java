package com.zgc.dao;
import com.zgc.model.Importbill;
import java.util.*;
import java.lang.Exception;

public interface ImportbillDao 
{


public List<Importbill> getAllImportbill(Importbill importbill);

public Importbill getImportbillByImportbill(Importbill importbill);

public int addImportbill(Importbill importbill)throws Exception ;

public int updateImportbill(Importbill importbill)throws Exception ;

public int delImportbill(Importbill importbill)throws Exception ;


}