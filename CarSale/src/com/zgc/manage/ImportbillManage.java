package com.zgc.manage;
import com.zgc.model.Importbill;
import java.util.*;
import java.lang.Exception;

public interface ImportbillManage 
{


public List<Importbill> getAllImportbill(Importbill importbill);

public Importbill getImportbillByImportbill(Importbill importbill);

public boolean addImportbill(Importbill importbill)throws Exception ;

public boolean updateImportbill(Importbill importbill)throws Exception ;

public boolean delImportbill(Importbill importbill)throws Exception ;


}